draw_set_alpha(1);
draw_set_blend_mode(bm_add);
draw_primitive_begin(pr_trianglestrip);
draw_vertex_color(x, y, color1, image_alpha / 3);
draw_vertex_color(x + global.width, y, color1, image_alpha / 3);
draw_vertex_color(x + lengthdir_x(length, direction - 0.5), y + lengthdir_y(length, direction - 0.5), color1, image_alpha / 5);
draw_vertex_color(x + lengthdir_x(length, direction + 0.5) + global.width, y + lengthdir_y(length, direction + 0.5), color1, image_alpha / 5);
draw_primitive_end();
draw_set_blend_mode(bm_normal);
