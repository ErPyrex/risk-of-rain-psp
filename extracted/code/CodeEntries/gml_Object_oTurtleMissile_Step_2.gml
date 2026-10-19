if (global.time_stop == 0)
{
    gravity = 0.1;
    if (speed == 0)
    {
        speed = speed_previous;
        direction = direction_previous;
    }
    image_speed = 0.25;
    rad += 0.15;
    if (rad > 4)
    {
        rad = 0;
    }
    image_angle += 1;
}
else
{
    image_speed = 0;
    if (speed != 0)
    {
        speed_previous = speed;
        direction_previous = direction;
        gravity = 0;
        speed = 0;
    }
}
if (point_distance(x, y, targetx, targety) < 10)
{
    instance_destroy();
}
if (global.graphics >= 2 && global.time_stop == 0)
{
    part_particles_create(global.above, (xprevious + x) / 2, (yprevious + y) / 2, global.pPoison, 1);
}
