if (instance_exists(parent))
{
    with (parent)
    {
        fire_explosion(0, other.x, other.y, skill[0, 5], 528, 2, -1, 0.6, 0.7);
    }
}
caster_play(81, global.volume, 1);
alarm[0] = 180;
