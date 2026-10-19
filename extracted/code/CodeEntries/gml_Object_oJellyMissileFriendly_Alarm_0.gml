firing = 1;
if (instance_exists(target) == 1)
{
    targetx = target.x;
    targety = target.y;
}
else
{
    target = instance_nearest_variable(x, y, 321, "team", "enemy");
}
direction = point_direction(x, y, targetx, targety);
alarm[0] = 1;
