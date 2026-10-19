if (global.pause == 0 && oMenu.mouse_cd == 0)
{
    oMenu.mouse_cd = 10;
    switch (choice)
    {
        case 1:
            room_goto(rStart);
            break;
    }
}
