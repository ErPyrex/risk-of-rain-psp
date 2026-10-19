draw_set_alpha(1);
draw_line_color(x, y, parent.x - lengthdir_x(offset, parent.image_angle + 180), parent.y - lengthdir_y(offset, parent.image_angle + 180), image_blend, image_blend);
if (tip == 1)
{
    draw_sprite_ext(sGiantJellyTip, 0, x, y, 1, 1, image_angle, image_blend, 1);
}
