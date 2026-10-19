if (instance_exists(target))
{
    target_direction = point_direction(x, y, target.x, target.y);
}
else
{
    target = instance_nearest(x, y, oPOI);
    if (oInit.coop == 2 && global.host && instance_exists(target))
    {
        server_message_send(0, 10, object_index, m_id, x, y, target.parent.m_id, direction, 0);
    }
}
alarm[0] = 30;
