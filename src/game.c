#include "game.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void game_init(GameState* game) {
    player_init(&game->player, CLASS_COMMANDO, 120.0f, 180.0f);
    director_init(&game->director, DIFF_RAINSTORM);

    for (int i = 0; i < MAX_ENEMIES; i++) game->enemies[i].active = false;
    for (int i = 0; i < MAX_PROJECTILES; i++) game->projectiles[i].active = false;
    for (int i = 0; i < MAX_DAMAGE_POPUPS; i++) game->popups[i].active = false;

    game->camera.x = game->player.x - (SCREEN_WIDTH / 2.0f);
    game->camera.y = 0.0f;
    game->camera.target_x = game->camera.x;
    game->camera.target_y = 0.0f;

    game->is_paused = false;
    game->game_over = false;
}

void game_spawn_projectile(GameState* game, bool from_player, f32 x, f32 y, f32 vx, f32 vy, f32 damage, bool is_crit) {
    for (int i = 0; i < MAX_PROJECTILES; i++) {
        if (!game->projectiles[i].active) {
            game->projectiles[i].active = true;
            game->projectiles[i].from_player = from_player;
            game->projectiles[i].x = x;
            game->projectiles[i].y = y;
            game->projectiles[i].vx = vx;
            game->projectiles[i].vy = vy;
            game->projectiles[i].damage = damage;
            game->projectiles[i].is_crit = is_crit;
            game->projectiles[i].lifetime = 1.8f; /* 1.8 segundos de alcance */
            game->projectiles[i].sprite_id = 0;
            return;
        }
    }
}

void game_spawn_popup(GameState* game, f32 x, f32 y, f32 amount, bool is_crit) {
    for (int i = 0; i < MAX_DAMAGE_POPUPS; i++) {
        if (!game->popups[i].active) {
            game->popups[i].active = true;
            game->popups[i].x = x;
            game->popups[i].y = y;
            game->popups[i].vy = -1.2f;
            game->popups[i].amount = amount;
            game->popups[i].is_crit = is_crit;
            game->popups[i].alpha = 1.0f;
            game->popups[i].lifetime = 0.6f;
            return;
        }
    }
}

static void spawn_enemy(GameState* game, EnemyType type, f32 x, f32 y) {
    for (int i = 0; i < MAX_ENEMIES; i++) {
        if (!game->enemies[i].active) {
            Enemy* e = &game->enemies[i];
            e->active = true;
            e->type = type;
            e->elite = ELITE_NONE;
            e->x = x;
            e->y = y;
            e->vx = 0.0f;
            e->vy = 0.0f;
            e->facing_right = (x < game->player.x);
            e->grounded = true;
            e->hurt_flash_timer = 0.0f;

            /* Escalar con el coeficiente de dificultad del Director */
            f32 coeff = game->director.difficulty_coefficient;

            if (type == ENEMY_LEMURIAN) {
                e->max_hp = 60.0f * coeff;
                e->damage = 10.0f * coeff;
                e->move_speed = 1.6f;
                e->attack_range = 24.0f;
                e->gold_reward = 8;
                e->exp_reward = 12;
                e->point_cost = 10.0f;
            } else if (type == ENEMY_WISP) {
                e->max_hp = 35.0f * coeff;
                e->damage = 14.0f * coeff;
                e->move_speed = 1.2f;
                e->attack_range = 140.0f;
                e->gold_reward = 10;
                e->exp_reward = 15;
                e->point_cost = 15.0f;
            }

            e->hp = e->max_hp;
            e->attack_cooldown = 1.0f;
            game->director.active_enemies++;
            return;
        }
    }
}

void game_update(GameState* game, const InputState* input, f32 dt) {
    if (game->is_paused || game->game_over) return;

    /* 1. Actualizar Director de Dificultad */
    director_update(&game->director, dt);

    /* 2. Disparar Habilidades del Jugador */
    Player* p = &game->player;
    bool skill_keys[4] = { input->btn_skills[0], input->btn_skills[1], input->btn_skills[2], input->btn_skills[3] };

    /* Habilidad 1: Double Tap */
    if (skill_keys[0] && p->skills[0].is_ready) {
        f32 dir = p->facing_right ? 1.0f : -1.0f;
        bool is_crit = ((rand() % 100) < p->crit_chance);
        f32 dmg = p->damage * p->skills[0].damage_multiplier;
        if (is_crit) dmg *= 2.0f;

        game_spawn_projectile(game, true, p->x + (dir * 10.0f), p->y - 8.0f, dir * 9.0f, 0.0f, dmg, is_crit);
        p->skills[0].cooldown_current = p->skills[0].cooldown_max;
        p->skills[0].is_ready = false;
    }

    /* Habilidad 2: Phase Round */
    if (skill_keys[1] && p->skills[1].is_ready) {
        f32 dir = p->facing_right ? 1.0f : -1.0f;
        bool is_crit = ((rand() % 100) < p->crit_chance);
        f32 dmg = p->damage * p->skills[1].damage_multiplier;
        if (is_crit) dmg *= 2.0f;

        game_spawn_projectile(game, true, p->x + (dir * 12.0f), p->y - 8.0f, dir * 12.0f, 0.0f, dmg, is_crit);
        p->skills[1].cooldown_current = p->skills[1].cooldown_max;
        p->skills[1].is_ready = false;
    }

    /* Habilidad 3: Tactical Dive (Esquivar) */
    if (skill_keys[2] && p->skills[2].is_ready) {
        f32 dir = p->facing_right ? 1.0f : -1.0f;
        p->vx = dir * 6.5f;
        p->invulnerability_timer = 0.5f;
        p->skills[2].cooldown_current = p->skills[2].cooldown_max;
        p->skills[2].is_ready = false;
    }

    /* 3. Actualizar Jugador */
    player_update(p, input->stick_x, input->btn_jump, skill_keys, dt);
    if (p->dead) {
        game->game_over = true;
    }

    /* 4. Generación de Enemigos por el Director */
    if (game->director.spawn_timer >= game->director.spawn_interval) {
        if (game->director.points >= 10.0f && game->director.active_enemies < MAX_ENEMIES) {
            f32 spawn_side = ((rand() % 2) == 0) ? -1.0f : 1.0f;
            f32 spawn_x = p->x + (spawn_side * (240.0f + (rand() % 60)));
            EnemyType t = ((rand() % 10) < 7) ? ENEMY_LEMURIAN : ENEMY_WISP;
            f32 spawn_y = (t == ENEMY_WISP) ? 140.0f : 200.0f;

            spawn_enemy(game, t, spawn_x, spawn_y);
            game->director.points -= 10.0f;
        }
        game->director.spawn_timer = 0.0f;
    }

    /* 5. Actualizar Proyectiles y Colisiones */
    for (int i = 0; i < MAX_PROJECTILES; i++) {
        Projectile* prj = &game->projectiles[i];
        if (!prj->active) continue;

        prj->x += prj->vx;
        prj->y += prj->vy;
        prj->lifetime -= dt;
        if (prj->lifetime <= 0.0f) {
            prj->active = false;
            continue;
        }

        /* Colisión con enemigos */
        if (prj->from_player) {
            for (int e_idx = 0; e_idx < MAX_ENEMIES; e_idx++) {
                Enemy* e = &game->enemies[e_idx];
                if (!e->active) continue;

                /* Hitbox aproximada (caja de 18x24) */
                if (fabsf(prj->x - e->x) < 14.0f && fabsf(prj->y - (e->y - 12.0f)) < 16.0f) {
                    e->hp -= prj->damage;
                    e->hurt_flash_timer = 0.15f;
                    game_spawn_popup(game, e->x, e->y - 20.0f, prj->damage, prj->is_crit);
                    prj->active = false;

                    /* Muerte de enemigo */
                    if (e->hp <= 0.0f) {
                        e->active = false;
                        game->director.active_enemies--;
                        p->gold += e->gold_reward;
                        p->kills++;
                        player_add_exp(p, e->exp_reward);
                    }
                    break;
                }
            }
        }
    }

    /* 6. Actualizar Enemigos y Ataques al Jugador */
    for (int i = 0; i < MAX_ENEMIES; i++) {
        Enemy* e = &game->enemies[i];
        if (!e->active) continue;

        if (e->hurt_flash_timer > 0.0f) e->hurt_flash_timer -= dt;
        if (e->attack_cooldown > 0.0f) e->attack_cooldown -= dt;

        /* IA de Persecución */
        f32 dx = p->x - e->x;
        e->facing_right = (dx > 0.0f);

        if (fabsf(dx) > e->attack_range) {
            e->vx = (dx > 0.0f ? 1.0f : -1.0f) * e->move_speed;
        } else {
            e->vx = 0.0f;
            /* Atacar si está en rango */
            if (e->attack_cooldown <= 0.0f) {
                player_take_damage(p, e->damage, false);
                game_spawn_popup(game, p->x, p->y - 24.0f, e->damage, false);
                e->attack_cooldown = 1.2f;
            }
        }
        e->x += e->vx;
    }

    /* 7. Actualizar Popups de Daño */
    for (int i = 0; i < MAX_DAMAGE_POPUPS; i++) {
        DamagePopup* pop = &game->popups[i];
        if (!pop->active) continue;

        pop->y += pop->vy;
        pop->lifetime -= dt;
        pop->alpha = pop->lifetime / 0.6f;
        if (pop->lifetime <= 0.0f) {
            pop->active = false;
        }
    }

    /* 8. Cámara Suave */
    game->camera.target_x = p->x - (SCREEN_WIDTH / 2.0f);
    game->camera.x += (game->camera.target_x - game->camera.x) * 0.1f;
}

void game_render(const GameState* game) {
    /* En el host (PC) mostramos un HUD de telemetría */
    const Player* p = &game->player;
    const Director* d = &game->director;

    printf("\r[HUD %02u:%02u | Dificultad: %-10s (x%.2f) | Pts: %4.0f] "
           "Player LVL:%2u HP:%3.0f/%3.0f ORO:$%-3u KILLS:%-2u ENEMIES:%-2u",
           d->minutes, d->seconds,
           director_get_stage_name(d->current_stage),
           d->difficulty_coefficient,
           d->points,
           p->level, p->hp, p->max_hp, p->gold, p->kills,
           d->active_enemies);
    fflush(stdout);
}
