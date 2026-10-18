#ifndef PLATFORM_PSP

#include "render.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

static u32 s_framebuffer[SCREEN_HEIGHT][SCREEN_WIDTH];
static u32 s_atlas[ATLAS_HEIGHT][ATLAS_WIDTH];
static bool s_atlas_loaded = false;

static void load_atlas_data(void) {
    if (s_atlas_loaded) return;

    FILE* f = fopen("assets/spritesheet_rgba8888.raw", "rb");
    if (f) {
        size_t read = fread(s_atlas, 4, ATLAS_WIDTH * ATLAS_HEIGHT, f);
        fclose(f);
        if (read == ATLAS_WIDTH * ATLAS_HEIGHT) {
            s_atlas_loaded = true;
            return;
        }
    }
    /* Fallback si no está el archivo binario: generar patrones básicos */
    memset(s_atlas, 0, sizeof(s_atlas));
    s_atlas_loaded = true;
}

void render_init(void) {
    load_atlas_data();
    render_clear(0xFF14121A);
}

void render_cleanup(void) {
}

void render_begin_frame(void) {
    render_clear(0xFF16131C); /* Fondo ambiental oscuro de Desolate Forest */
}

void render_clear(u32 color_hex) {
    for (s32 y = 0; y < SCREEN_HEIGHT; y++) {
        /* Gradiente atmosférico sutil en el cielo */
        f32 factor = (f32)y / (f32)SCREEN_HEIGHT;
        u8 r = (u8)(((color_hex >> 16) & 0xFF) * (0.8f + factor * 0.4f));
        u8 g = (u8)(((color_hex >> 8) & 0xFF) * (0.8f + factor * 0.4f));
        u8 b = (u8)((color_hex & 0xFF) * (0.8f + factor * 0.4f));
        u32 c = 0xFF000000 | (r << 16) | (g << 8) | b;
        for (s32 x = 0; x < SCREEN_WIDTH; x++) {
            s_framebuffer[y][x] = c;
        }
    }
}

void render_draw_rect(s32 x, s32 y, s32 w, s32 h, u32 color_rgba) {
    u8 a = (color_rgba >> 24) & 0xFF;
    if (a == 0) return;

    s32 x0 = (x < 0) ? 0 : x;
    s32 y0 = (y < 0) ? 0 : y;
    s32 x1 = (x + w > SCREEN_WIDTH) ? SCREEN_WIDTH : x + w;
    s32 y1 = (y + h > SCREEN_HEIGHT) ? SCREEN_HEIGHT : y + h;

    for (s32 cy = y0; cy < y1; cy++) {
        for (s32 cx = x0; cx < x1; cx++) {
            s_framebuffer[cy][cx] = color_rgba;
        }
    }
}

void render_draw_rect_outline(s32 x, s32 y, s32 w, s32 h, u32 color_rgba) {
    render_draw_rect(x, y, w, 1, color_rgba);
    render_draw_rect(x, y + h - 1, w, 1, color_rgba);
    render_draw_rect(x, y, 1, h, color_rgba);
    render_draw_rect(x + w - 1, y, 1, h, color_rgba);
}

void render_draw_sprite(SpriteId sprite_id, f32 screen_x, f32 screen_y, bool flip_x) {
    if (sprite_id >= SPRITE_COUNT) return;
    const SpriteDef* def = &g_sprite_defs[sprite_id];

    s32 dst_x = (s32)roundf(screen_x) - def->origin_x;
    s32 dst_y = (s32)roundf(screen_y) - def->origin_y;

    for (s32 sy = 0; sy < def->h; sy++) {
        s32 py = dst_y + sy;
        if (py < 0 || py >= SCREEN_HEIGHT) continue;

        for (s32 sx = 0; sx < def->w; sx++) {
            s32 px = dst_x + sx;
            if (px < 0 || px >= SCREEN_WIDTH) continue;

            s32 src_x = flip_x ? (def->u + def->w - 1 - sx) : (def->u + sx);
            s32 src_y = def->v + sy;

            u32 pixel = s_atlas[src_y][src_x];
            u8 a = (pixel >> 24) & 0xFF;
            if (a > 64) {
                s_framebuffer[py][px] = pixel;
            }
        }
    }
}

void render_draw_tile(u8 tile_type, bool is_surface, f32 screen_x, f32 screen_y) {
    if (tile_type == TILE_SOLID) {
        render_draw_sprite(is_surface ? SPRITE_TILE_SURFACE : SPRITE_TILE_SOLID, screen_x, screen_y, false);
    } else if (tile_type == TILE_PLATFORM) {
        render_draw_sprite(SPRITE_TILE_PLATFORM, screen_x, screen_y, false);
    } else if (tile_type == TILE_ROPE) {
        render_draw_sprite(SPRITE_ROPE, screen_x + 6, screen_y, false);
    }
}

void render_game_scene(const GameState* game) {
    const Camera* cam = &game->camera;
    const Map* map = &game->map;

    /* 1. Dibujar tiles del mapa visibles en el viewport (480x272) */
    s32 start_tx = (s32)(cam->x / TILE_SIZE) - 1;
    s32 end_tx   = start_tx + (SCREEN_WIDTH / TILE_SIZE) + 3;
    s32 start_ty = (s32)(cam->y / TILE_SIZE) - 1;
    s32 end_ty   = start_ty + (SCREEN_HEIGHT / TILE_SIZE) + 3;

    if (start_tx < 0) start_tx = 0;
    if (end_tx >= MAP_WIDTH_TILES) end_tx = MAP_WIDTH_TILES - 1;
    if (start_ty < 0) start_ty = 0;
    if (end_ty >= MAP_HEIGHT_TILES) end_ty = MAP_HEIGHT_TILES - 1;

    for (s32 ty = start_ty; ty <= end_ty; ty++) {
        f32 sy = (ty * TILE_SIZE) - cam->y;
        for (s32 tx = start_tx; tx <= end_tx; tx++) {
            u8 t = map->tiles[ty][tx];
            if (t != TILE_AIR) {
                f32 sx = (tx * TILE_SIZE) - cam->x;
                bool is_surface = (t == TILE_SOLID && (ty == 0 || map->tiles[ty - 1][tx] != TILE_SOLID));
                render_draw_tile(t, is_surface, sx, sy);
            }
        }
    }

    /* 2. Dibujar Objetos Interactables del Mapa */
    for (u16 i = 0; i < map->object_count; i++) {
        const MapObject* obj = &map->objects[i];
        if (!obj->active) continue;

        f32 sx = obj->x - cam->x;
        f32 sy = obj->y - cam->y;
        if (sx < -64 || sx > SCREEN_WIDTH + 64 || sy < -64 || sy > SCREEN_HEIGHT + 64) {
            continue;
        }

        switch (obj->type) {
            case OBJ_ESCAPE_POD:
                /* Cápsula de escape estrellada original */
                render_draw_sprite(SPRITE_ESCAPE_POD, sx, sy, false);
                break;
            case OBJ_TELEPORTER: {
                /* Teletransportador animado según carga */
                SpriteId tele_spr = SPRITE_TELEPORTER_0;
                if (map->teleporter_active) {
                    s32 frame = (s32)(map->teleporter_charge / 16.6f);
                    if (frame > 6) frame = 6;
                    tele_spr = (SpriteId)(SPRITE_TELEPORTER_0 + frame);
                }
                render_draw_sprite(tele_spr, sx, sy, false);
                break;
            }
            case OBJ_CHEST_SMALL:
                render_draw_sprite(obj->opened ? SPRITE_CHEST_SMALL_OPEN : SPRITE_CHEST_SMALL_CLOSED, sx, sy, false);
                break;
            case OBJ_CHEST_LARGE:
                render_draw_sprite(obj->opened ? SPRITE_CHEST_SMALL_OPEN : SPRITE_CHEST_LARGE_CLOSED, sx, sy, false);
                break;
            case OBJ_BARREL:
                render_draw_sprite(obj->opened ? SPRITE_BARREL_OPEN : SPRITE_BARREL_CLOSED, sx, sy, false);
                break;
            case OBJ_SHRINE_CHANCE:
                render_draw_sprite(obj->opened ? SPRITE_SHRINE_1 : SPRITE_SHRINE_0, sx, sy, false);
                break;
            default:
                break;
        }
    }

    /* 3. Dibujar Enemigos */
    for (int i = 0; i < MAX_ENEMIES; i++) {
        const Enemy* e = &game->enemies[i];
        if (!e->active) continue;

        f32 sx = e->x - cam->x;
        f32 sy = e->y - cam->y;
        if (sx < -32 || sx > SCREEN_WIDTH + 32 || sy < -32 || sy > SCREEN_HEIGHT + 32) continue;

        if (e->type == ENEMY_LEMURIAN) {
            SpriteId l_spr = SPRITE_LEMURIAN_IDLE;
            if (fabsf(e->vx) > 0.1f) {
                s32 step = ((s32)(e->x / 8.0f)) % 4;
                if (step < 0) step += 4;
                l_spr = (SpriteId)(SPRITE_LEMURIAN_WALK_0 + step);
            }
            render_draw_sprite(l_spr, sx, sy, !e->facing_right);
        } else if (e->type == ENEMY_WISP) {
            s32 f = ((s32)(e->y / 4.0f)) % 4;
            if (f < 0) f += 4;
            render_draw_sprite((SpriteId)(SPRITE_WISP_0 + f), sx, sy, !e->facing_right);
        } else if (e->type == ENEMY_BOSS_COLOSSUS) {
            /* Jefe Coloso: sprite grande */
            render_draw_sprite(SPRITE_SHRINE_0, sx, sy, !e->facing_right);
        }

        /* Barra de HP de enemigo */
        f32 hp_ratio = e->hp / e->max_hp;
        if (hp_ratio < 1.0f) {
            render_draw_rect((s32)(sx - 10), (s32)(sy - 22), 20, 3, 0xFF303030);
            render_draw_rect((s32)(sx - 10), (s32)(sy - 22), (s32)(20 * hp_ratio), 3, 0xFF0000FF);
        }
    }

    /* 4. Dibujar Proyectiles */
    for (int i = 0; i < MAX_PROJECTILES; i++) {
        const Projectile* p = &game->projectiles[i];
        if (!p->active) continue;

        f32 sx = p->x - cam->x;
        f32 sy = p->y - cam->y;
        /* Bala trazadora dorada de Commando */
        render_draw_rect((s32)sx, (s32)sy, 4, 2, 0xFF00EAFF);
    }

    /* 5. Dibujar Jugador (Commando) */
    const Player* pl = &game->player;
    f32 psx = pl->x - cam->x;
    f32 psy = pl->y - cam->y;

    SpriteId pl_sprite = SPRITE_COMMANDO_IDLE;
    if (pl->climbing) {
        s32 climb_frame = ((s32)(pl->y / 6.0f)) % 2;
        if (climb_frame < 0) climb_frame += 2;
        pl_sprite = (climb_frame == 0) ? SPRITE_COMMANDO_CLIMB_0 : SPRITE_COMMANDO_CLIMB_1;
    } else if (!pl->grounded) {
        pl_sprite = SPRITE_COMMANDO_JUMP;
    } else if (fabsf(pl->vx) > 0.2f) {
        s32 run_frame = ((s32)(pl->x / 6.0f)) % 8;
        if (run_frame < 0) run_frame += 8;
        pl_sprite = (SpriteId)(SPRITE_COMMANDO_RUN_0 + run_frame);
    }
    render_draw_sprite(pl_sprite, psx, psy, !pl->facing_right);

    /* 6. Dibujar Daño / Popups */
    for (int i = 0; i < MAX_DAMAGE_POPUPS; i++) {
        const DamagePopup* pop = &game->popups[i];
        if (!pop->active) continue;
        f32 pop_sx = pop->x - cam->x;
        f32 pop_sy = pop->y - cam->y;
        u32 pop_col = pop->is_crit ? 0xFF0055FF : 0xFFFFFFFF;
        render_draw_rect((s32)pop_sx, (s32)pop_sy, 3, 4, pop_col);
    }
}

void render_hud(const GameState* game) {
    const Player* p = &game->player;
    const Director* d = &game->director;

    /* Barra Superior: Tiempo y Dificultad */
    render_draw_rect(0, 0, SCREEN_WIDTH, 14, 0xCC101015);

    /* Medidor de Dificultad (Barra segmentada de Risk of Rain) */
    s32 diff_w = 120;
    render_draw_rect(SCREEN_WIDTH - diff_w - 8, 3, diff_w, 8, 0xFF2A2A35);
    f32 diff_progress = fmodf(d->total_seconds, 300.0f) / 300.0f;
    render_draw_rect(SCREEN_WIDTH - diff_w - 8, 3, (s32)(diff_w * diff_progress), 8, 0xFF4080E0);
    render_draw_rect_outline(SCREEN_WIDTH - diff_w - 8, 3, diff_w, 8, 0xFFFFFFFF);

    /* Barra Inferior: Salud de Commando y Habilidades */
    render_draw_rect(0, SCREEN_HEIGHT - 22, SCREEN_WIDTH, 22, 0xEE121216);

    /* Barra de HP (Verde / Rojo) */
    s32 hp_bar_w = 140;
    render_draw_rect(10, SCREEN_HEIGHT - 17, hp_bar_w, 10, 0xFF202020);
    f32 hp_ratio = p->hp / p->max_hp;
    if (hp_ratio > 0.0f) {
        render_draw_rect(10, SCREEN_HEIGHT - 17, (s32)(hp_bar_w * hp_ratio), 10, 0xFF35BA50);
    }
    render_draw_rect_outline(10, SCREEN_HEIGHT - 17, hp_bar_w, 10, 0xFF888888);

    /* 4 Casillas de Habilidades (Z, X, C, V / Cuadrado, Triangulo, Circulo, R) */
    s32 skill_start_x = (SCREEN_WIDTH / 2) - 40;
    for (int i = 0; i < 4; i++) {
        s32 bx = skill_start_x + (i * 20);
        s32 by = SCREEN_HEIGHT - 18;
        render_draw_rect(bx, by, 16, 14, 0xFF383842);
        if (!p->skills[i].is_ready) {
            f32 cd_pct = p->skills[i].cooldown_current / p->skills[i].cooldown_max;
            render_draw_rect(bx, by, 16, (s32)(14 * cd_pct), 0xAA0000AA);
        }
        render_draw_rect_outline(bx, by, 16, 14, 0xFFAAAAAA);
    }

    /* Indicador del Teletransportador si está activo */
    if (game->map.teleporter_active) {
        s32 tele_w = 80;
        s32 tx = (SCREEN_WIDTH / 2) - (tele_w / 2);
        render_draw_rect(tx, 18, tele_w, 7, 0xFF222222);
        render_draw_rect(tx, 18, (s32)(tele_w * (game->map.teleporter_charge / 100.0f)), 7, 0xFFE08020);
        render_draw_rect_outline(tx, 18, tele_w, 7, 0xFFFFFFFF);
    }
}

void render_end_frame(void) {
    /* En PC simplemente mantenemos el buffer en memoria */
}

/* Exportador BMP de 32 bits estándar para visualización directa en PC */
#pragma pack(push, 1)
typedef struct {
    u16 bfType;
    u32 bfSize;
    u16 bfReserved1;
    u16 bfReserved2;
    u32 bfOffBits;
} BMPFileHeader;

typedef struct {
    u32 biSize;
    s32 biWidth;
    s32 biHeight;
    u16 biPlanes;
    u16 biBitCount;
    u32 biCompression;
    u32 biSizeImage;
    s32 biXPelsPerMeter;
    s32 biYPelsPerMeter;
    u32 biClrUsed;
    u32 biClrImportant;
} BMPInfoHeader;
#pragma pack(pop)

void render_save_screenshot(const char* filepath) {
    FILE* f = fopen(filepath, "wb");
    if (!f) return;

    BMPFileHeader fh;
    BMPInfoHeader ih;

    u32 row_size = SCREEN_WIDTH * 4;
    u32 image_size = row_size * SCREEN_HEIGHT;

    fh.bfType = 0x4D42; /* 'BM' */
    fh.bfSize = sizeof(BMPFileHeader) + sizeof(BMPInfoHeader) + image_size;
    fh.bfReserved1 = 0;
    fh.bfReserved2 = 0;
    fh.bfOffBits = sizeof(BMPFileHeader) + sizeof(BMPInfoHeader);

    ih.biSize = sizeof(BMPInfoHeader);
    ih.biWidth = SCREEN_WIDTH;
    ih.biHeight = SCREEN_HEIGHT; /* Bottom-up */
    ih.biPlanes = 1;
    ih.biBitCount = 32;
    ih.biCompression = 0;
    ih.biSizeImage = image_size;
    ih.biXPelsPerMeter = 2835;
    ih.biYPelsPerMeter = 2835;
    ih.biClrUsed = 0;
    ih.biClrImportant = 0;

    fwrite(&fh, sizeof(fh), 1, f);
    fwrite(&ih, sizeof(ih), 1, f);

    /* En BMP el orden de líneas va de abajo hacia arriba */
    for (s32 y = SCREEN_HEIGHT - 1; y >= 0; y--) {
        for (s32 x = 0; x < SCREEN_WIDTH; x++) {
            u32 rgba = s_framebuffer[y][x];
            /* Convertir RGBA a BGRA para BMP */
            u8 r = (rgba >> 0) & 0xFF;
            u8 g = (rgba >> 8) & 0xFF;
            u8 b = (rgba >> 16) & 0xFF;
            u8 a = (rgba >> 24) & 0xFF;
            u32 bgra = (a << 24) | (r << 16) | (g << 8) | b;
            fwrite(&bgra, 4, 1, f);
        }
    }

    fclose(f);
}

#endif /* !PLATFORM_PSP */
