switch (room)
{
    case rCutscene1:
        room_goto(rCutscene2);
        break;
    case rCutscene2:
        accel = 1;
        alarm[1] = 150;
        break;
    case rCutscene3:
        alarm[3] = 180;
        with (oShipCargo)
        {
            alarm[0] = random(120);
        }
        break;
    case rCutscene4:
        audio_stop_sound(wCutsceneAlarm);
        audio_stop_sound(wWormBurning);
        room_goto(rCutscene5);
        break;
    case rCutscene5:
        with (instance_create(view_xview[0] + view_wview[0] + 400, view_yview[0] - 400, oGiantPod))
        {
            speed = 20;
        }
        alarm[1] = 90;
        break;
    case rCutscene6:
        alarm[1] = 180;
        break;
    case r2Cutscene2:
        white_alpha = 1;
        alarm[1] = 120;
        break;
    case r2Cutscene3:
        accel = 1;
        alarm[1] = 180;
        break;
}
