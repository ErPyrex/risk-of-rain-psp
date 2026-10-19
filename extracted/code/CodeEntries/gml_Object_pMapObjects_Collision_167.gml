var tactivate = 1;
with (pChest)
{
    if (can_activate)
    {
        tactivate = 0;
    }
}
if (tactivate && active == 0)
{
    can_activate = 1;
}
if (can_activate == 1)
{
    with (other)
    {
        if (control(global.yes_key, 11, 1) == 1)
        {
            with (other)
            {
                if (oHUD.gold >= cost && active == 0)
                {
                    if (other.firework != 0)
                    {
                        repeat (3 + (other.firework * 3))
                        {
                            s = instance_create(x, y, oEfFirework);
                            s.team = "playerproc";
                            s.damage = other.damage * 3;
                        }
                        caster_play(124, global.volume, 1.5);
                        if (oInit.coop == 2)
                        {
                            client_message_send(48, x, y, other.damage * 3, 3 + (other.firework * 3));
                            server_message_send(0, 48, other.object_index, other.m_id, x, y, other.damage * 3, 3 + (other.firework * 3));
                        }
                    }
                    if ((oInit.coop == 2 && global.host) || oInit.coop != 2)
                    {
                        oHUD.gold -= cost;
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
}
