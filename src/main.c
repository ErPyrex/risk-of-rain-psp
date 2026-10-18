#include <stdio.h>
#include <unistd.h>
#include "game.h"
#include "render.h"

#ifdef PLATFORM_PSP
#include <pspkernel.h>
#include <pspdebug.h>
#include <pspdisplay.h>
#include <pspctrl.h>

extern int setup_callbacks(void);
extern int is_running(void);
#endif

int main(int argc, char *argv[]) {
    (void)argc;
    (void)argv;
    GameState game;
    game_init(&game);

#ifdef PLATFORM_PSP
    setup_callbacks();
    pspDebugScreenInit();
    sceCtrlSetSamplingCycle(0);
    sceCtrlSetSamplingMode(PSP_CTRL_MODE_ANALOG);

    SceCtrlData pad;
    InputState input;
    f32 dt = 1.0f / 60.0f;

    while (is_running() && !game.game_over) {
        sceCtrlReadBufferPositive(&pad, 1);

        input.stick_x = ((f32)pad.Lx - 128.0f) / 128.0f;
        input.stick_y = ((f32)pad.Ly - 128.0f) / 128.0f;
        input.btn_jump = (pad.Buttons & PSP_CTRL_CROSS) != 0;
        input.btn_interact = (pad.Buttons & PSP_CTRL_DOWN) != 0;
        input.btn_skills[0] = (pad.Buttons & PSP_CTRL_SQUARE) != 0;
        input.btn_skills[1] = (pad.Buttons & PSP_CTRL_TRIANGLE) != 0;
        input.btn_skills[2] = (pad.Buttons & PSP_CTRL_CIRCLE) != 0;
        input.btn_skills[3] = (pad.Buttons & PSP_CTRL_RTRIGGER) != 0;
        input.btn_use_item = (pad.Buttons & PSP_CTRL_LTRIGGER) != 0;
        input.btn_pause = (pad.Buttons & PSP_CTRL_START) != 0;

        game_update(&game, &input, dt);

        pspDebugScreenSetXY(0, 0);
        game_render(&game);

        sceDisplayWaitVblankStart();
    }

    sceKernelExitGame();
#else
    printf("\n=== Risk of Rain PSP Core (Host Simulation Mode) ===\n");
    map_print_stats(&game.map);
    map_print_ascii_minimap(&game.map);
    printf("Simulando 250 frames de combate, dificultad y spawns...\n\n");

    /* Spawn de prueba para verificar sprites de Lemurian y Wisp en pantalla */
    game.enemies[0].active = true;
    game.enemies[0].type = ENEMY_LEMURIAN;
    game.enemies[0].x = game.player.x + 150.0f;
    game.enemies[0].y = game.player.y;
    game.enemies[0].hp = 60.0f;
    game.enemies[0].max_hp = 60.0f;
    game.enemies[0].move_speed = 1.0f;
    game.enemies[0].attack_range = 24.0f;
    game.enemies[0].facing_right = false;

    game.enemies[1].active = true;
    game.enemies[1].type = ENEMY_WISP;
    game.enemies[1].x = game.player.x + 220.0f;
    game.enemies[1].y = game.player.y - 45.0f;
    game.enemies[1].hp = 35.0f;
    game.enemies[1].max_hp = 35.0f;
    game.enemies[1].move_speed = 0.8f;
    game.enemies[1].attack_range = 140.0f;
    game.enemies[1].facing_right = false;

    InputState input = {0};
    f32 dt = 1.0f / 60.0f;

    for (int frame = 1; frame <= 250; frame++) {
        /* Simular jugador avanzando y disparando periódicamente */
        input.stick_x = 0.8f;
        input.btn_jump = (frame % 70 == 0);
        input.btn_skills[0] = (frame % 20 == 0); /* Disparar cada 20 frames */
        input.btn_skills[1] = (frame % 120 == 0); /* Habilidad 2 cada 2 segundos */

        game_update(&game, &input, dt);
        game_render(&game);
        if (frame == 40) {
            render_save_screenshot("assets/screen_capture.bmp");
        }
        usleep(16000); /* ~60 FPS */
    }

    render_save_screenshot("assets/screen_capture.bmp");

    printf("\n\n✓ Simulacion completada con exito!\n");
    printf("  Estado final -> Nivel: %u, Oro: %u, Kills: %u, Dificultad: %s (x%.2f)\n\n",
           game.player.level, game.player.gold, game.player.kills,
           director_get_stage_name(game.director.current_stage),
           game.director.difficulty_coefficient);
#endif

    return 0;
}
