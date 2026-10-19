step_default();
if (activity == 0 && alarm[2] == -1 && z_skill == 1)
{
    caster_play(40, global.volume, 0.7);
    alarm[2] = (skill[0, 2] * (1 - cdr)) / attack_speed;
    activity_var1 = 0;
    activity = 1;
    image_index = 0;
}
if (activity == 0 && alarm[3] == -1 && x_skill == 1)
{
    caster_play(71, global.volume, 2);
    if (inside_view(x, y) == 1)
    {
        alarm[3] = (skill[1, 2] * (1 - cdr)) / attack_speed;
    }
    activity_var1 = 0;
    activity = 2;
    image_index = 0;
}
if (activity == 0 && alarm[4] == -1 && c_skill == 1)
{
    if (inside_view(x, y) == 1)
    {
        alarm[4] = (skill[2, 2] * (1 - cdr)) / attack_speed;
    }
    activity_var1 = 0;
    activity = 3;
    image_index = 0;
}
if (activity == 0 && attack_speed_buffed == 0 && hp < (maxhp * 0.5))
{
    caster_play(105, global.volume, 2);
    activity_var1 = 0;
    activity = 4;
    image_index = 0;
}
