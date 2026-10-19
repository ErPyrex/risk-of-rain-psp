draw_sprite_ext(sEfGaussTip, -1, x, y, 1 * sign(width_x), 1, image_angle, c_white, 1);
draw_sprite_ext(sprite_index, -1, x, y, width_x, 1, image_angle, c_white, 1);
draw_sprite_ext(sEfGaussTip, -1, x + width_x, y, -1 * sign(width_x), 1, image_angle, c_white, 1);
draw_sprite_ext(sEfGaussTip, -1, x, y, 1 * sign(-width_x), 1, image_angle, c_white, 1);
draw_sprite_ext(sprite_index, -1, x, y, -width_x, 1, image_angle, c_white, 1);
draw_sprite_ext(sEfGaussTip, -1, x + -width_x, y, -1 * sign(-width_x), 1, image_angle, c_white, 1);
