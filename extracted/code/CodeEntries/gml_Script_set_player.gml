if (oInit.version != argument2)
{
    with (instance_create(x, y, oError))
    {
        text1 = "Host version: " + argument2;
    }
    return 0;
    closesocket(0);
    exit;
}
if (global.my_player == -1)
{
    global.my_player = instance_create(0, 0, oPrePlayer);
}
var tp = global.my_player;
tp.user_name = oInit.pref_name;
tp.m_id = argument0;
tp.player_set = 1;
client_message_send(5, global.my_player.class, global.my_player.x, global.my_player.y, global.my_player.user_name + "|" + global.my_player.login);
add_chat_system(0, "'" + global.pref_name_client + "' has joined the game!");
return 1;
