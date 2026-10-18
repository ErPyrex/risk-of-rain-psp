#ifndef RENDER_H
#define RENDER_H

#include "types.h"
#include "game.h"
#include "sprites.h"

#define SCREEN_WIDTH  480
#define SCREEN_HEIGHT 272

/* Inicialización del subsistema gráfico (PSP GU o Host Framebuffer) */
void render_init(void);
void render_cleanup(void);

/* Control de cuadro */
void render_begin_frame(void);
void render_clear(u32 color_hex);
void render_end_frame(void);

/* Primitivas de renderizado de sprites */
void render_draw_sprite(SpriteId sprite_id, f32 screen_x, f32 screen_y, bool flip_x);
void render_draw_tile(u8 tile_type, bool is_surface, f32 screen_x, f32 screen_y);
void render_draw_rect(s32 x, s32 y, s32 w, s32 h, u32 color_rgba);
void render_draw_rect_outline(s32 x, s32 y, s32 w, s32 h, u32 color_rgba);

/* Renderizado completo de la escena de juego y HUD */
void render_game_scene(const GameState* game);
void render_hud(const GameState* game);

#ifndef PLATFORM_PSP
/* Captura de pantalla para validación visual en Host */
void render_save_screenshot(const char* filepath);
#endif

#endif /* RENDER_H */
