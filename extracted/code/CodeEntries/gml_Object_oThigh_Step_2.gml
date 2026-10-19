ff += walk_speed;
angle += cos(degtorad(ff));
if (sign(cos(degtorad(ff))) == 1)
{
    pHspeed = min(pHspeed + 0.2, walk_speed / 3);
}
else
{
    pHspeed = max(pHspeed - 0.2, 0);
}
x -= pHspeed;
