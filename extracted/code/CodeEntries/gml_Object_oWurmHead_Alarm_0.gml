alarm[0] = 30;
if (shooting != 0)
{
    exit;
}
if (oInit.coop != 2 || global.host)
{
    target = instance_nearest(x, y, oPOI);
    if (target != last_target && (oInit.coop == 2 && global.host) && instance_exists(target))
    {
        server_message_send(0, 10, object_index, m_id, x, hp, target.parent.m_id, direction, 0);
    }
}
if (instance_exists(target))
{
    targetx = target.x;
    targety = target.y;
    if (point_distance(x, y, target.x, target.y) < 100)
    {
        if (type == 1)
        {
            alarm[0] = 180;
        }
        else
        {
            alarm[0] = 120;
        }
        dashing = 1;
    }
    else
    {
        dashing = 0;
        if (alarm[1] == -1 && !shooting && (((((point_direction(x, y, target.x, target.y) - direction) % 360) + 540) % 360) - 180) < 45)
        {
            image_speed = 0;
            alarm[2] = cooldown;
            image_index = 0;
            shooting = 1;
            shooting_variable = 0;
            drawx = targetx;
            drawy = targety;
        }
    }
}
else
{
    targetx = x;
    targety = room_height;
}
