if (listen < 0)
{
    listen = network_create_server(0, global.host_port, global.max_players_online);
    alarm[1] = 30;
    exit;
}
if (!global.hide_ip)
{
    add_chat_system(0, "Game hosted successfully");
    add_chat_system(0, "IP: " + global.host_ip);
    add_chat_system(0, "Port: " + string(global.host_port));
}
else
{
    add_chat_system(0, "Game hosted successfully!");
}
