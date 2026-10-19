if (instance_exists(parent))
{
    x = parent.x;
    y = parent.y + 20;
    if (parent.dead)
    {
        instance_destroy();
    }
}
else
{
    instance_destroy();
}
if (moving == 1)
{
    if (position < 0 || position > 34)
    {
        pos_direction *= -1;
    }
    position += (1 * pos_direction);
}
