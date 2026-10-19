can_activate = 1;
with (other)
{
    if (control(global.yes_key, 11, 1) == 1)
    {
        with (other)
        {
            if (other.keycard >= 1 && active == 0)
            {
                if ((oInit.coop == 2 && global.host) || oInit.coop != 2)
                {
                    other.keycard -= 1;
                    active = 1;
                    var tlast = 0;
                    for (i = 0; i <= other.item_count; i += 1)
                    {
                        if (tlast == 1)
                        {
                            other.item[i - 1, 0] = other.item[i, 0];
                            other.item[i - 1, 1] = other.item[i, 1];
                            other.item[i - 1, 2] = other.item[i, 2];
                        }
                        if (other.item[i, 0] == 851)
                        {
                            other.item[i, 1] -= 1;
                            if (other.item[i, 1] == 0)
                            {
                                tlast = 1;
                            }
                            else
                            {
                                tlast = 0;
                                break;
                            }
                        }
                    }
                    if (tlast == 1)
                    {
                        other.item[other.item_count, 0] = -1;
                        other.item[other.item_count, 1] = -1;
                        other.item[other.item_count, 2] = -1;
                        other.item_count -= 1;
                    }
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
