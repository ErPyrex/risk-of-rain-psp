switch (room)
{
    case rCutscene1:
        break;
    case rCutscene2:
        s = instance_create(oGeneralObject.x, oGeneralObject.y, oEfBullet2);
        s.sprite_index = sEfRecall;
        s.image_yscale = 1;
        caster_play(157, global.volume, 1);
        instance_create(560, 560, oBoss1Fake);
        alarm[2] = 120;
        break;
    case rCutscene5:
        room_goto(rCutscene6);
        break;
    case rCutscene6:
        white_alpha = 1;
        alarm[2] = 120;
        break;
    case r2Cutscene2:
        room_goto(r2Cutscene3);
        break;
    case r2Cutscene3:
        white_alpha = 1;
        alarm[2] = 120;
        break;
}
