if (instance_exists(parent) == 0)
{
    instance_destroy();
}
else if (parent.hp <= 0)
{
    instance_destroy();
}
else
{
    x = ceil(parent.x);
    y = ceil(parent.y);
    s += 0.01;
    image_alpha = abs(sin(s));
    damage = ceil(parent.damage * 0.5 * coeff);
    image_xscale = 1 * coeff;
    image_yscale = 1 * coeff;
}
