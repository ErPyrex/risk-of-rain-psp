if (landing == 0)
{
    if (oInit.coop != 2)
    {
        alarm[0] = 15 + (random(30) / intended_speed);
    }
    else
    {
        alarm[0] = 30 / intended_speed;
    }
    var poi;
    if (oInit.coop != 2 || global.host)
    {
        poi = instance_nearest(x, y, oPOI);
        if (poi != target && poi > 0)
        {
            target = poi;
            if (oInit.coop == 2 && global.host)
            {
                server_message_send(0, 10, object_index, m_id, x, y, poi.parent.m_id, direction, intended_speed == 3);
            }
        }
    }
    else
    {
        poi = target;
    }
    if (instance_exists(poi))
    {
        if (oInit.coop != 2)
        {
            targetx = poi.x + ((random_range(-10, 10) * random_range(-10, 10) * intended_speed) == 1.3);
            targety = poi.y + ((random_range(-10, 10) * random_range(-10, 10) * intended_speed) == 1.3);
        }
        else
        {
            targetx = poi.x;
            targety = poi.y;
        }
        if (random(100) < 6 && instance_exists(oB) && landing == 0 && (oInit.coop != 2 || global.host))
        {
            landing = 1;
            if (landing == 1)
            {
                if (oInit.coop != 2 || global.host)
                {
                    intended_speed = 4;
                    image_speed = 0.4;
                    var n = poi;
                    var f = instance_nearest(n.x, n.y, oB);
                    targetx = min(max(f.x + 16, n.x + random_range(-60, 60)), (f.x + (f.width_box * 16)) - 16);
                    targety = f.y - 15;
                }
            }
            if (oInit.coop == 2)
            {
                server_message_send(0, 42, object_index, m_id, targetx, targety);
            }
        }
    }
}
