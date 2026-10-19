draw_drone();
if (charge != 8)
{
    draw_set_alpha(0.3 + random(0.2));
    draw_line_width_color(x, y, master.x, master.y, 3, #7EB686, c_white);
    draw_set_alpha(1);
    draw_line_width_color(x, y, master.x, master.y, 1.5, #7EB686, #7EB686);
}
