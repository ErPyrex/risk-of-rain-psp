if (oInit.coop != 1 && player_id == 1)
{
    if (oInit.coop != 2 || !global.chatting)
    {
        switch (argument2)
        {
            case 0:
                if ((keyboard_check(argument0) == 1 && !global.joystick_on) || (use_joy(0, argument0, 0) && global.joystick_on))
                {
                    return 1;
                }
                break;
            case 1:
                if ((keyboard_check_pressed(argument0) == 1 && !global.joystick_on) || (use_joy(0, argument0, 1) && global.joystick_on))
                {
                    return 1;
                }
                break;
            case 2:
                if ((keyboard_check_released(argument0) == 1 && !global.joystick_on) || (use_joy(0, argument0, 2) && global.joystick_on))
                {
                    return 1;
                }
                break;
        }
    }
}
if (oInit.coop == 1)
{
    switch (argument2)
    {
        case 0:
            if ((keyboard_check(argument0) == 1 && oInit.player[player_id, 1] == 100) || (use_joy(oInit.player[player_id, 1], argument0, 0) && oInit.player[player_id, 1] != 100))
            {
                return 1;
            }
            break;
        case 1:
            if ((keyboard_check_pressed(argument0) == 1 && oInit.player[player_id, 1] == 100) || (use_joy(oInit.player[player_id, 1], argument0, 1) && oInit.player[player_id, 1] != 100))
            {
                return 1;
            }
            break;
        case 2:
            if ((keyboard_check_released(argument0) == 1 && oInit.player[player_id, 1] == 100) || (use_joy(oInit.player[player_id, 1], argument0, 2) && oInit.player[player_id, 1] != 100))
            {
                return 1;
            }
            break;
    }
}
return 0;
