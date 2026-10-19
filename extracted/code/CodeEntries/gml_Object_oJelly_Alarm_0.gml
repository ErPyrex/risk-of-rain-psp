target = instance_nearest(x, y, oPOI);
if (instance_exists(target) && oInit.coop == 2)
{
    server_message_send(0, 10, object_index, m_id, x, y, target.parent.m_id, direction, image_speed == 0.4);
}
if (oInit.coop != 2)
{
    alarm[0] = 15 + random(30);
}
else
{
    alarm[0] = 30;
}
