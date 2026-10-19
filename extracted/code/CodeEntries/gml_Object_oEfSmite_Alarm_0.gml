with (oEfMeteorShower)
{
    alpha = 0;
}
image_speed = 0.4;
sprite_index = sEfSmite;
image_index = 0;
oHUD.alarm[0] = 4;
if (inside_view(x, y))
{
    caster_play(147, global.volume, random_range(0.8, 1.2));
}
fire_explosion(3, x, y, 1, 292, 2, -1, 2, 2);
bullet.percent_hp = 0.1;
oHUD.alarm[0] = 5;
