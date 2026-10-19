if ((oInit.coop != 2 || global.host) && instance_exists(target))
{
    with (instance_create(x, y, oImpS))
    {
        teleport_nearby(id, other.target.x, other.target.y);
        if (oInit.coop == 2)
        {
            m_id = set_m_id(id);
            server_message_send(0, 12, object_index, m_id, x, y);
        }
    }
}
alarm[1] = 30;
