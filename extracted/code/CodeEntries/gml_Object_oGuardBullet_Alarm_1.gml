if (team == "player")
{
    target = instance_nearest(x, y, pEnemy);
}
else
{
    target = instance_nearest(x, y, oPOI);
}
if (instance_exists(target))
{
    target_x = (target.x - 10) + random(20);
    target_y = (target.y - 10) + random(20);
}
else
{
    target_x = x;
    target_y = y;
}
direction = point_direction(x, y, target_x, target_y);
