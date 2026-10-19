if (hit == 0)
{
    d = instance_create(x, y, oEfSparks);
    d.sprite_index = damage_index;
    d.image_xscale = sign(direction - 90);
}
if (crowbar_hit == 1)
{
    caster_play(64, global.volume, random_range(0.8, 1.1));
}
