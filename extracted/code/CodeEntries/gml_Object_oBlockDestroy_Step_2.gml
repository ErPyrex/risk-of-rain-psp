if (active > 0)
{
    active_total += active;
    active = 0;
    if (inside_view(x, y))
    {
        caster_play(85, global.volume * 0.7, 1.5);
    }
}
if (active_total >= 10)
{
    caster_play(147, global.volume, 1.5);
    oHUD.alarm[0] = 15;
    with (instance_create(x, y, oEfSparks))
    {
        sprite_index = sEfExplosive;
    }
    instance_destroy();
}
