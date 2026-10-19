if (drill != 0)
{
    draw_set_alpha(1);
    draw_line_width_color(xstart, ystart, x, y, 2, c_white, c_white);
    draw_set_alpha(0.3);
    draw_line_width_color(xstart, ystart, x, y, 2, c_orange, c_yellow);
}
if (sprite_index != -1)
{
    draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, 0, c_white, 1);
}
