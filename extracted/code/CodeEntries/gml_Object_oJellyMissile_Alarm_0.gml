if (instance_exists(target))
{
    targetx = target.x;
    targety = target.y + (lightning * irandom_range(-15, 15));
}
else
{
    targetx = x;
    targety = y;
}
direction = point_direction(x, y, targetx, targety);
