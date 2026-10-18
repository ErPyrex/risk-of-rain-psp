#include "director.h"

static const char* STAGE_NAMES[] = {
    "Very Easy",
    "Easy",
    "Medium",
    "Hard",
    "Very Hard",
    "Insane",
    "Impossible",
    "I SEE YOU",
    "I'M COMING FOR YOU",
    "HAHAHAHA"
};

void director_init(Director* director, DifficultyMode mode) {
    director->mode = mode;
    director->current_stage = DIFF_STAGE_VERY_EASY;
    director->total_seconds = 0.0f;
    director->minutes = 0;
    director->seconds = 0;

    director->difficulty_coefficient = 1.0f;
    director->points = 0.0f;
    director->point_accum_rate = 1.5f; /* Puntos base por segundo */
    director->spawn_timer = 0.0f;
    director->spawn_interval = 3.5f;   /* Intentar spawn cada 3.5 segundos */

    director->stage_index = 1;
    director->teleporter_active = false;
    director->teleporter_charge_percent = 0.0f;
    director->boss_alive = false;
    director->active_enemies = 0;
}

void director_update(Director* director, f32 dt) {
    director->total_seconds += dt;
    director->minutes = (u32)(director->total_seconds / 60.0f);
    director->seconds = ((u32)director->total_seconds) % 60;

    /* Factor de dificultad según el modo seleccionado */
    f32 diff_scale = 1.0f;
    switch (director->mode) {
        case DIFF_DRIZZLE:  diff_scale = 0.5f; break;
        case DIFF_RAINSTORM: diff_scale = 1.0f; break;
        case DIFF_MONSOON:  diff_scale = 1.5f; break;
    }

    /* Coeficiente de dificultad dinámico de Risk of Rain: escala con el tiempo */
    director->difficulty_coefficient = 1.0f + (director->total_seconds / 60.0f) * 0.15f * diff_scale;

    /* Actualizar etapa de dificultad (cada ~2.5 minutos aprox) */
    u32 stage_idx = (u32)((director->total_seconds * diff_scale) / 150.0f);
    if (stage_idx > DIFF_STAGE_HAHAHA) stage_idx = DIFF_STAGE_HAHAHA;
    director->current_stage = (DifficultyStage)stage_idx;

    /* Acumulación de créditos para generación de enemigos */
    director->points += (director->point_accum_rate * director->difficulty_coefficient * dt);

    /* Temporizador de oleadas */
    director->spawn_timer += dt;
}

const char* director_get_stage_name(DifficultyStage stage) {
    if (stage > DIFF_STAGE_HAHAHA) return "HAHAHAHA";
    return STAGE_NAMES[stage];
}
