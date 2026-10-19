if (sign(sin(ff)) < 0)
{
    if (firing == 0)
    {
        firing = 1;
        alarm[0] = 1;
    }
}
else
{
    x += (10 * sin(ff) * scale);
    ff += 0.1;
}
