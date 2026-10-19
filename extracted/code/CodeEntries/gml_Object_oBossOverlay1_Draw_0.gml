draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_sprite_ext(sprite_index, 1, x + (position_1 * sign(image_xscale)), y, image_xscale, image_yscale, image_angle, c_white, ring_alpha);
draw_sprite_ext(sprite_index, 1, x + (position_2 * sign(image_xscale)), y, image_xscale * 0.8, image_yscale * 0.8, image_angle, c_white, ring_alpha);
draw_sprite_ext(sprite_index, 1, x + (position_3 * sign(image_xscale)), y, image_xscale * 0.6, image_yscale * 0.6, image_angle, c_white, ring_alpha);
