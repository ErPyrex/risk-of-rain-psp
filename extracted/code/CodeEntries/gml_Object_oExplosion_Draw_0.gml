if (sprite_index > sThin)
{
    draw_sprite_ext(sprite_index, -1, x, y, 1, 1, 0, image_blend, 1);
}
if (global.debug == 1)
{
    draw_sprite_ext(sBite1Mask, -1, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
}
