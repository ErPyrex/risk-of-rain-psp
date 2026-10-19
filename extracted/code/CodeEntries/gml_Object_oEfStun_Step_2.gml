if (instance_exists(parent))
{
    x = parent.x;
    y = parent.y - sprite_get_yoffset(parent.sprite_idle) - 8;
    if (parent.alarm[7] <= 0)
    {
        parent.stunned = 0;
        instance_destroy();
    }
}
else
{
    instance_destroy();
}
