#include "game.h"
#include "render.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void game_init(GameState* game) {
    render_init();
    map_generate_stage1(&game->map, 1337);
    player_init(&game->player, CLASS_COMMANDO, game->map.spawn_x, game->map.spawn_y);
    director_init(&game->director, DIFF_RAINSTORM);

    for (int i = 0; i < MAX_ENEMIES; i++) game->enemies[i].active = false;
    for (int i = 0; i < MAX_PROJECTILES; i++) game->projectiles[i].active = false;
    for (int i = 0; i < MAX_DAMAGE_POPUPS; i++) game->popups[i].active = false;

    game->camera.x = game->player.x - (SCREEN_WIDTH / 2.0f);
    game->camera.y = game->player.y - (SCREEN_HEIGHT / 2.0f);
    game->camera.target_x = game->camera.x;
    game->camera.target_y = game->camera.y;

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
            } else if (type == ENEMY_BOSS_COLOSSUS) {
                e->max_hp = 1200.0f * coeff;
                e->damage = 25.0f * coeff;
                e->move_speed = 0.8f;
                e->attack_range = 40.0f;
                e->gold_reward = 80;
                e->exp_reward = 150;
                e->point_cost = 250.0f;
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

    /* 3. Actualizar Jugador con Colisiones de Mapa y Cuerdas */
    player_update(p, &game->map, input->stick_x, input->stick_y, input->btn_jump, skill_keys, dt);
    if (p->dead) {
        game->game_over = true;
    }

    /* 3.1 Interacción con Objetos del Mapa (Cofres, Barriles, Teletransportador) */
    if (input->btn_interact) {
        MapObject* obj = map_find_nearby_interactable(&game->map, p->x, p->y, 36.0f);
        if (obj != NULL) {
            if (obj->type == OBJ_CHEST_SMALL || obj->type == OBJ_CHEST_LARGE) {
                if (p->gold >= obj->cost) {
                    p->gold -= obj->cost;
                    obj->opened = true;
                    player_add_item(p, obj->item_reward_id);
                    game_spawn_popup(game, obj->x, obj->y - 16.0f, (f32)obj->cost, false);
                }
            } else if (obj->type == OBJ_BARREL) {
                obj->opened = true;
                u32 gold_reward = 15 + (rand() % 15);
                p->gold += gold_reward;
                game_spawn_popup(game, obj->x, obj->y - 16.0f, (f32)gold_reward, false);
            } else if (obj->type == OBJ_TELEPORTER && !game->map.teleporter_active) {
                game->map.teleporter_active = true;
                /* Invocar Jefe del Nivel (Colossus) */
                spawn_enemy(game, ENEMY_BOSS_COLOSSUS, obj->x + 60.0f, obj->y);
            }
        }
    }

    /* 3.2 Carga del Teletransportador */
    if (game->map.teleporter_active && game->map.teleporter_charge < 100.0f) {
        f32 dist_to_tele = fabsf(p->x - game->map.teleporter_x);
        if (dist_to_tele < 320.0f) {
            game->map.teleporter_charge += dt * 1.15f;
            if (game->map.teleporter_charge >= 100.0f) {
                game->map.teleporter_charge = 100.0f;
            }
        }
    }

    /* 4. Generación de Enemigos por el Director usando Spawns Válidos del Mapa */
    if (game->director.spawn_timer >= game->director.spawn_interval) {
        if (game->director.points >= 10.0f && game->director.active_enemies < MAX_ENEMIES) {
            f32 spawn_x, spawn_y;
            if (map_get_random_enemy_spawn(&game->map, p->x, 360.0f, &spawn_x, &spawn_y)) {
                EnemyType t = ((rand() % 10) < 7) ? ENEMY_LEMURIAN : ENEMY_WISP;
                if (t == ENEMY_WISP) {
                    spawn_y -= 48.0f; /* Wisps flotan sobre el terreno */
                }
                spawn_enemy(game, t, spawn_x, spawn_y);
                game->director.points -= 10.0f;
            }
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
    /* 1. Renderizado visual a pantalla (480x272) */
    render_begin_frame();
    render_game_scene(game);
    render_hud(game);
    render_end_frame();

#ifndef PLATFORM_PSP
    /* 2. Telemetría de depuración en consola para Host */
    const Player* p = &game->player;
    const Director* d = &game->director;

    const char* tele_status = game->map.teleporter_active ? 
        (game->map.teleporter_charge >= 100.0f ? "[TELE CHARGED!]" : "[TELE CHARGING...]") : "[TELE INACTIVE]";

    printf("\r[HUD %02u:%02u | Dificultad: %-10s (x%.2f) | %-15s %3.0f%%] "
           "Player LVL:%2u HP:%3.0f/%3.0f ORO:$%-3u KILLS:%-2u ENEMIES:%-2u",
           d->minutes, d->seconds,
           director_get_stage_name(d->current_stage),
           d->difficulty_coefficient,
           tele_status,
           game->map.teleporter_charge,
           p->level, p->hp, p->max_hp, p->gold, p->kills,
           d->active_enemies);
    fflush(stdout);
#endif
}
