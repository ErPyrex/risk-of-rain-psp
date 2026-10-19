if (global.pause == 0 && oMenu.mouse_cd == 0)
{
    oMenu.mouse_cd = 10;
    switch (choice)
    {
        case 0:
            if (port_open != -1)
            {
                instance_create(0, 0, objServer);
                room_goto(rSelectMult);
            }
            break;
        case 1:
            global.hide_ip = !global.hide_ip;
            if (global.hide_ip == 0)
            {
                menu[1] = "IP: " + global.host_ip + " (Shown)";
            }
            else
            {
                menu[1] = "IP: --.---.---.-- (Hidden)";
            }
            break;
        case 2:
            if (true_choice == choice)
            {
                true_choice = -1;
            }
            else if (true_choice != choice)
            {
                keyboard_string = string(global.host_port);
                true_choice = choice;
            }
            break;
        case 3:
            if (true_choice == choice)
            {
                true_choice = -1;
            }
            else if (true_choice != choice)
            {
                keyboard_string = global.pref_name_host;
                true_choice = choice;
            }
            break;
        case 4:
            instance_create(0, 0, objClient);
            room_goto(rSelectMult);
            break;
        case 5:
            if (true_choice == choice)
            {
                true_choice = -1;
            }
            else if (true_choice != choice)
            {
                keyboard_string = global.client_ip;
                true_choice = choice;
            }
            break;
        case 6:
            if (true_choice == choice)
            {
                true_choice = -1;
            }
            else if (true_choice != choice)
            {
                keyboard_string = string(global.client_port);
                true_choice = choice;
            }
            break;
        case 7:
            if (true_choice == choice)
            {
                true_choice = -1;
            }
            else if (true_choice != choice)
            {
                keyboard_string = global.pref_name_client;
                true_choice = choice;
            }
            break;
        case 8:
            room_goto(rStart);
            break;
        default:
            true_choice = -1;
            break;
    }
}
