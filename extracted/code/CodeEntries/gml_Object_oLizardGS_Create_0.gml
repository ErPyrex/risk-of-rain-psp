event_inherited();
init_ai_default();
z_range = 44;
init_lizardGS();
if (oInit.coop == 2 && global.host)
{
    m_id = set_m_id(id);
    server_message_send(0, 12, object_index, m_id, x, y);
}
init_boss();
