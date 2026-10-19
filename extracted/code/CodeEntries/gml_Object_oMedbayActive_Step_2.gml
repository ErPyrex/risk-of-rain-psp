if (active == 1)
{
    active = 2;
    image_speed = 0.3;
}
if (floor(image_index) == 2 && activity_var1 == 0)
{
    alarm[0] = 1;
    caster_play(70, global.volume, 2);
    activity_var1 = 1;
}
if (floor(image_index) == 10 && activity_var1 == 1)
{
    alarm[0] = 1;
    caster_play(70, global.volume, 2);
    activity_var1 = 2;
}
