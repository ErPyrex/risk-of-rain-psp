draw_set_color(#88D367);
draw_circle(x, y, 3, 1);
draw_circle(x, y, 3 * (value / 10), 1);
draw_set_alpha(0.1);
draw_circle(x, y, 3 * (value / 10), 0);
draw_point_color(x, y, c_white);
draw_set_alpha(1);
