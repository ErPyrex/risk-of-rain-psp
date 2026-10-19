var tk = 0;
var player = instance_create(0, 0, oPrePlayer);
player.sock = argument0;
player.m_id = set_m_id(player);
oSelectMult.player[instance_number(oPrePlayer), 5] = player.m_id;
server_message_send_direct(player.sock, 2, oInit.object_index, oInit.m_id, player.m_id, room, oInit.version);
server_message_send_direct(player.sock, 39, 0, 0, global.diff_level, global.fair_loot, oInit.artifact_active[0], oInit.artifact_active[1], oInit.artifact_active[2], oInit.artifact_active[3], oInit.artifact_active[4], oInit.artifact_active[5], oInit.artifact_active[6], oInit.artifact_active[7], oInit.artifact_active[8], oInit.artifact_active[9]);
for (j = 0; j < ds_list_size(objServer.players); j += 1)
{
    tk = ds_list_find_value(objServer.players, j);
    server_message_send_direct(player.sock, 3, oInit.object_index, oInit.m_id, tk.x, tk.y, tk.m_id, tk.class, 0, tk.user_name + "|" + tk.login);
}
tk = global.my_player;
server_message_send_direct(player.sock, 3, oInit.object_index, oInit.m_id, tk.x, tk.y, tk.m_id, tk.class, 1, tk.user_name + "|" + tk.login);
tk = player;
server_message_send(player.sock, 3, oInit.object_index, oInit.m_id, tk.x, tk.y, tk.m_id, tk.class, 0, tk.user_name + "|" + tk.login);
ds_list_add(objServer.players, player);
if (ds_list_find_index(objServer.socks, player.sock) == -1)
{
    ds_list_add(objServer.socks, player.sock);
}
with (oPrePlayer)
{
    ready = 0;
}
refresh_classes();
