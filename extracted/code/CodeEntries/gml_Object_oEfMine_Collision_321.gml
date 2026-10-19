if (active == 1)
{
    caster_play(147, global.volume, 1);
    fire_explosion(3, x, y, 1, 292, 2, 901, 1, 1);
    oHUD.alarm[0] = 5;
    instance_destroy();
}
