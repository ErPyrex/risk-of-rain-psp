if (active == 1)
{
    caster_play(43, global.volume, 1);
    active = 2;
    image_speed = 0.2;
    alarm[0] = 1;
}
if (floor(image_index) == (sprite_get_number(sprite_index) - 2))
{
    image_speed = 0;
}
