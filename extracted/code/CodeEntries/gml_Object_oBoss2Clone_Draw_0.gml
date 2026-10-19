if ((activity != 0 || alarm[7] != -1) || random(100) < 1)
{
    gg = instance_create(xprevious, yprevious, oEfTrail);
    gg.sprite_index = sprite_index;
    gg.image_index = image_index;
    gg.image_xscale = image_xscale * random_range(1, 1.2);
    gg.image_yscale = image_yscale;
    gg.rate = 0.1;
    gg.image_blend = c_black;
}
if (global.debug == 1)
{
    draw_text(ghost_x, ghost_y, state);
}
