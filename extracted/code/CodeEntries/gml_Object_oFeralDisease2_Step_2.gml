image_angle += 15;
if (master.id_count >= 25)
{
    instance_destroy();
}
if (instance_exists(target) && target > 0)
{
    direction = turn_towards_advanced(direction, point_direction(x, y, target.x, target.y + yoff), 5);
}
else if (target != -50)
{
    instance_destroy();
}
ff += 0.2;
