var activate_epic = 0;
var activate = 0;
if (locked || room == r6_1_1)
{
    exit;
}
can_activate = 1;
with (other)
{
    if (control(global.yes_key, 11, 1) == 1)
    {
        activate = 1;
    }
    if (control(global.swap_key, 13, 1) == 1 && other.epic)
    {
        activate_epic = 1;
    }
    if (activate_epic == 1 || activate == 1)
    {
        with (other)
        {
            if (active == 0)
            {
                if ((oInit.coop == 2 && global.host) || oInit.coop != 2)
                {
                    active = 1;
                    if (oInit.current_level < 3)
                    {
                        global.music_name = choose(2, 3, 4);
                    }
                    else
                    {
                        global.music_name = choose(5, 6, 7);
                    }
                    value = (value * power(global.enemy_buff, 0.4)) + ((global.diff_level - 1) * 50);
                    global.director.bonus_rate += 5;
                    global.director.points += value;
                    global.director.spawn_boss = 1;
                    if (oInit.coop == 2)
                    {
                        server_message_send(0, 19, other.object_index, other.m_id, other.x, other.y, object_index, m_id, 1, 1);
                    }
                }
                else if (oInit.coop == 2)
                {
                    active = -1;
                    client_message_send(19, other.x, other.y, object_index, m_id, 1);
                }
            }
            if (active == 3)
            {
                if (!activate_epic)
                {
                    locked = 1;
                    if (oInit.coop == 2)
                    {
                        if (global.host)
                        {
                            active = 4;
                        }
                        server_message_send(0, 19, other.object_index, other.m_id, other.x, other.y, object_index, m_id, 4, 1);
                        client_message_send(19, other.x, other.y, object_index, m_id, 4);
                    }
                    else
                    {
                        active = 4;
                    }
                }
                else
                {
                    locked = 1;
                    if (oInit.coop == 2)
                    {
                        if (global.host)
                        {
                            active = 6;
                        }
                        server_message_send(0, 19, other.object_index, other.m_id, other.x, other.y, object_index, m_id, 6, 1);
                        client_message_send(19, other.x, other.y, object_index, m_id, 6);
                    }
                    else
                    {
                        active = 6;
                    }
                }
            }
        }
    }
}
