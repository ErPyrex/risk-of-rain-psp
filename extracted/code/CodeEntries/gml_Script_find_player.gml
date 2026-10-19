for (var j = 0; j < ds_list_size(objServer.players); j += 1)
{
    var tp = ds_list_find_value(objServer.players, j);
    if (tp.sock == argument0)
    {
        return tp;
    }
}
return -1;
