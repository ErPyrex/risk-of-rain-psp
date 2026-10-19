speed = min(speed + 0.1, 8);
if (point_distance(x, y, target_x, target_y) <= 10)
{
    instance_destroy();
}
