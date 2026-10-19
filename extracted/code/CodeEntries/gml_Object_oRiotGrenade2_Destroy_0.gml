if (instance_exists(parent))
{
    with (parent)
    {
        fire_explosion(2, other.x, other.y, 0.8, 292, 1, 883, 1, 1);
        bullet.fear = 0.7;
        bullet.team = "playerproc";
    }
}
caster_play(76, global.volume * 0.7, random_range(1, 1.2));
