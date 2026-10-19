draw_self();
if (beep == 1)
{
    draw_set_color(#EFD27B);
    draw_line(x - 8, y - 8, x - 5, y - 8);
    draw_line(x + 8, y - 8, x + 5, y - 8);
    draw_line(x - 8, y + 8, x - 5, y + 8);
    draw_line(x + 8, y + 8, x + 5, y + 8);
    draw_line(x - 8, y - 8, x - 8, y - 5);
    draw_line(x + 8, y - 8, x + 8, y - 5);
    draw_line(x - 8, y + 8, x - 8, y + 5);
    draw_line(x + 8, y + 8, x + 8, y + 5);
}
