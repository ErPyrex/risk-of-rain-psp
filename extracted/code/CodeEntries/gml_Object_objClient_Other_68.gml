var nettype = ds_map_find_value(async_load, "type");
var netid = ds_map_find_value(async_load, "id");
var netip = ds_map_find_value(async_load, "ip");
var netsock = ds_map_find_value(async_load, "socket");
switch (nettype)
{
    case 2:
        global.client_connected = -1;
        with (instance_create(x, y, oError))
        {
            text1 = "Disconnected from host!";
        }
        network_destroy(netsock);
        instance_destroy();
        break;
    case 3:
        if (global.client_connected == -1)
        {
            global.client_connected = netsock;
            global.in_game = 1;
            alarm[2] = 60;
        }
        alarm[0] = 600;
        var buffer = ds_map_find_value(async_load, "buffer");
        var bufsize = ds_map_find_value(async_load, "size");
        var newbuf = buffer_create(bufsize, buffer_fixed, 1);
        buffer_copy(buffer, 0, bufsize, newbuf, 0);
        ds_queue_enqueue(global.yyNetQueue, netsock, newbuf);
        break;
}
