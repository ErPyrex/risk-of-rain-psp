if (active == 1)
{
    caster_play(147, global.volume / 2, 2);
    caster_play(80, global.volume / 2, 1.3);
    fire_explosion(2, x, y, 1, 292, 2, 903, 1, 1);
    bullet.poison = poison;
    oHUD.alarm[0] = 5;
    instance_destroy();
}
