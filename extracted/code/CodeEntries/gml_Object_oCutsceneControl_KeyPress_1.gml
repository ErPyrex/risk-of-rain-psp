if (room != r2Cutscene3 && room != r2Cutscene2)
{
    audio_stop_sound(wCutsceneAlarm);
    audio_stop_sound(wWormBurning);
    room_goto(rStart);
}
