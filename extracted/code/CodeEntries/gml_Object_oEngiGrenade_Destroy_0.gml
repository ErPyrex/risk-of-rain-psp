if (instance_exists(parent))
{
    with (parent)
    {
        fire_explosion(0, other.x, other.y, skill[0, 5], 292, 2, 187, 0.8, 1.3);
    }
}
caster_play(81, global.volume, 1);
