#ifdef PLATFORM_PSP

#include <pspkernel.h>
#include <pspdisplay.h>
#include <pspdebug.h>
#include <pspgu.h>
#include <pspgum.h>
#include <stdio.h>
#include <string.h>
#include <math.h>

#include "../include/render.h"
#include "../include/sprites.h"

#define BUF_WIDTH (512)
#define SCR_WIDTH (480)
#define SCR_HEIGHT (272)

static unsigned int __attribute__((aligned(16))) list[262144];

/* Punteros a los buffers en VRAM (2MB total) */
static void* fbp0 = (void*)0;
static void* fbp1 = (void*)(512 * 272 * 2);
static void* zbp  = (void*)(512 * 272 * 2 * 2);

/* Buffer de textura en RAM / VRAM */
static u16 atlas_texture[ATLAS_HEIGHT][ATLAS_WIDTH] __attribute__((aligned(16)));
static bool atlas_loaded = false;

typedef struct {
    u16 u, v;
    s16 x, y, z;
} SpriteVertex;

#include "spritesheet_data.h"

static void load_atlas_texture(void) {
    if (atlas_loaded) return;
    /* 1. Intentar cargar atlas externo si existe en la Memory Stick */
    FILE* f = fopen("assets/spritesheet_rgba5551.raw", "rb");
    if (!f) f = fopen("spritesheet_rgba5551.raw", "rb");
    if (f) {
        fread(atlas_texture, 2, ATLAS_WIDTH * ATLAS_HEIGHT, f);
        fclose(f);
        atlas_loaded = true;
    } else {
        /* 2. Fallback autónomo: usar el atlas embebido en la ROM/EBOOT */
        memcpy(atlas_texture, g_embedded_spritesheet, sizeof(atlas_texture));
        atlas_loaded = true;
    }
}

void render_init(void) {
    load_atlas_texture();

    sceGuInit();
    sceGuStart(GU_DIRECT, list);

    /* Configurar Buffers de Pantalla (Formato RGBA 5551 de alta velocidad) */
    sceGuDrawBuffer(GU_PSM_5551, fbp0, BUF_WIDTH);
    sceGuDispBuffer(SCR_WIDTH, SCR_HEIGHT, fbp1, BUF_WIDTH);
    sceGuDepthBuffer(zbp, BUF_WIDTH);

    /* Viewport centrado en pantalla de la PSP */
    sceGuOffset(2048 - (SCR_WIDTH / 2), 2048 - (SCR_HEIGHT / 2));
    sceGuViewport(2048, 2048, SCR_WIDTH, SCR_HEIGHT);
    sceGuDepthRange(65535, 0);

    /* Scissor test para recortar fuera de 480x272 */
    sceGuScissor(0, 0, SCR_WIDTH, SCR_HEIGHT);
    sceGuEnable(GU_SCISSOR_TEST);

    /* Alpha blending y prueba de transparencia para sprites */
    sceGuAlphaFunc(GU_GREATER, 0, 0x01);
    sceGuEnable(GU_ALPHA_TEST);
    sceGuEnable(GU_BLEND);
    sceGuBlendFunc(GU_ADD, GU_SRC_ALPHA, GU_ONE_MINUS_SRC_ALPHA, 0, 0);

    /* Filtrado de texturas Nearest (Pixel Art nítido) */
    sceGuEnable(GU_TEXTURE_2D);
    sceGuTexMode(GU_PSM_5551, 0, 0, 0);
    sceGuTexImage(0, ATLAS_WIDTH, ATLAS_HEIGHT, ATLAS_WIDTH, atlas_texture);
    sceGuTexFunc(GU_TFX_REPLACE, GU_TCC_RGBA);
    sceGuTexFilter(GU_NEAREST, GU_NEAREST);

    sceGuFinish();
    sceGuSync(0, 0);

    sceDisplayWaitVblankStart();
    sceGuDisplay(GU_TRUE);
}

void render_cleanup(void) {
    sceGuDisplay(GU_FALSE);
    sceGuTerm();
}

void render_begin_frame(void) {
    sceGuStart(GU_DIRECT, list);
    /* Limpiar pantalla con el color de fondo nocturno de RoR */
    sceGuClearColor(0xFF16131C);
    sceGuClear(GU_COLOR_BUFFER_BIT);
}

void render_draw_sprite(SpriteId sprite_id, f32 screen_x, f32 screen_y, bool flip_x) {
    if (sprite_id >= SPRITE_COUNT) return;
    const SpriteDef* def = &g_sprite_defs[sprite_id];

    s32 x0 = (s32)roundf(screen_x) - def->origin_x;
    s32 y0 = (s32)roundf(screen_y) - def->origin_y;
    s32 x1 = x0 + def->w;
    s32 y1 = y0 + def->h;

    /* Recorte temprano fuera de pantalla */
    if (x1 < 0 || x0 >= SCR_WIDTH || y1 < 0 || y0 >= SCR_HEIGHT) return;

    u16 u0 = flip_x ? (def->u + def->w) : def->u;
    u16 u1 = flip_x ? def->u : (def->u + def->w);
    u16 v0 = def->v;
    u16 v1 = def->v + def->h;

    SpriteVertex* vertices = (SpriteVertex*)sceGuGetMemory(2 * sizeof(SpriteVertex));
    vertices[0].u = u0; vertices[0].v = v0;
    vertices[0].x = (s16)x0; vertices[0].y = (s16)y0; vertices[0].z = 0;

    vertices[1].u = u1; vertices[1].v = v1;
    vertices[1].x = (s16)x1; vertices[1].y = (s16)y1; vertices[1].z = 0;

    sceGuDrawArray(GU_SPRITES, GU_TEXTURE_16BIT | GU_VERTEX_16BIT | GU_TRANSFORM_2D, 2, 0, vertices);
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

void render_draw_rect(s32 x, s32 y, s32 w, s32 h, u32 color_rgba) {
    sceGuDisable(GU_TEXTURE_2D);

    u8 r = (color_rgba >> 0) & 0xFF;
    u8 g = (color_rgba >> 8) & 0xFF;
    u8 b = (color_rgba >> 16) & 0xFF;
    u8 a = (color_rgba >> 24) & 0xFF;

    sceGuColor(GU_RGBA(r, g, b, a));

    SpriteVertex* vertices = (SpriteVertex*)sceGuGetMemory(2 * sizeof(SpriteVertex));
    vertices[0].u = 0; vertices[0].v = 0;
    vertices[0].x = (s16)x; vertices[0].y = (s16)y; vertices[0].z = 0;

    vertices[1].u = 0; vertices[1].v = 0;
    vertices[1].x = (s16)(x + w); vertices[1].y = (s16)(y + h); vertices[1].z = 0;

    sceGuDrawArray(GU_SPRITES, GU_TEXTURE_16BIT | GU_VERTEX_16BIT | GU_TRANSFORM_2D, 2, 0, vertices);
    sceGuEnable(GU_TEXTURE_2D);
}

void render_game_scene(const GameState* game) {
    const Camera* cam = &game->camera;
    const Map* map = &game->map;

    /* 1. Dibujar tiles del mapa visibles en el viewport (480x272) */
    s32 start_tx = (s32)(cam->x / TILE_SIZE) - 1;
    s32 end_tx   = start_tx + (SCR_WIDTH / TILE_SIZE) + 3;
    s32 start_ty = (s32)(cam->y / TILE_SIZE) - 1;
    s32 end_ty   = start_ty + (SCR_HEIGHT / TILE_SIZE) + 3;

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
        if (sx < -64 || sx > SCR_WIDTH + 64 || sy < -64 || sy > SCR_HEIGHT + 64) continue;

        switch (obj->type) {
            case OBJ_ESCAPE_POD:
                render_draw_sprite(SPRITE_ESCAPE_POD, sx, sy, false);
                break;
            case OBJ_TELEPORTER: {
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
        if (sx < -32 || sx > SCR_WIDTH + 32 || sy < -32 || sy > SCR_HEIGHT + 32) continue;

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
            render_draw_sprite(SPRITE_SHRINE_0, sx, sy, !e->facing_right);
        }
    }

    /* 4. Dibujar Proyectiles */
    for (int i = 0; i < MAX_PROJECTILES; i++) {
        const Projectile* p = &game->projectiles[i];
        if (!p->active) continue;
        f32 sx = p->x - cam->x;
        f32 sy = p->y - cam->y;
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
}

void render_hud(const GameState* game) {
    const Player* p = &game->player;
    const Director* d = &game->director;

    /* Barra Superior */
    render_draw_rect(0, 0, SCR_WIDTH, 14, 0xCC101015);

    /* Medidor de Dificultad */
    s32 diff_w = 120;
    render_draw_rect(SCR_WIDTH - diff_w - 8, 3, diff_w, 8, 0xFF2A2A35);
    f32 diff_progress = fmodf(d->total_seconds, 300.0f) / 300.0f;
    render_draw_rect(SCR_WIDTH - diff_w - 8, 3, (s32)(diff_w * diff_progress), 8, 0xFF4080E0);

    /* Barra Inferior */
    render_draw_rect(0, SCR_HEIGHT - 20, SCR_WIDTH, 20, 0xEE121216);

    /* Barra de Salud */
    s32 hp_bar_w = 120;
    render_draw_rect(10, SCR_HEIGHT - 16, hp_bar_w, 10, 0xFF202020);
    f32 hp_ratio = p->hp / p->max_hp;
    if (hp_ratio > 0.0f) {
        render_draw_rect(10, SCR_HEIGHT - 16, (s32)(hp_bar_w * hp_ratio), 10, 0xFF35BA50);
    }

    /* 4 Habilidades */
    s32 skill_start_x = (SCR_WIDTH / 2) - 40;
    for (int i = 0; i < 4; i++) {
        s32 bx = skill_start_x + (i * 20);
        s32 by = SCR_HEIGHT - 17;
        render_draw_rect(bx, by, 16, 12, 0xFF383842);
        if (!p->skills[i].is_ready) {
            f32 cd_pct = p->skills[i].cooldown_current / p->skills[i].cooldown_max;
            render_draw_rect(bx, by, 16, (s32)(12 * cd_pct), 0xAA0000AA);
        }
    }
}

void render_end_frame(void) {
    sceGuFinish();
    sceGuSync(0, 0);

    sceDisplayWaitVblankStart();
    sceGuSwapBuffers();
}

#endif /* PLATFORM_PSP */
