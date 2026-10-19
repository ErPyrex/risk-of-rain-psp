if (global.pause == 0 && oMenu.mouse_cd == 0)
{
    oMenu.mouse_cd = 10;
    switch (menu_level)
    {
        case 0:
            switch (choice)
            {
                case 1:
                    room_goto(rStart);
                    break;
            }
            break;
    }
}
