if (instance_exists(target))
{
    x = (target.x + (x * 2)) / 3;
    y = (target.y + (y * 2)) / 3;
}
else
{
    image_alpha -= 0.1;
}
ydisp = (ydisp * 3) / 4;
