if (instance_exists(parent))
{
    x = parent.x;
    y = parent.y;
}
else
{
    instance_destroy();
}
if (alarm[0] == -1)
{
    alarm[0] = 30;
}
if (instance_exists(target) == 0)
{
    instance_destroy();
}
