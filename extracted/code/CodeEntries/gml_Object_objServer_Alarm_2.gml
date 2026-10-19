if (ds_list_size(new_players) > 0)
{
    server_new_player(ds_list_find_value(new_players, 0));
    ds_list_delete(new_players, 0);
}
if (ds_list_size(new_players) > 0)
{
    alarm[2] = 60;
}
