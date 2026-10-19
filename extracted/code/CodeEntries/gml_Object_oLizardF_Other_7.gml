if (landing == 2)
{
    if (oInit.coop != 2 || global.host)
    {
        with (instance_create(x - (4 * image_xscale), y + 7, oLizardFG))
        {
            point_value = other.point_value;
            if (oInit.coop != 2)
            {
                hp = other.hp;
            }
            image_xscale = other.image_xscale;
            if (oInit.coop == 2 && global.host)
            {
                m_id = set_m_id(id);
                server_message_send(0, 12, object_index, m_id, x, y);
            }
        }
    }
    instance_destroy();
}
