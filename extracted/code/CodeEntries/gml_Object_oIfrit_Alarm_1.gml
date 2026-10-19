if (oInit.coop != 2)
{
    exit;
}
server_message_send(0, 22, object_index, m_id, x, y, sign(elite), image_blend);
