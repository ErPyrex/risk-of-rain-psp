step_boss(2);
activity_boss1();
step_boss1();
if (ceil((hp / maxhp) * 3) < armor_buff && armor_buff > 1)
{
    armor += 999999;
    attack_speed += 0.3;
    apply_buff(id, 29, 900);
    armor_buff -= 1;
    instance_create(x, y, oBoss1Shield);
}
knockback_value = 0;
alarm[7] = -1;
step_ai_default();
