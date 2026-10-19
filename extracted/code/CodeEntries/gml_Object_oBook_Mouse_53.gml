if (global.pause == 0 && oMenu.mouse_cd == 0)
{
    oMenu.mouse_cd = 10;
    switch (menu_level)
    {
        case 0:
            switch (choice)
            {
                case 1:
                    if (page == -1)
                    {
                        room_goto(rStart);
                    }
                    else
                    {
                        choice = 0;
                        table_choice = page;
                        flipping_pages = -1;
                        flipping_pages_jump = page + 1;
                    }
                    break;
            }
            break;
    }
}
if (page < max_page && page != -1 && point_distance(mouse_x, mouse_y, view_xview[0] + (view_wview[0] / 2) + book_width + 10, view_yview[0] + 16 + floor(book_height / 2)) < 15 && flipping_pages == 0)
{
    flipping_pages = 1;
}
if (page != -1 && point_distance(mouse_x, mouse_y, (view_xview[0] + (view_wview[0] / 2)) - book_width - 10, view_yview[0] + 16 + floor(book_height / 2)) < 15 && flipping_pages == 0)
{
    flipping_pages = -1;
}
