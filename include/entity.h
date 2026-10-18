#ifndef ENTITY_H
#define ENTITY_H

#include "types.h"

#define MAX_ENEMIES 48
#define MAX_PROJECTILES 64
#define MAX_DAMAGE_POPUPS 32

typedef enum {
    ENEMY_LEMURIAN = 0,     /* Lagarto bípedo básico */
    ENEMY_WISP,             /* Espíritu flotante de fuego */
    ENEMY_GOLEM,            /* Gólem pesado con ataque de aplastamiento */
    ENEMY_JELLYFISH,        /* Medusa flotante con ataque suicida/eléctrico */
    ENEMY_SPITTER,          /* Escupidor a distancia */
    ENEMY_BOSS_COLOSSUS,    /* Jefe Coloso */
    ENEMY_BOSS_WANDERING_VAGRANT, /* Jefe Medusa gigante */
    ENEMY_BOSS_MAGMA_WORM   /* Jefe Gusano de magma */
} EnemyType;

typedef enum {
    ELITE_NONE = 0,
    ELITE_BLAZING,      /* Fuego: deja rastro de fuego y hace daño continuo */
    ELITE_OVERLOADING,  /* Eléctrico: proyectiles con arco eléctrico */
    ELITE_GLACIAL,      /* Hielo: ralentiza y explota al morir */
    ELITE_FRENZIED,     /* Frenético: velocidad aumentada */
    ELITE_VOLATILE      /* Volátil: lanza bombas */
} EliteType;

typedef struct {
    bool active;
    EnemyType type;
    EliteType elite;
    
    f32 x, y;
    f32 vx, vy;
    bool facing_right;
    bool grounded;

    f32 hp, max_hp;
    f32 damage;
    f32 move_speed;
    f32 attack_cooldown;
    f32 attack_range;
    
    u32 gold_reward;
    u32 exp_reward;
    f32 point_cost;

    f32 hurt_flash_timer;
} Enemy;

typedef struct {
    bool active;
    bool from_player;
    f32 x, y;
    f32 vx, vy;
    f32 damage;
    bool is_crit;
    f32 lifetime;
    u16 sprite_id;
} Projectile;

typedef struct {
    bool active;
    f32 x, y;
    f32 vy;
    f32 amount;
    bool is_crit;
    f32 alpha;
    f32 lifetime;
} DamagePopup;

#endif /* ENTITY_H */
