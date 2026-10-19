if (inside_view(x, y))
{
    caster_play(157, global.volume, 1);
}
oP.visible = true;
oP.activity = 0;
oP.activity_type = 0;
s = instance_create(x, y, oEfBullet2);
s.sprite_index = sEfRecall;
s.image_yscale = 1;
