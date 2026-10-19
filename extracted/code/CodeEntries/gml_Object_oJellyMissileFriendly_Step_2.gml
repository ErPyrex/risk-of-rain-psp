if (global.time_stop == 0)
{
    if (firing == 0)
    {
        speed = max(0, speed - 0.1);
    }
    else
    {
        speed = min(speed + 0.3, 10);
    }
}
else
{
    alarm[0] = 60;
    speed = 0;
}
if (point_distance(x, y, targetx, targety) < 10)
{
    fire_explosion(3, x, y, 1, 292, 1, 522, 0.8, 1);
    instance_destroy();
    caster_play(81, global.volume, 1);
    oHUD.alarm[0] = 5;
}
