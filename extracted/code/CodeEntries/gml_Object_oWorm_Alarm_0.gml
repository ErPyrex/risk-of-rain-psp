if (oInit.coop != 2 || global.host)
{
    target = instance_find(oPOI, irandom(instance_number(oPOI) - 1));
}
if (instance_exists(target))
{
    if (oInit.coop != 2 || global.host)
    {
        f = -300 + random(600);
    }
    head = instance_create(target.x + (f * (hp / maxhp)), target.y + 800, oWormHead);
    head.controller = id;
    head.speed = worm_speed;
    head.worm_gravity = worm_gravity;
    head.target = target;
    head.image_blend = image_blend;
    head.damage = damage;
    head.hp = hp;
    head.maxhp = maxhp;
    if (oInit.coop != 2 || global.host)
    {
        with (head)
        {
            m_id = set_m_id(id);
            for (i = 1; i <= 19; i += 1)
            {
                s = instance_create(x - lengthdir_x(i * 20, direction), y - lengthdir_y(i * 20, direction), oWormBody);
                s.head = id;
                body[i] = s;
                s.parent = body[i - 1];
                s.image_yscale = (1 - (i / 30)) * choose(1, -1);
                s.image_index = random(3);
                s.m_id = m_id + 1;
                s.hp = hp;
                s.maxhp = maxhp;
            }
        }
    }
    s = instance_create(target.x + (f / 3), target.y - 32, oWormWarning);
    with (s)
    {
        move_contact_solid(270, -1);
    }
    s.alarm[0] = point_distance(head.x, head.y, s.x, s.y) / worm_speed;
    head.direction = point_direction(head.x, head.y, s.x, s.y);
    if (oInit.coop == 2 && !global.host)
    {
        head.m_id = client_mid;
        with (head)
        {
            for (i = 1; i <= 19; i += 1)
            {
                s = instance_create(x - lengthdir_x(i * 20, direction), y - lengthdir_y(i * 20, direction), oWormBody);
                s.head = id;
                body[i] = s;
                s.parent = body[i - 1];
                s.image_yscale = (1 - (i / 30)) * choose(1, -1);
                s.image_index = random(3);
                s.m_id = other.client_mid + i;
                s.hp = hp;
                s.maxhp = hp;
            }
        }
    }
    head.alarm[1] = s.alarm[0];
    if (oInit.coop == 2 && global.host)
    {
        server_message_send(0, 10, object_index, m_id, f, hp, target.parent.m_id, head.m_id, 0);
    }
}
else if (oInit.coop != 2 || global.host)
{
    alarm[0] = 20;
}
