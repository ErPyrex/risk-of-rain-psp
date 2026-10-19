switch (room)
{
    case rCutscene1:
        break;
    case rCutscene2:
        oBoss1Fake.walking = 1;
        break;
    case rCutscene6:
        room_goto(rStart);
        break;
    case r2Cutscene2:
        room_goto(r2Cutscene3);
        break;
    case r2Cutscene3:
        caster_play(157, global.volume, 1);
        alarm[3] = 180;
        break;
}
