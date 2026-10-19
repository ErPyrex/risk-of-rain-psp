f = 0;
offset = 0;
with (instance_create(x, y, oWhiteFlash))
{
    rate = 0.1;
    image_blend = #BF4A4E;
}
alarm[0] = 180;
alarm[1] = 90;
if (oInit.coop == 2 && global.host)
{
    server_message_send(0, 12, object_index, 0, x, y);
}
target = choose(instance_find(oPOI, irandom(instance_number(oPOI) - 1)));
