draw_set_alpha(0.6);
draw_circle_color(x, y, 5 + random(0.3), #EFD27B, #EFD27B, 0);
draw_set_alpha(0.2);
draw_circle_color(x, y, 7 + random(0.3), #EFD27B, #EFD27B, 0);
draw_set_alpha(1);
draw_circle_color(x, y, 3, c_white, c_white, 0);
if (global.diff_level != 3)
{
    draw_circle_color(target_x, target_y, 3, c_white, c_white, 1);
}
