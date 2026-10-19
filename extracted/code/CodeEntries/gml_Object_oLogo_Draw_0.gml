draw_rectangle_color(view_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + view_hview[0], c_black, c_black, c_black, c_black, 0);
draw_sprite_ext(sprite_index, image_index, view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2), 1, 1, image_angle, c_white, image_alpha);
