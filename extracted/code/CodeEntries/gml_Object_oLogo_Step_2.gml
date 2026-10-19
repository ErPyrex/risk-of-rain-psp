image_angle = 0;
if (alarm[0] != -1)
{
    image_alpha = min(image_alpha + 0.05, 1);
}
else
{
    image_alpha = max(image_alpha - 0.05, 0);
    if (image_alpha <= 0)
    {
        room_goto(rCutscene1);
    }
}
if (!mouse_check_button_pressed(mb_none) || global.yoyocontrol[0] == 1 || global.yoyocontrol[1] == 1 || global.yoyocontrol[7] == 1)
{
    room_goto(rCutscene1);
}
