if (alarm[1] >= 30 && instance_exists(target))
{
    turn_towards(direction, point_direction(x, y, target.x, target.y));
}
