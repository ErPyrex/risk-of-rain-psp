with (instance_create(x, lava_parent.y, oTurtleWave))
{
    image_xscale = other.image_xscale;
    max_height = 1 * abs(other.pHspeed / 2.5);
}
if (pHspeed != 0)
{
    alarm[0] = 7;
}
