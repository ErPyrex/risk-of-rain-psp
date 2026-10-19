ds_list_destroy(ban);
ds_list_destroy(joining);
ds_list_destroy(chat);
ds_list_destroy(color);
ds_list_destroy(new_players);
network_destroy(listen);
disconnect_server();
