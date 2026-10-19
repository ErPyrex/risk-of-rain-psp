draw_set_alpha(image_alpha);
draw_set_blend_mode(bm_add);
draw_line_color(x, y, x + lengthdir_x(len, image_angle), y + lengthdir_y(len, image_angle), c_red, c_black);
draw_set_blend_mode(bm_normal);
