if (true_choice_last != true_choice && true_choice_last == 2)
{
    httpID_port = http_get("http://www.riskofraingame.com/checkport.php?port=" + string(global.host_port));
}
switch (true_choice)
{
    case 2:
        global.host_port = real(string_delete(string_digits(keyboard_string), 9, string_length(keyboard_string)));
        if (global.host_port != 0)
        {
            keyboard_string = string(global.host_port);
        }
        else
        {
            keyboard_string = "";
        }
        break;
    case 3:
        global.pref_name_host = string_replace_all(string_delete(keyboard_string, 16, 10), "#", "");
        global.pref_name_host = string_replace_all(global.pref_name_host, "&", "");
        keyboard_string = global.pref_name_host;
        break;
    case 5:
        global.client_ip = keyboard_string;
        break;
    case 6:
        global.client_port = real(string_delete(string_digits(keyboard_string), 9, string_length(keyboard_string)));
        if (global.client_port != 0)
        {
            keyboard_string = string(global.client_port);
        }
        else
        {
            keyboard_string = "";
        }
        break;
    case 7:
        global.pref_name_client = string_replace_all(string_delete(keyboard_string, 16, 10), "#", "");
        global.pref_name_client = string_replace_all(global.pref_name_client, "&", "");
        keyboard_string = global.pref_name_client;
        break;
}
