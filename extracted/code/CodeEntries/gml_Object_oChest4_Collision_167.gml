can_activate = 1;
with (other)
{
    if (control(global.yes_key, 11, 1) == 1)
    {
        with (other)
        {
            if ((oHUD.gold >= cost && active == 0) || active == 1)
            {
                if ((oInit.coop == 2 && global.host) || oInit.coop != 2)
                {
                    if (other.firework != 0 && active == 0)
                    {
                        repeat (3 + (other.firework * 3))
                        {
                            s = instance_create(x, y, oEfFirework);
                            s.parent = other.id;
                            s.team = "playerproc";
                            s.damage = s.parent.damage * 3;
                        }
                        caster_play(124, global.volume, 1.5);
                    }
                    oHUD.gold -= cost;
                    active += 1;
                    if (oInit.coop == 2)
                    {
                        objServer.item_dibs = other.id;
                        server_message_send(0, 19, other.object_index, other.m_id, other.x, other.y, object_index, m_id, active, 1);
                    }
                }
                else if (oInit.coop == 2)
                {
                    client_message_send(19, other.x, other.y, object_index, m_id, active + 1);
                    active = -1;
                }
            }
            else
            {
                caster_play(75, global.volume, 1);
            }
        }
    }
}
