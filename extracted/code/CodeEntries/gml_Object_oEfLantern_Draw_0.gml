draw_self();
draw_set_blend_mode(bm_add);
draw_set_alpha(image_alpha - 0.8);
draw_circle_color(x, y - 17, 30 + random(4), #EFD27B, #EFD27B, 0);
draw_circle_color(x, y - 17, 25 + random(2), #EFD27B, #EFD27B, 0);
draw_circle_color(x, y - 17, 15 + random(2), #EFD27B, #EFD27B, 0);
draw_set_blend_mode(bm_normal);
draw_set_alpha(1);
