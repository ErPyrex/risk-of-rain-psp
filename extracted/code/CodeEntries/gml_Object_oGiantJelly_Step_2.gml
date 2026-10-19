step_boss(0);
if (random(100) < 0.2 && inside_view(x, y) == 1)
{
    part_particles_create(global.above, x, y, global.pDust1, 1);
}
image_angle = direction - 90;
if (hp != lastHp)
{
    alarm[6] = 360;
}
if (global.time_stop == 0 && instance_exists(target))
{
    if ((point_distance(x, y, target.x, target.y) < 450 && alarm[2] == -1 && (oInit.coop != 2 || global.host)) || force_speedup)
    {
        if (image_speed == 0.2)
        {
            server_message_send(0, 10, object_index, m_id, x, y, target.parent.m_id, direction, 1);
        }
        image_speed = 0.3;
        turn_towards(direction, point_direction(x, y, xx, yy));
        if (distance_to_point(xx, yy) < 5)
        {
            force_speedup = 0;
            alarm[2] = 180;
        }
        speed = min(speed + 0.05, 3);
    }
    else
    {
        image_speed = 0.2;
        turn_towards(direction, point_direction(x, y, target.x, target.y));
        speed = max(speed - 0.05, max_speed);
        xx = target.x;
        yy = target.y;
    }
}
else
{
    target = instance_nearest(x, y, oPOI);
    if (instance_exists(target) && oInit.coop == 2)
    {
        server_message_send(0, 10, object_index, m_id, x, y, target.parent.m_id, direction, image_speed == 0.3);
    }
    if (global.time_stop != 0)
    {
        speed = 0;
        image_speed = 0;
    }
}
if ((hp <= 0 && (oInit.coop != 2 || global.host)) || force_death)
{
    instance_destroy();
}
if (lastHp > hp)
{
    caster_play(82, global.volume, 1);
    lastHp = hp;
}
