activity_lizard();
step_lizard();
step_ai_default();
if (instance_exists(target))
{
    if ((point_distance(x, y, target.x, target.y) > 200 || abs(target.y - y) > 50) && ghost == 0)
    {
        if (oInit.coop != 2 || global.host)
        {
            with (instance_create(x, y - 3, oLizardF))
            {
                if (oInit.coop != 2)
                {
                    hp = other.hp;
                }
                image_xscale = other.image_xscale;
                if (oInit.coop == 2)
                {
                    server_message_send(0, 43, other.object_index, other.m_id);
                }
            }
        }
        instance_destroy();
    }
}
