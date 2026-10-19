if (instance_exists(parent))
{
    with (parent)
    {
        fire_explosion(0, other.x, other.y, skill[1, 5] / 2, 292, 2, 522, 0.5, 1);
    }
}
caster_play(81, global.volume, 1);
