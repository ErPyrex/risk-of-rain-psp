if (instance_exists(argument0))
{
    if (argument2 == 0)
    {
        if (room == rSelectMult)
        {
            server_message_send(argument0.sock, 17, argument0.object_index, argument0.m_id);
        }
        else
        {
            server_message_send(argument0.sock, 17, 0, argument0.m_id);
        }
    }
    closesocket(argument0.sock);
    if (argument1 == 0)
    {
        ds_list_delete(objServer.players, ds_list_find_index(objServer.players, argument0));
        ds_list_delete(objServer.socks, ds_list_find_index(objServer.socks, argument0.sock));
    }
    if (argument0.player_set)
    {
        add_chat_system(0, "'" + argument0.user_name + "' has left the game!");
    }
    with (argument0)
    {
        instance_destroy();
    }
    with (oPrePlayer)
    {
        ready = 0;
    }
    if (room != rSelectMult)
    {
        refresh_players();
    }
    else
    {
        refresh_classes();
    }
}
