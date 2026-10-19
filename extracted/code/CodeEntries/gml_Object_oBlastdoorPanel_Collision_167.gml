if (locked)
{
    exit;
}
can_activate = 1;
with (other)
{
    if (control(global.yes_key, 11, 1) == 1)
    {
        with (other)
        {
            if (active == 0)
            {
                if ((oInit.coop == 2 && global.host) || oInit.coop != 2)
                {
                    active = 1;
                    value = (value * power(global.enemy_buff, 0.4)) + ((global.diff_level - 1) * 20);
                    global.director.bonus_rate += 5;
                    global.director.points += value;
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
        }
    }
}
