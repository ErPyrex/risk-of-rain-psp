#ifndef PLAYER_H
#define PLAYER_H

#include "types.h"
#include "item.h"

typedef enum {
    CLASS_COMMANDO = 1,
    CLASS_ENFORCER = 2,
    CLASS_BANDIT = 3,
    CLASS_HUNTRESS = 4,
    CLASS_HAND = 5,
    CLASS_ENGINEER = 6,
    CLASS_MINER = 7,
    CLASS_SNIPER = 8,
    CLASS_ACRID = 9,
    CLASS_MERCENARY = 10,
    CLASS_LOADER = 11,
    CLASS_CHEF = 12
} SurvivorClass;

typedef enum {
    PLAYER_STATE_IDLE,
    PLAYER_STATE_WALK,
    PLAYER_STATE_JUMP,
    PLAYER_STATE_FALL,
    PLAYER_STATE_CLIMB,
    PLAYER_STATE_SKILL_1,
    PLAYER_STATE_SKILL_2,
    PLAYER_STATE_SKILL_3,
    PLAYER_STATE_SKILL_4,
    PLAYER_STATE_HURT,
    PLAYER_STATE_DEAD
} PlayerState;

typedef struct {
    const char* name;
    f32 cooldown_max;
    f32 cooldown_current;
    f32 damage_multiplier;
    u16 animation_id;
    bool is_ready;
} PlayerSkill;

typedef struct {
    /* Identidad */
    SurvivorClass survivor_class;
    PlayerState state;
    bool facing_right;
    bool dead;

    /* Posición y Físicas */
    f32 x, y;
    f32 vx, vy;
    bool grounded;
    bool climbing;

    /* Estadísticas de Combate */
    f32 hp, max_hp;
    f32 hp_regen;
    f32 shield, max_shield;
    f32 damage;
    f32 attack_speed;
    f32 crit_chance;
    f32 armor;
    f32 move_speed;

    /* Progresión */
    u32 level;
    u32 exp, max_exp;
    u32 gold;
    u32 kills;

    /* Habilidades (Z, X, C, V en PC / Cuadrado, Triangulo, Circulo, R en PSP) */
    PlayerSkill skills[4];

    /* Inventario */
    u16 item_count;
    ItemStack inventory[MAX_INVENTORY_ITEMS];
    s16 use_item_id;
    f32 use_item_cooldown;

    /* Animación */
    u16 current_sprite;
    f32 anim_frame;
    f32 invulnerability_timer;
} Player;

/* Funciones del Jugador */
typedef struct Map Map;
void player_init(Player* player, SurvivorClass s_class, f32 spawn_x, f32 spawn_y);
void player_update(Player* player, const Map* map, f32 move_x, f32 move_y, bool jump_pressed, bool skill_keys[4], f32 dt);
void player_take_damage(Player* player, f32 dmg, bool is_crit);
void player_add_item(Player* player, u16 item_id);
void player_add_exp(Player* player, u32 amount);

#endif /* PLAYER_H */
