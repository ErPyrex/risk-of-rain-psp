if (instance_exists(parent))
{
    with (parent)
    {
        fire_explosion(0, other.x, other.y, 1, 528, 2, -1, 0.6, 0.7);
    }
}
alarm[0] = 180;
