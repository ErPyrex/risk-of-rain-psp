owner = instance_nearest(x, y, oP);
if (instance_exists(owner) == 0)
{
    exit;
}
minions -= 1;
if (not_client())
{
    i = instance_create((owner.x - 5) + random(10), owner.y - 10 - random(20), oImpM);
    i.parent = id;
    if (hosting())
    {
        with (i)
        {
            m_id = set_m_id(id);
            moveLeft = choose(1, 0);
            moveRight = !moveLeft;
            server_message_send(0, 35, object_index, m_id, x, y, parent.m_id, moveLeft, moveRight);
        }
    }
}
if (minions > 0)
{
    alarm[0] = 15;
}
