owner = -5;
m_id = global.treasure_index;
global.treasure_index += 1;
sound_played = 0;
f = 0;
pGravity = 0.1;
pVspeed = 0;
image_speed = 0;
yo = 0;
yy = 0;
used = 0;
alarm[0] = 60;
time = 2700;
if (global.diff_level >= 2)
{
    if (oInit.item_found[object_to_item(object_index)] == 0)
    {
        oInit.item_found_temp[object_to_item(object_index)] = 1;
    }
}
item_dibs = -1;
force_pickup = -5;
icount = 120;
tier = "or";
if (oInit.coop == 2)
{
    if (global.host)
    {
        if (objServer.item_dibs != -1)
        {
            item_dibs = objServer.item_dibs;
            objServer.item_dibs = -1;
        }
    }
    server_message_send(0, 12, object_index, m_id, x, y);
}
