if (instance_exists(parent))
{
    x = round(parent.x);
    y = round(parent.y - object_get_sprite(parent).sprite_yoffset - 15);
}
else
{
    instance_destroy();
}
