draw_line_color(x, y, x + lengthdir_x(thigh_length, angle), y + lengthdir_y(thigh_length, angle), c_white, c_white);
t = collision_line_advanced(x - 30, y, x - 30, y + 200, 43, 0, 0);
ty = global.collision_y;
draw_line_color(x - 30, y, x - 30, ty, c_yellow, c_yellow);
y = ((ty - 40 - (2 * cos(degtorad(ff * 2)))) + y) / 2;
