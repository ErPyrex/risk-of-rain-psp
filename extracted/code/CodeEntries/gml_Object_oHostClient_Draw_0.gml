var d = 0;
var y_disp = 0;
var x_disp = 0;
var mouse_height = 0;
draw_set_font(global.fntSmall);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
if (gamepad_is_connected(0))
{
    if (gamepad_button_check_pressed(0, gp_face1))
    {
        event_perform(ev_mouse, ev_global_left_press);
    }
    if ((gamepad_button_check(0, gp_padu) || gamepad_axis_value(0, gp_axislv) < -0.75) && global.menu_delay == 0)
    {
        choice = max(0, choice - 1);
        global.mouse_on = 0;
        oInit.last_mouse_timer = 300;
        global.menu_delay = 20;
    }
    if ((gamepad_button_check(0, gp_padd) || gamepad_axis_value(0, gp_axislv) > 0.75) && global.menu_delay == 0)
    {
        choice = min(choice + 1, 8);
        global.mouse_on = 0;
        global.menu_delay = 20;
        oInit.last_mouse_timer = 300;
    }
}
for (i = 0; i <= 7; i += 1)
{
    if (i == 0 || i == 4)
    {
        mouse_height = 14;
        x_disp = 0;
        y_disp += 60;
        draw_set_font(global.fntSmall);
    }
    else if (i == 1 || i == 5)
    {
        mouse_height = 8;
        x_disp = 6;
        y_disp += 20;
        draw_set_font(global.fntTiny);
    }
    else
    {
        mouse_height = 8;
        x_disp = 6;
        y_disp += 15;
        draw_set_font(global.fntTiny);
    }
    if (global.mouse_on == 1)
    {
        if (mouse_y > ((view_yview[0] + (view_hview[0] * 0.1) + y_disp) - mouse_height) && mouse_y < (view_yview[0] + (view_hview[0] * 0.1) + y_disp + mouse_height) && abs(mouse_x - (view_xview[0] + (view_wview[0] / 2))) < 150)
        {
            choice = i;
        }
    }
    if (i == choice)
    {
        d = 16777215;
    }
    else if (i != 4 && i != 0)
    {
        d = 8421504;
    }
    else
    {
        d = 12632256;
    }
    if (i == 0 && port_open == -1)
    {
        d = 8421504;
    }
    if (i == true_choice)
    {
        d = 16777215;
    }
    switch (i)
    {
        case 2:
            if (i == true_choice)
            {
                menu[i] = "Port: " + keyboard_string + "_" + "";
            }
            else if (port_open == 2)
            {
                menu[i] = "Port: &r&" + string(global.host_port) + " (Limited)&!&";
            }
            else if (port_open == 1)
            {
                menu[i] = "Port: &b&" + string(global.host_port) + " (Open)&!& ";
            }
            else if (port_open == 0)
            {
                menu[i] = "Port: &y&" + string(global.host_port) + " (Unknown)&!& ";
            }
            else
            {
                menu[i] = "Port: " + string(global.host_port) + " (Searching...)";
            }
            break;
        case 3:
            if (i == true_choice)
            {
                menu[i] = "Player Name: " + keyboard_string + "_" + "";
            }
            else
            {
                menu[i] = "Player Name: &y&" + global.pref_name_host + "&y&";
            }
            break;
        case 5:
            if (i == true_choice)
            {
                menu[i] = "IP: " + keyboard_string + "_" + "";
            }
            else
            {
                menu[i] = "IP: &y&" + string(global.client_ip) + "&y&";
            }
            break;
        case 6:
            if (i == true_choice)
            {
                menu[i] = "Port: " + keyboard_string + "_" + "";
            }
            else
            {
                menu[i] = "Port: &y&" + string(global.client_port) + "&y&";
            }
            break;
        case 7:
            if (i == true_choice)
            {
                menu[i] = "Player Name: " + keyboard_string + "_" + "";
            }
            else
            {
                menu[i] = "Player Name: &y&" + global.pref_name_client + "&y&";
            }
            break;
    }
    draw_set_color(d);
    draw_ctext(((view_xview[0] + (view_wview[0] / 2)) - 50) + x_disp, view_yview[0] + (view_hview[0] * 0.1) + y_disp, menu[i]);
}
if (mouse_y > ((view_yview[0] + view_hview[0]) - 40))
{
    choice = 8;
}
if (choice == 8)
{
    d = 16777215;
}
else
{
    d = 8421504;
}
draw_set_halign(fa_center);
draw_text_outline("Back", view_xview[0] + (view_wview[0] / 2), (view_yview[0] + view_hview[0]) - 12, d, 4210752);
