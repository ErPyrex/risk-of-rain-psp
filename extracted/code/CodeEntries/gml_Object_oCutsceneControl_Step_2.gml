switch (room)
{
    case rCutscene1:
        background_x[0] -= 1;
        background_x[1] -= 2;
        background_x[2] -= 3;
        part_particles_create(global.above, view_xview[0] + random(view_wview[0]), view_yview[0] + random(view_hview[0]), global.pSpaceDust, 1);
        break;
    case rCutscene2:
        background_x[0] -= 1;
        background_x[1] -= 2;
        background_x[2] -= 3;
        if (accel == 1)
        {
            speed = min(speed + 0.02, 0);
        }
        break;
    case rCutscene3:
        white_alpha = max(0, white_alpha - 0.1);
        if (white_alpha != 0)
        {
            shakex = 10;
            shakey = 10;
        }
        background_x[0] -= 1;
        background_x[1] -= 2;
        background_x[2] -= 3;
        part_particles_create(global.above, view_xview[0] + random(view_wview[0]), view_yview[0] + random(view_hview[0]), global.pSpaceDust, 1);
        break;
    case rCutscene4:
        background_x[0] -= 1;
        background_x[1] -= 2;
        background_x[2] -= 3;
        shakex = 2;
        shakey = 2;
        break;
    case rCutscene5:
        background_x[1] += 0.025;
        background_y[1] -= 0.025;
        background_x[2] += 0.1;
        background_y[2] -= 0.1;
        shakex = 2;
        shakey = 2;
        break;
    case rCutscene6:
        background_y[0] -= 2;
        background_y[1] -= 5;
        background_y[2] -= 8;
        part_type_direction(global.middle, 85, 95, 0, 1);
        repeat (10)
        {
            part_particles_create(global.middle, view_xview[0] + (view_wview[0] / 2) + random_range(-113, 113), y, global.pDiagFire, 1);
        }
        shakex = 4;
        shakey = 4;
        break;
    case r2Cutscene3:
        if (white_alpha != 2)
        {
            white_alpha = max(0, white_alpha - 0.02);
        }
        background_x[0] -= 1;
        background_x[1] -= 2;
        background_x[2] -= 3;
        if (accel == 1)
        {
            speed = min(speed + 0.02, 0);
        }
        break;
}
if ((!mouse_check_button_pressed(mb_none) || global.yoyocontrol[0] == 1 || global.yoyocontrol[1] == 1 || global.yoyocontrol[7] == 1) && room != r2Cutscene3 && room != r2Cutscene2)
{
    audio_stop_sound(wCutsceneAlarm);
    audio_stop_sound(wWormBurning);
    room_goto(rStart);
}
view_xview[0] = x + random_range(-shakex, shakex);
view_yview[0] = y + random_range(-shakey, shakey);
