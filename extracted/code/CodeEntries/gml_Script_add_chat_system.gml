var tobj;
if (global.host)
{
    tobj = 0;
}
else
{
    tobj = 1;
}
with (tobj)
{
    var tt = argument1;
    if (argument0 == 0 || (argument0 == 1 && !global.no_item_message))
    {
        ds_list_insert(chat, 0, tt);
        ds_list_insert(color, 0, 12632256);
        alpha = 60;
    }
    client_message_send(26, argument0, tt);
    server_message_send(0, 26, global.my_player.object_index, global.my_player.m_id, argument0, tt);
}
