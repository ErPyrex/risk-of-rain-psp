alpha = 60;
if (global.chatting && keyboard_string != "" && keyboard_string != " ")
{
    caster_play(41, global.volume, 1);
    ds_list_insert(chat, 0, global.my_player.user_name + ": " + keyboard_string);
    ds_list_insert(color, 0, get_chat_color(global.my_player.m_id));
    client_message_send(4, global.my_player.user_name + ": " + keyboard_string);
    server_message_send(0, 4, global.my_player.object_index, global.my_player.m_id, global.my_player.user_name + ": " + keyboard_string);
}
keyboard_string = "";
global.chatting = !global.chatting;
