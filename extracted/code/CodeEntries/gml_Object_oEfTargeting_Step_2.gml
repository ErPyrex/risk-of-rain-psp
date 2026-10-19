if (instance_exists(parent) == 0 || global.graphics == 1)
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
}
