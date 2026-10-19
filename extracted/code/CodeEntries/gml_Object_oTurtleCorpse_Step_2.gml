pHspeed = max(0, abs(pHspeed) - 0.03) * sign(pHspeed);
if (abs(pHspeed) <= 0.1)
{
    pHspeed = 0;
}
x += pHspeed;
if (x > ((lava_parent.x + (lava_parent.width_b * 16)) - 100) || x < (lava_parent.x + 40))
{
    pHspeed *= -1;
    image_xscale = -image_xscale;
}
