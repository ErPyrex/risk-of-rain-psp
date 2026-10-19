draw_sprite(sprite_index, -1, x, y);
if (global.debug == 1)
{
    for (i = 0; i <= sprite_width; i += 10)
    {
        draw_point_color(x + i, y + 8, c_white);
    }
}
