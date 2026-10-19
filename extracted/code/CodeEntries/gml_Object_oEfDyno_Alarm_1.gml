with (parent)
{
    fire_explosion(2, other.x, other.y, 4, 292, 2, 883, 0.8, 3);
}
caster_play(76, global.volume, random_range(1.1, 1.4));
instance_destroy();
