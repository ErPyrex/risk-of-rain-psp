if (instance_exists(target) && hit_count != 0 && alarm[0] == -1)
{
    direction = point_direction(x, y, target.x, target.y + yoff);
}
if (hit_count >= max_bounce)
{
    instance_destroy();
}
