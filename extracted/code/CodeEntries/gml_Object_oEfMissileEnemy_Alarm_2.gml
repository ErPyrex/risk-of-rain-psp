target = instance_nearest(x, y, oPOI);
if (instance_exists(target))
{
    targetx = target.x;
    targety = target.y;
}
else
{
    targetx = x;
    targety = y;
}
