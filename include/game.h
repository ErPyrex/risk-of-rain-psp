#ifndef GAME_H
#define GAME_H

#include "types.h"
#include "player.h"
#include "director.h"
#include "entity.h"
#include "map.h"

#define SCREEN_WIDTH  480
#define SCREEN_HEIGHT 272

typedef struct {
    f32 stick_x;        /* -1.0 a 1.0 */
    f32 stick_y;        /* -1.0 a 1.0 */
    bool btn_jump;      /* Salto (Cruz / Barra espaciadora) */
    bool btn_interact;  /* Interactuar con cofres / teleporter */
    bool btn_skills[4]; /* Habilidades 1 a 4 */
    bool btn_use_item;  /* Item activo (Gatillo L) */
    bool btn_pause;     /* Pausa (Start) */
} InputState;

typedef struct {
    f32 x, y;
    f32 target_x, target_y;
} Camera;

typedef struct {
    Map map;
    Player player;
    Director director;
    Enemy enemies[MAX_ENEMIES];
    Projectile projectiles[MAX_PROJECTILES];
    DamagePopup popups[MAX_DAMAGE_POPUPS];
    Camera camera;
    
    bool is_paused;
    bool game_over;
} GameState;

/* Funciones principales del bucle de juego */
void game_init(GameState* game);
void game_update(GameState* game, const InputState* input, f32 dt);
void game_render(const GameState* game);

/* Generación de proyectiles y efectos */
void game_spawn_projectile(GameState* game, bool from_player, f32 x, f32 y, f32 vx, f32 vy, f32 damage, bool is_crit);
void game_spawn_popup(GameState* game, f32 x, f32 y, f32 amount, bool is_crit);

#endif /* GAME_H */
