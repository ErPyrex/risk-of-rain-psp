if (active == 1)
{
    s = instance_create(x, y, oEfBullet2);
    instance_create(4616, 1424, oUsechestActive);
    s.sprite_index = sEfRecall;
    s.image_yscale = 1;
    caster_play(157, global.volume, 1);
    active = 2;
    visible = false;
}
