step_boss(0);
activity_boss3();
step_boss1();
if (ceil((hp / maxhp) * 3) < armor_buff && armor_buff > 1)
{
    armor += 999999;
    attack_speed += 0.3;
    apply_buff(id, 29, 900);
    armor_buff -= 1;
    instance_create(x, y, oBoss1Shield);
    if (oInit.coop != 2 || global.host)
    {
        with (instance_create(x, y, oBoss2Clone))
        {
            if (global.host)
            {
                m_id = set_m_id(id);
                server_message_send(0, 12, object_index, m_id, x, y);
            }
        }
    }
}
knockback_value = 0;
alarm[7] = -1;
step_ai_default();
