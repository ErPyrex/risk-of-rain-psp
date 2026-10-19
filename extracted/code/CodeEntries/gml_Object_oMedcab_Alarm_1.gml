if (oInit.coop == 2 && global.host)
{
    m_id = global.chest_index;
    global.chest_index += 1;
    server_message_send(0, 12, object_index, m_id, x, y);
}
