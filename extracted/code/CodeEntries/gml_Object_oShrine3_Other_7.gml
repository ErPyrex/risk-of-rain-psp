image_speed = 0;
image_index = sprite_get_number(sprite_index) - 1;
if (charges == 0)
{
    image_index = 0;
    image_speed = 0.2;
    charges = -1;
    sprite_index = sShrine3Death;
    oHUD.alarm[0] = 10;
    caster_play(170, global.volume, 1.2);
}
else if (charges != -1)
{
    alarm[1] = 60;
}
