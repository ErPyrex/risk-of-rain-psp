if (oInit.coop == 2 && !global.host)
{
    exit;
}
if (size_s > 0.25 && !ghost)
{
    repeat (2)
    {
        with (instance_create(x, y, oSlime))
        {
            size_s = other.size_s * 0.5;
            maxhp = other.maxhp * 0.5;
            damage = other.damage * 0.4;
            exp_worth = other.exp_worth * 0.3;
            elite = other.elite;
            elite_tier = other.elite_tier;
            image_blend = other.image_blend;
            if (size_s == 0.5)
            {
                name = "Gip";
            }
            else
            {
                name = "Geep";
            }
            if (oInit.coop == 2)
            {
                m_id = set_m_id(id);
                server_message_send(0, 44, object_index, m_id, x, y, size_s, maxhp, damage, exp_worth, elite, elite_tier, image_blend);
            }
        }
    }
}
