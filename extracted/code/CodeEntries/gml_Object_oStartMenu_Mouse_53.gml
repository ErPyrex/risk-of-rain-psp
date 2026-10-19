if (global.pause == 0 && oMenu.mouse_cd == 0)
{
    oMenu.mouse_cd = 10;
    switch (menu_level)
    {
        case 0:
            switch (choice)
            {
                case 1:
                    room_goto(rSelect);
                    break;
                case 2:
                    room_goto(rSelectCoop);
                    break;
                case 3:
                    room_goto(rHost);
                    break;
                case 4:
                    room_goto(rStorage);
                    break;
                case 5:
                    room_goto(rBook);
                    break;
                case 6:
                    room_goto(rHighscore);
                    break;
                case 7:
                    with (oMenu)
                    {
                        event_perform(ev_keypress, vk_escape);
                    }
                    break;
                case 8:
                    game_end();
                    break;
            }
            break;
    }
}
