#ifndef MAP_H
#define MAP_H

#include "types.h"

#define TILE_SIZE 16
#define MAP_WIDTH_TILES  160  /* 160 * 16 = 2560 pixels de ancho */
#define MAP_HEIGHT_TILES  80  /*  80 * 16 = 1280 pixels de alto */
#define MAX_MAP_OBJECTS   48

typedef enum {
    TILE_AIR = 0,
    TILE_SOLID = 1,       /* Bloque sólido completo (oB) */
    TILE_PLATFORM = 2,    /* Plataforma atravesable hacia arriba */
    TILE_ROPE = 3         /* Cuerda / liana escalable (oRope) */
} TileType;

typedef enum {
    OBJ_NONE = 0,
    OBJ_ESCAPE_POD,       /* Cápsula de escape de inicio */
    OBJ_TELEPORTER,       /* Teletransportador principal */
    OBJ_CHEST_SMALL,      /* Cofre común ($25) */
    OBJ_CHEST_LARGE,      /* Cofre grande ($50) */
    OBJ_BARREL,           /* Barril de oro */
    OBJ_SHRINE_CHANCE     /* Altar de probabilidad */
} MapObjectType;

typedef struct {
    MapObjectType type;
    f32 x, y;
    u32 cost;
    bool opened;
    bool active;
    u16 item_reward_id;
} MapObject;

#define MAX_SPAWN_POINTS 64

typedef struct {
    f32 x, y;
} SpawnPoint;

typedef struct Map Map;
struct Map {
    u8 tiles[MAP_HEIGHT_TILES][MAP_WIDTH_TILES];
    MapObject objects[MAX_MAP_OBJECTS];
    u16 object_count;

    /* Spawns válidos para el Director */
    SpawnPoint enemy_spawns[MAX_SPAWN_POINTS];
    u16 enemy_spawn_count;

    /* Posiciones clave de la fase */
    f32 spawn_x, spawn_y;
    f32 teleporter_x, teleporter_y;
    u16 teleporter_object_index;
    bool teleporter_active;
    f32 teleporter_charge; /* 0.0 a 100.0 */
};

/* Funciones del Mapa */
void map_init(Map* map);
void map_generate_stage1(Map* map, u32 seed);

/* Consultas de Colisión de Físicas */
bool map_is_solid(const Map* map, s32 tile_x, s32 tile_y);
bool map_is_platform(const Map* map, s32 tile_x, s32 tile_y);
bool map_is_rope(const Map* map, s32 tile_x, s32 tile_y);

bool map_check_collision(const Map* map, f32 x, f32 y, f32 w, f32 h);
bool map_check_ground(const Map* map, f32 x, f32 y, f32 w, f32 vy);
bool map_check_rope(const Map* map, f32 x, f32 y);

/* Interacción y Spawns */
MapObject* map_find_nearby_interactable(Map* map, f32 x, f32 y, f32 radius);
bool map_get_random_enemy_spawn(const Map* map, f32 near_x, f32 max_dist, f32* out_x, f32* out_y);

/* Depuración y Diagnóstico */
void map_print_stats(const Map* map);
void map_print_ascii_minimap(const Map* map);

#endif /* MAP_H */
