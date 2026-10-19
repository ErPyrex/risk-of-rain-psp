can_activate = 1;
with (other)
{
    if (control(global.yes_key, 11, 1) == 1)
    {
        with (other)
        {
            if (other.hp >= (other.maxhp * cost) && active == 0)
            {
                if ((oInit.coop == 2 && global.host) || oInit.coop != 2)
                {
                    other.hp -= (other.maxhp * cost);
                    other.shield = 0;
                    if (other.hp <= (other.maxhp * 0.05))
                    {
                        achievement_progress(44, 1);
                    }
                    s = instance_create(x, y, oEfDamage);
                    s.team = "enemy";
                    s.damage = cost;
                    active = 1;
                    if (oInit.coop == 2)
                    {
                        objServer.item_dibs = other.id;
                        server_message_send(0, 19, other.object_index, other.m_id, other.x, other.y, object_index, m_id, 1, 1);
                    }
                }
                else if (oInit.coop == 2)
                {
                    active = -1;
                    client_message_send(19, other.x, other.y, object_index, m_id, 1);
                }
            }
            else
            {
                caster_play(75, global.volume, 1);
            }
        }
    }
}
