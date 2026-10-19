draw_set_color(#A93F42);
draw_circle(x, y, 3, 1);
draw_set_alpha(0.3);
draw_circle(x, y, (5 * (value / 2)) + random_range(-1, 1), 0);
draw_point_color(x, y, c_white);
draw_set_alpha(1);
