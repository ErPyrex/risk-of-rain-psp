if (instance_exists(parent))
{
    if (sprite_index == sEfTaunt)
    {
        parent.state = "taunted";
    }
    else
    {
        parent.state = "feared";
    }
    x = parent.x;
    y = round(parent.y - sprite_get_yoffset(parent.sprite_idle) - 8);
    if (alarm[0] <= 0)
    {
        parent.state = "chase";
        instance_destroy();
    }
}
else
{
    instance_destroy();
}
