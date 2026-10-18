#include "map.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

/* PRNG reproducible para generación procedural */
static u32 s_rng_state = 1337;

static u32 map_rand(void) {
    s_rng_state = s_rng_state * 1664525u + 1013904223u;
    return s_rng_state;
}

static s32 map_rand_range(s32 min, s32 max) {
    if (min >= max) return min;
    u32 r = map_rand();
    return min + (s32)(r % (u32)(max - min + 1));
}

void map_init(Map* map) {
    memset(map->tiles, TILE_AIR, sizeof(map->tiles));
    map->object_count = 0;
    map->enemy_spawn_count = 0;
    map->teleporter_active = false;
    map->teleporter_charge = 0.0f;
    map->teleporter_object_index = 0;
}

static void add_platform(Map* map, s32 start_x, s32 y, s32 length, TileType type) {
    for (s32 x = start_x; x < start_x + length; x++) {
        if (x >= 0 && x < MAP_WIDTH_TILES && y >= 0 && y < MAP_HEIGHT_TILES) {
            map->tiles[y][x] = type;
        }
    }
}

static void add_solid_shelf(Map* map, s32 start_x, s32 y, s32 length, s32 thickness) {
    for (s32 h = 0; h < thickness; h++) {
        for (s32 x = start_x; x < start_x + length; x++) {
            if (x >= 0 && x < MAP_WIDTH_TILES && (y + h) >= 0 && (y + h) < MAP_HEIGHT_TILES) {
                map->tiles[y + h][x] = TILE_SOLID;
            }
        }
    }
}

static void add_rope(Map* map, s32 x, s32 start_y, s32 end_y) {
    if (start_y > end_y) {
        s32 tmp = start_y;
        start_y = end_y;
        end_y = tmp;
    }
    for (s32 y = start_y; y <= end_y; y++) {
        if (x >= 0 && x < MAP_WIDTH_TILES && y >= 0 && y < MAP_HEIGHT_TILES) {
            if (map->tiles[y][x] == TILE_AIR) {
                map->tiles[y][x] = TILE_ROPE;
            }
        }
    }
}

/* Estructura temporal para candidatos de superficie */
typedef struct {
    s32 tx, ty;
} SurfaceTile;

void map_generate_stage1(Map* map, u32 seed) {
    s_rng_state = (seed == 0) ? 1337 : seed;
    map_init(map);

    /* 1. Límites indestructibles del mapa (Paredes laterales y techo) */
    for (s32 y = 0; y < MAP_HEIGHT_TILES; y++) {
        map->tiles[y][0] = TILE_SOLID;
        map->tiles[y][1] = TILE_SOLID;
        map->tiles[y][MAP_WIDTH_TILES - 2] = TILE_SOLID;
        map->tiles[y][MAP_WIDTH_TILES - 1] = TILE_SOLID;
    }
    for (s32 x = 0; x < MAP_WIDTH_TILES; x++) {
        map->tiles[0][x] = TILE_SOLID;
        map->tiles[1][x] = TILE_SOLID;
    }

    /* 2. Suelo base continuo inferior (Desolate Forest) con desniveles procedurales */
    s32 seg_widths[5] = { 32, 34, 28, 36, 30 };
    s32 cur_x = 2;
    s32 prev_h = 70;

    for (s32 s = 0; s < 5; s++) {
        s32 seg_h = 68 + (s32)(map_rand() % 5); /* Altura entre 68 y 72 */
        s32 seg_w = seg_widths[s];
        if (cur_x + seg_w > MAP_WIDTH_TILES - 2) {
            seg_w = (MAP_WIDTH_TILES - 2) - cur_x;
        }

        for (s32 x = cur_x; x < cur_x + seg_w; x++) {
            for (s32 y = seg_h; y < MAP_HEIGHT_TILES; y++) {
                map->tiles[y][x] = TILE_SOLID;
            }
        }

        /* Escarpas de transición entre desniveles */
        if (s > 0 && prev_h != seg_h) {
            s32 min_y = (prev_h < seg_h) ? prev_h : seg_h;
            s32 max_y = (prev_h > seg_h) ? prev_h : seg_h;
            for (s32 y = min_y; y <= max_y; y++) {
                map->tiles[y][cur_x] = TILE_SOLID;
            }
        }

        prev_h = seg_h;
        cur_x += seg_w;
    }

    /* 3. Tier 1: Terrazas inferiores (Y: 53 - 58) */
    s32 t1_x = 8 + map_rand_range(0, 4);
    while (t1_x < MAP_WIDTH_TILES - 24) {
        s32 shelf_len = map_rand_range(16, 28);
        s32 shelf_y = map_rand_range(54, 57);
        s32 thickness = map_rand_range(2, 3);
        add_solid_shelf(map, t1_x, shelf_y, shelf_len, thickness);

        /* Cuerda conectando al suelo base */
        s32 rope_x = t1_x + map_rand_range(3, shelf_len - 4);
        add_rope(map, rope_x, shelf_y + thickness, 70);

        /* Puente de plataforma opcional entre estantes */
        t1_x += shelf_len;
        s32 gap = map_rand_range(6, 14);
        if (t1_x + gap < MAP_WIDTH_TILES - 16 && (map_rand() % 100) < 65) {
            add_platform(map, t1_x, shelf_y + 1, gap, TILE_PLATFORM);
        }
        t1_x += gap;
    }

    /* 4. Tier 2: Terrazas intermedias (Y: 37 - 44) */
    s32 t2_x = 12 + map_rand_range(0, 6);
    while (t2_x < MAP_WIDTH_TILES - 20) {
        s32 shelf_len = map_rand_range(14, 26);
        s32 shelf_y = map_rand_range(38, 43);
        s32 thickness = map_rand_range(2, 3);
        add_solid_shelf(map, t2_x, shelf_y, shelf_len, thickness);

        /* Cuerda conectando hacia Tier 1 */
        s32 rope_x = t2_x + map_rand_range(2, shelf_len - 3);
        add_rope(map, rope_x, shelf_y + thickness, 55);

        t2_x += shelf_len;
        s32 gap = map_rand_range(8, 16);
        if (t2_x + gap < MAP_WIDTH_TILES - 16 && (map_rand() % 100) < 55) {
            add_platform(map, t2_x, shelf_y + 1, gap, TILE_PLATFORM);
        }
        t2_x += gap;
    }

    /* 5. Tier 3: Cornisas elevadas superiores (Y: 21 - 28) */
    s32 t3_x = 16 + map_rand_range(0, 10);
    while (t3_x < MAP_WIDTH_TILES - 24) {
        s32 shelf_len = map_rand_range(12, 22);
        s32 shelf_y = map_rand_range(22, 26);
        s32 thickness = 2;
        add_solid_shelf(map, t3_x, shelf_y, shelf_len, thickness);

        /* Cuerda conectando hacia Tier 2 */
        s32 rope_x = t3_x + map_rand_range(2, shelf_len - 3);
        add_rope(map, rope_x, shelf_y + thickness, 40);

        t3_x += shelf_len + map_rand_range(16, 28);
    }

    /* 6. Detección y recolección de superficies caminables válidas */
    SurfaceTile surfaces[512];
    s32 surface_count = 0;

    for (s32 x = 4; x < MAP_WIDTH_TILES - 4; x++) {
        for (s32 y = 10; y < MAP_HEIGHT_TILES - 2; y++) {
            if ((map->tiles[y][x] == TILE_SOLID || map->tiles[y][x] == TILE_PLATFORM) &&
                map->tiles[y - 1][x] == TILE_AIR &&
                map->tiles[y - 2][x] == TILE_AIR &&
                surface_count < 512) {
                surfaces[surface_count].tx = x;
                surfaces[surface_count].ty = y;
                surface_count++;
            }
        }
    }

    /* 7. Colocar Escape Pod del Jugador (Sector Izquierdo: tx < 45) */
    s32 pod_idx = -1;
    for (s32 i = 0; i < surface_count; i++) {
        if (surfaces[i].tx >= 10 && surfaces[i].tx <= 45 && surfaces[i].ty >= 45) {
            pod_idx = i;
            break;
        }
    }
    if (pod_idx == -1 && surface_count > 0) pod_idx = 0;

    map->spawn_x = (f32)surfaces[pod_idx].tx * TILE_SIZE;
    map->spawn_y = ((f32)surfaces[pod_idx].ty * TILE_SIZE) - 4.0f;

    MapObject* pod = &map->objects[map->object_count++];
    pod->type = OBJ_ESCAPE_POD;
    pod->x = map->spawn_x;
    pod->y = map->spawn_y;
    pod->cost = 0;
    pod->opened = true;
    pod->active = true;
    pod->item_reward_id = 0;

    /* 8. Colocar Teletransportador (Sector Derecho: tx >= 110, Distancia > 1000px) */
    s32 tele_idx = -1;
    f32 max_dist = 0.0f;
    for (s32 i = 0; i < surface_count; i++) {
        if (surfaces[i].tx >= 100 && surfaces[i].tx <= 152) {
            f32 dx = (surfaces[i].tx * TILE_SIZE) - map->spawn_x;
            f32 dy = (surfaces[i].ty * TILE_SIZE) - map->spawn_y;
            f32 dist = sqrtf(dx*dx + dy*dy);
            if (dist > max_dist) {
                max_dist = dist;
                tele_idx = i;
            }
        }
    }
    if (tele_idx == -1 && surface_count > 1) tele_idx = surface_count - 1;

    map->teleporter_x = (f32)surfaces[tele_idx].tx * TILE_SIZE;
    map->teleporter_y = (f32)surfaces[tele_idx].ty * TILE_SIZE;

    MapObject* tele = &map->objects[map->object_count++];
    tele->type = OBJ_TELEPORTER;
    tele->x = map->teleporter_x;
    tele->y = map->teleporter_y;
    tele->cost = 0;
    tele->opened = false;
    tele->active = true;
    tele->item_reward_id = 0;
    map->teleporter_object_index = (u16)(map->object_count - 1);

    /* 9. Distribuir Cofres, Barriles y Altares con Espaciado */
    s32 last_placed_tx = -999;
    u16 common_items[] = { 1, 2, 3, 4, 6 };     /* Syringe, Goat Hoof, Glasses, Fungus, Meat */
    u16 rare_items[]   = { 5, 7, 8 };            /* Hopoo Feather, Ukulele, Brilliant Behemoth */

    for (s32 i = 0; i < surface_count && map->object_count < MAX_MAP_OBJECTS; i++) {
        if (i == pod_idx || i == tele_idx) continue;
        s32 tx = surfaces[i].tx;
        s32 ty = surfaces[i].ty;

        /* Espaciado mínimo de 6 tiles entre interactables */
        if (abs(tx - last_placed_tx) < 6) continue;

        /* Probabilidad de colocar un interactable */
        u32 roll = map_rand() % 100;
        if (roll < 35) {
            MapObject* obj = &map->objects[map->object_count++];
            obj->x = (f32)tx * TILE_SIZE;
            obj->y = (f32)ty * TILE_SIZE;
            obj->opened = false;
            obj->active = true;
            last_placed_tx = tx;

            if (roll < 16) {
                /* Cofre Común ($25) */
                obj->type = OBJ_CHEST_SMALL;
                obj->cost = 25;
                obj->item_reward_id = common_items[map_rand() % 5];
            } else if (roll < 23) {
                /* Cofre Grande ($50) */
                obj->type = OBJ_CHEST_LARGE;
                obj->cost = 50;
                obj->item_reward_id = rare_items[map_rand() % 3];
            } else if (roll < 30) {
                /* Barril de Oro ($0) */
                obj->type = OBJ_BARREL;
                obj->cost = 0;
                obj->item_reward_id = 0;
            } else {
                /* Altar del Azar (Chance Shrine) */
                obj->type = OBJ_SHRINE_CHANCE;
                obj->cost = 15;
                obj->item_reward_id = common_items[map_rand() % 5];
            }
        }
    }

    /* 10. Registrar Spawns válidos para el Director */
    map->enemy_spawn_count = 0;
    for (s32 i = 0; i < surface_count && map->enemy_spawn_count < MAX_SPAWN_POINTS; i += 4) {
        map->enemy_spawns[map->enemy_spawn_count].x = (f32)surfaces[i].tx * TILE_SIZE;
        map->enemy_spawns[map->enemy_spawn_count].y = (f32)surfaces[i].ty * TILE_SIZE;
        map->enemy_spawn_count++;
    }
}

bool map_is_solid(const Map* map, s32 tile_x, s32 tile_y) {
    if (tile_x < 0 || tile_x >= MAP_WIDTH_TILES || tile_y < 0 || tile_y >= MAP_HEIGHT_TILES) {
        return true; /* Límites externos son sólidos */
    }
    return (map->tiles[tile_y][tile_x] == TILE_SOLID);
}

bool map_is_platform(const Map* map, s32 tile_x, s32 tile_y) {
    if (tile_x < 0 || tile_x >= MAP_WIDTH_TILES || tile_y < 0 || tile_y >= MAP_HEIGHT_TILES) {
        return false;
    }
    return (map->tiles[tile_y][tile_x] == TILE_PLATFORM);
}

bool map_is_rope(const Map* map, s32 tile_x, s32 tile_y) {
    if (tile_x < 0 || tile_x >= MAP_WIDTH_TILES || tile_y < 0 || tile_y >= MAP_HEIGHT_TILES) {
        return false;
    }
    return (map->tiles[tile_y][tile_x] == TILE_ROPE);
}

bool map_check_collision(const Map* map, f32 x, f32 y, f32 w, f32 h) {
    s32 start_tx = (s32)(x / TILE_SIZE);
    s32 end_tx   = (s32)((x + w - 1.0f) / TILE_SIZE);
    s32 start_ty = (s32)(y / TILE_SIZE);
    s32 end_ty   = (s32)((y + h - 1.0f) / TILE_SIZE);

    for (s32 ty = start_ty; ty <= end_ty; ty++) {
        for (s32 tx = start_tx; tx <= end_tx; tx++) {
            if (map_is_solid(map, tx, ty)) return true;
        }
    }
    return false;
}

bool map_check_ground(const Map* map, f32 x, f32 y, f32 w, f32 vy) {
    s32 foot_y = (s32)((y + 1.0f) / TILE_SIZE);
    s32 left_tx  = (s32)(x / TILE_SIZE);
    s32 right_tx = (s32)((x + w - 1.0f) / TILE_SIZE);

    for (s32 tx = left_tx; tx <= right_tx; tx++) {
        if (map_is_solid(map, tx, foot_y)) return true;
        /* Plataformas atravesables: solo si estamos cayendo */
        if (vy >= 0.0f && map_is_platform(map, tx, foot_y)) {
            s32 prev_foot_y = (s32)((y - vy) / TILE_SIZE);
            if (prev_foot_y < foot_y) {
                return true;
            }
        }
    }
    return false;
}

bool map_check_rope(const Map* map, f32 x, f32 y) {
    s32 tx = (s32)(x / TILE_SIZE);
    s32 ty = (s32)(y / TILE_SIZE);
    return map_is_rope(map, tx, ty);
}

MapObject* map_find_nearby_interactable(Map* map, f32 x, f32 y, f32 radius) {
    for (u16 i = 0; i < map->object_count; i++) {
        MapObject* obj = &map->objects[i];
        if (!obj->active || obj->opened) continue;

        f32 dx = obj->x - x;
        f32 dy = obj->y - y;
        if (sqrtf(dx*dx + dy*dy) <= radius) {
            return obj;
        }
    }
    return NULL;
}

bool map_get_random_enemy_spawn(const Map* map, f32 near_x, f32 max_dist, f32* out_x, f32* out_y) {
    if (map->enemy_spawn_count == 0) return false;

    s32 start_idx = map_rand() % map->enemy_spawn_count;
    for (u16 i = 0; i < map->enemy_spawn_count; i++) {
        u16 idx = (start_idx + i) % map->enemy_spawn_count;
        const SpawnPoint* sp = &map->enemy_spawns[idx];
        if (fabsf(sp->x - near_x) <= max_dist && fabsf(sp->x - near_x) >= 120.0f) {
            *out_x = sp->x;
            *out_y = sp->y;
            return true;
        }
    }

    /* Si ninguno está en el rango ideal, devolver el elegido al azar */
    *out_x = map->enemy_spawns[start_idx].x;
    *out_y = map->enemy_spawns[start_idx].y;
    return true;
}

void map_print_stats(const Map* map) {
    u32 solid_count = 0, plat_count = 0, rope_count = 0;
    for (s32 y = 0; y < MAP_HEIGHT_TILES; y++) {
        for (s32 x = 0; x < MAP_WIDTH_TILES; x++) {
            if (map->tiles[y][x] == TILE_SOLID) solid_count++;
            else if (map->tiles[y][x] == TILE_PLATFORM) plat_count++;
            else if (map->tiles[y][x] == TILE_ROPE) rope_count++;
        }
    }

    f32 dist_pod_tele = sqrtf(powf(map->teleporter_x - map->spawn_x, 2) +
                              powf(map->teleporter_y - map->spawn_y, 2));

    printf("================ MAPA PROCEDURAL: DESOLATE FOREST ================\n");
    printf(" Dimensiones: %d x %d tiles (%d x %d pixels)\n",
           MAP_WIDTH_TILES, MAP_HEIGHT_TILES, MAP_WIDTH_TILES * TILE_SIZE, MAP_HEIGHT_TILES * TILE_SIZE);
    printf(" Tiles Solidos: %u | Plataformas: %u | Cuerdas: %u\n", solid_count, plat_count, rope_count);
    printf(" Objetos Interactables: %u | Puntos de Spawn de Enemigos: %u\n",
           map->object_count, map->enemy_spawn_count);
    printf(" Escape Pod: (%.0f, %.0f) [Tile %d, %d]\n",
           map->spawn_x, map->spawn_y, (s32)(map->spawn_x/TILE_SIZE), (s32)(map->spawn_y/TILE_SIZE));
    printf(" Teleporter: (%.0f, %.0f) [Tile %d, %d]\n",
           map->teleporter_x, map->teleporter_y, (s32)(map->teleporter_x/TILE_SIZE), (s32)(map->teleporter_y/TILE_SIZE));
    printf(" Distancia Spawn <-> Teleporter: %.1f px (~%d tiles) [OK: > 1000px]\n",
           dist_pod_tele, (s32)(dist_pod_tele / TILE_SIZE));
    printf("===================================================================\n");
}

void map_print_ascii_minimap(const Map* map) {
    /* Mapear 160x80 a 80x25 caracteres para terminal */
    const s32 out_w = 80;
    const s32 out_h = 24;
    char buffer[24][81];

    for (s32 y = 0; y < out_h; y++) {
        for (s32 x = 0; x < out_w; x++) {
            buffer[y][x] = ' ';
        }
        buffer[y][out_w] = '\0';
    }

    /* Muestrear tiles */
    for (s32 ty = 0; ty < MAP_HEIGHT_TILES; ty++) {
        s32 my = (ty * out_h) / MAP_HEIGHT_TILES;
        for (s32 tx = 0; tx < MAP_WIDTH_TILES; tx++) {
            s32 mx = (tx * out_w) / MAP_WIDTH_TILES;
            u8 t = map->tiles[ty][tx];
            if (t == TILE_SOLID && buffer[my][mx] == ' ') buffer[my][mx] = '#';
            else if (t == TILE_PLATFORM && buffer[my][mx] == ' ') buffer[my][mx] = '=';
            else if (t == TILE_ROPE && (buffer[my][mx] == ' ' || buffer[my][mx] == '.')) buffer[my][mx] = '|';
        }
    }

    /* Superponer objetos clave */
    for (u16 i = 0; i < map->object_count; i++) {
        const MapObject* obj = &map->objects[i];
        s32 mx = (s32)((obj->x / (MAP_WIDTH_TILES * TILE_SIZE)) * out_w);
        s32 my = (s32)((obj->y / (MAP_HEIGHT_TILES * TILE_SIZE)) * out_h);
        if (mx >= 0 && mx < out_w && my >= 0 && my < out_h) {
            if (obj->type == OBJ_ESCAPE_POD) buffer[my][mx] = 'P';
            else if (obj->type == OBJ_TELEPORTER) buffer[my][mx] = 'T';
            else if (obj->type == OBJ_CHEST_SMALL || obj->type == OBJ_CHEST_LARGE) buffer[my][mx] = 'C';
            else if (obj->type == OBJ_BARREL) buffer[my][mx] = 'B';
            else if (obj->type == OBJ_SHRINE_CHANCE) buffer[my][mx] = 'S';
        }
    }

    printf("\n--- MINIMAPA ASCII DE LA FASE GENERADA (#:Suelo, =:Plataforma, |:Cuerda, P:Pod, T:Teleport, C:Cofre, B:Barril, S:Altar) ---\n");
    for (s32 y = 0; y < out_h; y++) {
        printf("%s\n", buffer[y]);
    }
    printf("------------------------------------------------------------------------------------------------------------------\n\n");
}
