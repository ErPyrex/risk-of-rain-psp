if (instance_exists(parent))
{
    var v = abs(other.x - other.xstart);
    with (parent)
    {
        fire_explosion(0, other.xstart + ((v / 10) * other.t * other.scale), other.y, skill[3, 5], 444, 1, 902, 0.4, 1);
    }
    alarm[0] = 3;
    caster_play(81, global.volume, 1);
    t += 1;
    if (t > 10)
    {
        instance_destroy();
    }
}
