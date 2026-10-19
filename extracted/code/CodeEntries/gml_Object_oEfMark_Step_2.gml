if (instance_exists(parent) == 1)
{
    if (parent.team == "player")
    {
        instance_destroy();
    }
    x = round(parent.x);
    y = round(parent.y);
}
else
{
    instance_destroy();
}
