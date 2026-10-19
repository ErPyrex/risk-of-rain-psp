draw_set_alpha(max(image_alpha - 0.5, 0.1));
draw_sprite_ext(sprite_index, -1, x, y, 1, 1, direction, c_white, max(image_alpha - 0.3, 0.3));
draw_set_color(#B8AF92);
draw_circle(x, y, 16 * coeff, 1);
draw_set_alpha(1);
