#ifndef DIRECTOR_H
#define DIRECTOR_H

#include "types.h"

typedef enum {
    DIFF_DRIZZLE = 1,
    DIFF_RAINSTORM = 2,
    DIFF_MONSOON = 3
} DifficultyMode;

typedef enum {
    DIFF_STAGE_VERY_EASY = 0,
    DIFF_STAGE_EASY,
    DIFF_STAGE_MEDIUM,
    DIFF_STAGE_HARD,
    DIFF_STAGE_VERY_HARD,
    DIFF_STAGE_INSANE,
    DIFF_STAGE_IMPOSSIBLE,
    DIFF_STAGE_I_SEE_YOU,
    DIFF_STAGE_COMING_FOR_YOU,
    DIFF_STAGE_HAHAHA
} DifficultyStage;

typedef struct {
    DifficultyMode mode;
    DifficultyStage current_stage;
    
    f32 total_seconds;
    u32 minutes;
    u32 seconds;

    /* Escala de dificultad (coeficiente multiplicador de daño/vida de enemigos) */
    f32 difficulty_coefficient;

    /* Moneda de spawn (créditos acumulados para invocar enemigos) */
    f32 points;
    f32 point_accum_rate;
    f32 spawn_timer;
    f32 spawn_interval;

    /* Estado del escenario */
    u32 stage_index;
    bool teleporter_active;
    f32 teleporter_charge_percent;
    bool boss_alive;
    u32 active_enemies;
} Director;

/* Funciones del Director */
void director_init(Director* director, DifficultyMode mode);
void director_update(Director* director, f32 dt);
const char* director_get_stage_name(DifficultyStage stage);

#endif /* DIRECTOR_H */
