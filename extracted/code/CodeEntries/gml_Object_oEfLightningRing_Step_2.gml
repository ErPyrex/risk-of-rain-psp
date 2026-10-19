radius = min(300, radius);
if (instance_exists(parent))
{
    x = parent.x;
    y = parent.y;
    damage = ceil(parent.damage * coeff);
    image_xscale = radius / 17;
    image_yscale = radius / 17;
}
else
{
    instance_destroy();
}
if (alarm[0] == -1)
{
    image_alpha -= 0.1;
    if (image_alpha <= 0)
    {
        instance_destroy();
    }
}
if (hit == 1)
{
    hit = 2;
}
