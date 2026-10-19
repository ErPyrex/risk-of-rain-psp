draw_drone();
if (charge != 8)
{
    draw_set_alpha(0.3 + random(0.2));
    draw_line_width_color(x - 4, y, master.x, master.y + 4, 3, #7EB686, c_white);
    draw_line_width_color(x + 4, y, master.x, master.y + 4, 3, #7EB686, c_white);
    draw_set_alpha(1);
    draw_line_width_color(x - 4, y, master.x, master.y + 4, 1.5, #7EB686, #7EB686);
    draw_line_width_color(x + 4, y, master.x, master.y + 4, 1.5, #7EB686, #7EB686);
}
