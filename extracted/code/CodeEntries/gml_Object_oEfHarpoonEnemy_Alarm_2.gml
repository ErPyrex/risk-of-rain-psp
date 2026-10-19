target = instance_nearest(x, y, oPOI);
if (instance_exists(target))
{
    target_x = (target.x - 20) + random(40);
    target_y = target.y;
}
