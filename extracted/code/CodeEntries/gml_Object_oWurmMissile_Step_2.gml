if (tracking)
{
    direction = turn_towards_advanced(direction, point_direction(x, y, targetx, targety), 0.7);
}
if (global.time_stop == 0)
{
    if (alarm[0] == -1 && time_left != -1)
    {
        alarm[0] = time_left;
        time_left = -1;
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
if (place_meeting(x, y, pFriend))
{
    fire_explosion(3, x, y, 1, 292, 1, 522, 0.8, 1);
    bullet.percent_hp = 0.05;
    instance_destroy();
    caster_play(81, global.volume, 1);
    oHUD.alarm[0] = 1;
}
if (point_distance(x, y, targetx, targety) < 80)
{
    tracking = 0;
}
