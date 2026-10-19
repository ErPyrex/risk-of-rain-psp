event_inherited();
init_boss();
init_ai_default();
z_range = 40;
x_range = 400;
alarm[1] = 1;
with (instance_create(x, y, oWhiteFlash))
{
    rate = 0.05;
    image_blend = #C148A4;
}
caster_play(110, global.volume, 0.8);
caster_play(147, global.volume * 0.8, random_range(1, 1.3));
with (instance_create(x, (y + sprite_height) - sprite_yoffset, oEfSparks))
{
    sprite_index = sLightning;
    image_yscale = 1;
    image_xscale = choose(1, -1);
}
oHUD.alarm[0] = 30;
init_impGS();
