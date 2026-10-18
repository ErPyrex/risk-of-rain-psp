#include "player.h"
#include <math.h>

#define GRAVITY 0.35f
#define MAX_FALL_SPEED 7.0f
#define JUMP_FORCE -6.2f
#define FRICTION 0.85f

void player_init(Player* player, SurvivorClass s_class, f32 spawn_x, f32 spawn_y) {
    player->survivor_class = s_class;
    player->state = PLAYER_STATE_IDLE;
    player->facing_right = true;
    player->dead = false;

    player->x = spawn_x;
    player->y = spawn_y;
    player->vx = 0.0f;
    player->vy = 0.0f;
    player->grounded = true;
    player->climbing = false;

    /* Estadísticas base (Commando como referencia) */
    player->level = 1;
    player->max_hp = 110.0f;
    player->hp = player->max_hp;
    player->hp_regen = 0.6f;
    player->shield = 0.0f;
    player->max_shield = 0.0f;
    player->damage = 12.0f;
    player->attack_speed = 1.0f;
    player->crit_chance = 1.0f; /* 1% */
    player->armor = 0.0f;
    player->move_speed = 2.4f;

    player->exp = 0;
    player->max_exp = 20;
    player->gold = 15;
    player->kills = 0;

    player->item_count = 0;
    player->use_item_id = -1;
    player->use_item_cooldown = 0.0f;

    player->current_sprite = 0;
    player->anim_frame = 0.0f;
    player->invulnerability_timer = 0.0f;

    /* Inicializar Habilidades de Commando */
    /* Habilidad 1: Double Tap */
    player->skills[0].name = "Double Tap";
    player->skills[0].cooldown_max = 0.25f;
    player->skills[0].cooldown_current = 0.0f;
    player->skills[0].damage_multiplier = 0.6f;
    player->skills[0].is_ready = true;

    /* Habilidad 2: Phase Round */
    player->skills[1].name = "Phase Round";
    player->skills[1].cooldown_max = 3.0f;
    player->skills[1].cooldown_current = 0.0f;
    player->skills[1].damage_multiplier = 2.3f;
    player->skills[1].is_ready = true;

    /* Habilidad 3: Tactical Dive */
    player->skills[2].name = "Tactical Dive";
    player->skills[2].cooldown_max = 4.0f;
    player->skills[2].cooldown_current = 0.0f;
    player->skills[2].damage_multiplier = 0.0f;
    player->skills[2].is_ready = true;

    /* Habilidad 4: Suppressive Fire */
    player->skills[3].name = "Suppressive Fire";
    player->skills[3].cooldown_max = 5.0f;
    player->skills[3].cooldown_current = 0.0f;
    player->skills[3].damage_multiplier = 1.0f;
    player->skills[3].is_ready = true;
}

void player_update(Player* player, f32 move_x, bool jump_pressed, bool skill_keys[4], f32 dt) {
    (void)skill_keys;
    if (player->dead) return;

    /* Cooldowns de habilidades */
    for (int i = 0; i < 4; i++) {
        if (player->skills[i].cooldown_current > 0.0f) {
            player->skills[i].cooldown_current -= dt;
            if (player->skills[i].cooldown_current <= 0.0f) {
                player->skills[i].cooldown_current = 0.0f;
                player->skills[i].is_ready = true;
            }
        }
    }

    /* Cooldown de invulnerabilidad */
    if (player->invulnerability_timer > 0.0f) {
        player->invulnerability_timer -= dt;
    }

    /* Regeneración de vida */
    if (player->hp < player->max_hp) {
        player->hp += (player->hp_regen / 60.0f);
        if (player->hp > player->max_hp) player->hp = player->max_hp;
    }

    /* Movimiento horizontal */
    if (fabsf(move_x) > 0.1f) {
        player->vx = move_x * player->move_speed;
        player->facing_right = (move_x > 0);
        if (player->grounded) player->state = PLAYER_STATE_WALK;
    } else {
        player->vx *= FRICTION;
        if (fabsf(player->vx) < 0.1f) {
            player->vx = 0.0f;
            if (player->grounded) player->state = PLAYER_STATE_IDLE;
        }
    }

    /* Salto */
    if (jump_pressed && player->grounded) {
        player->vy = JUMP_FORCE;
        player->grounded = false;
        player->state = PLAYER_STATE_JUMP;
    }

    /* Gravedad */
    if (!player->grounded) {
        player->vy += GRAVITY;
        if (player->vy > MAX_FALL_SPEED) player->vy = MAX_FALL_SPEED;
        if (player->vy > 0.0f) player->state = PLAYER_STATE_FALL;
    }

    /* Aplicar posición */
    player->x += player->vx;
    player->y += player->vy;

    /* Colisión simple con suelo (plataforma en y = 200 temporal) */
    if (player->y >= 200.0f) {
        player->y = 200.0f;
        player->vy = 0.0f;
        player->grounded = true;
    }
}

void player_take_damage(Player* player, f32 dmg, bool is_crit) {
    (void)is_crit;
    if (player->dead || player->invulnerability_timer > 0.0f) return;

    /* Mitigación por armadura */
    f32 factor = 1.0f - (player->armor / (player->armor + 100.0f));
    f32 actual_dmg = dmg * factor;

    player->hp -= actual_dmg;
    player->invulnerability_timer = 0.35f;

    if (player->hp <= 0.0f) {
        player->hp = 0.0f;
        player->dead = true;
        player->state = PLAYER_STATE_DEAD;
    }
}

void player_add_item(Player* player, u16 item_id) {
    if (player->item_count >= MAX_INVENTORY_ITEMS) return;

    /* Verificar si ya existe en inventario para acumular */
    for (u16 i = 0; i < player->item_count; i++) {
        if (player->inventory[i].item_id == item_id) {
            player->inventory[i].count++;
            return;
        }
    }

    /* Nuevo item */
    player->inventory[player->item_count].item_id = item_id;
    player->inventory[player->item_count].count = 1;
    player->item_count++;
}

void player_add_exp(Player* player, u32 amount) {
    player->exp += amount;
    while (player->exp >= player->max_exp) {
        player->exp -= player->max_exp;
        player->level++;
        player->max_exp = (u32)(player->max_exp * 1.4f);

        /* Incremento de estadísticas por nivel */
        player->max_hp += 32.0f;
        player->hp += 32.0f;
        player->damage += 3.0f;
        player->hp_regen += 0.12f;
    }
}
