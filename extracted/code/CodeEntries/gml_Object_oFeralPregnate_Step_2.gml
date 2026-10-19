if (instance_exists(parent))
{
    x = parent.x;
    y = parent.y;
}
else
{
    detonate = 1;
    instance_destroy();
}
