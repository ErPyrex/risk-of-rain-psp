if (global.time_stop == 0)
{
    if (alarm[0] == -1 && time_left != -1)
    {
        alarm[0] = time_left;
        time_left = -1;
    }
    if (alarm[0] != -1)
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
    if (alarm[0] != -1)
    {
        time_left = alarm[0];
        alarm[0] = -1;
    }
    speed = 0;
}
if (point_distance(x, y, targetx, targety) < 10)
{
    fire_explosion(3, x, y, 1, 292, 1, 522, 0.8, 1);
    bullet.lightning = lightning;
    instance_destroy();
    caster_play(81, global.volume, 1);
    if (shake)
    {
        oHUD.alarm[0] = 5;
    }
}
