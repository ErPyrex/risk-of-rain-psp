if (active == 1)
{
    s = instance_create(x, y, oEfBullet2);
    instance_create(4496, 1168, oGaussActive);
    s.sprite_index = sEfRecall;
    s.image_yscale = 1;
    caster_play(157, global.volume, 1);
    active = 2;
    visible = false;
}
