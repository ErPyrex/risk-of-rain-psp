image_speed = 0.4;
sprite_index = sLightning;
image_index = 0;
oHUD.alarm[0] = 4;
if (inside_view(x, y))
{
    caster_play(34, global.volume * 0.25, random_range(0.8, 1.2));
}
fire_explosion(3, x, y, 1, 292, 2, -1, 0.5, 2);
bullet.percent_hp = 0.15;
oHUD.alarm[0] = 5;
