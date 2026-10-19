draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle2, c_white, image_alpha);
if (skull)
{
    draw_set_alpha(skull_alpha * 0.3);
    draw_set_color(#EFD27B);
    draw_circle(x, y, 15 * power(min(skull_index / 5, 1), 2), 0);
    draw_set_color(c_white);
    draw_set_alpha(skull_alpha * 0.8);
    draw_circle(x, y, 13 * power(min(skull_index / 5, 1), 2), 0);
}
draw_set_alpha(1);
