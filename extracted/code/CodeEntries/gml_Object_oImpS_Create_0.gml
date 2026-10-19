event_inherited();
init_ai_default();
z_range = 40;
x_range = 200;
caster_play(110, global.volume, random_range(1, 1.3));
with (instance_create(x, (y + sprite_height) - sprite_yoffset, oEfSparks))
{
    sprite_index = sLightning;
    image_yscale = 1;
    image_xscale = choose(1, -1);
}
init_impS();
