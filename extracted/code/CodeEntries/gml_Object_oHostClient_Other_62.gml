if (ds_map_find_value(async_load, "status") != 0)
{
    exit;
}
if (ds_map_find_value(async_load, "id") == httpID_ip)
{
    i_t = ds_map_find_value(async_load, "result");
    i_t = string_copy(i_t, string_pos("<p>", i_t) + 4, string_pos("</p>", i_t) - string_pos("<p>", i_t) - 4);
    global.host_ip = i_t;
    if (global.hide_ip == 0)
    {
        menu[1] = "IP: " + global.host_ip + " (Shown)";
    }
    else
    {
        menu[1] = "IP: --.---.---.--- (Hidden)";
    }
}
else if (ds_map_find_value(async_load, "id") == httpID_port)
{
    p_t = ds_map_find_value(async_load, "result");
    if (string_count("open", p_t))
    {
        port_open = 1;
    }
    else if (string_count("closed", p_t))
    {
        port_open = 2;
    }
    else
    {
        port_open = 0;
    }
}
