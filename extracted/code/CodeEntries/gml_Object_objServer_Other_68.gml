var nettype = ds_map_find_value(async_load, "type");
var netid = ds_map_find_value(async_load, "id");
var netip = ds_map_find_value(async_load, "ip");
var netsock = ds_map_find_value(async_load, "socket");
switch (nettype)
{
    case 1:
        if (instance_number(oPrePlayer) >= global.max_players_online || room != rSelectMult)
        {
            network_destroy(netsock);
            exit;
        }
        if (ds_list_find_index(ban, netip) < 0 && room == rSelectMult)
        {
            ds_list_add(new_players, netsock);
            alarm[2] = 60;
        }
        else
        {
            network_destroy(netsock);
        }
        break;
    case 2:
        tp = find_player(netsock);
        if (tp != -1 && tp != global.my_player)
        {
            if (!tcpconnected(tp.sock))
            {
                disconnect_player(tp, 0, 0);
            }
        }
        break;
    case 3:
        var buffer = ds_map_find_value(async_load, "buffer");
        var bufsize = ds_map_find_value(async_load, "size");
        var newbuf = buffer_create(bufsize, buffer_fixed, 1);
        buffer_copy(buffer, 0, bufsize, newbuf, 0);
        ds_queue_enqueue(global.yyNetQueue, netid, newbuf);
        break;
}
