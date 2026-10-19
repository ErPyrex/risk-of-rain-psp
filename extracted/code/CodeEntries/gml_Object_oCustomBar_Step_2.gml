if (instance_exists(parent))
{
    x = ceil(parent.x - 15);
    y = ceil(parent.y - 20 - 10);
}
else
{
    instance_destroy();
}
time -= 1;
if (time == 0)
{
    instance_destroy();
}
