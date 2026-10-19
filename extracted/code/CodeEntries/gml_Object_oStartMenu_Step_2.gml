background_x[1] = (view_xview[0] + (view_wview[0] / 2)) - (background_width[1] / 2);
if (black_screen != 0)
{
    black_screen = max(0, black_screen - 0.05);
}
ss += 0.005;
if (ss >= number)
{
    ss = 0;
}
choice = -1;
for (i = 1; i <= menu[menu_level, 0]; i += 1)
{
    if (mouse_y >= (view_yview[0] + menu_y_offset + (i * t)) && mouse_y < (view_yview[0] + menu_y_offset + (i * t) + 24))
    {
        choice = i;
    }
}
