view_yview[0] = room_height - view_hview[0];
background_y[6] = view_yview[0];
if (black_screen != 0)
{
    black_screen = max(0, black_screen - 0.05);
}
if (global.mouse_on)
{
    switch (menu_level)
    {
        case 0:
            if (mouse_y <= room_height && mouse_y >= ((view_yview[0] + view_hview[0]) - 32))
            {
                choice = 1;
            }
            else
            {
                choice = 0;
            }
            break;
    }
}
if (global.yoyocontrol[1] == 1)
{
    room_goto(rStart);
}
