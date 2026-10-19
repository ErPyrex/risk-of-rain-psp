step_default();
if (activity == 0 && alarm[2] == -1 && z_skill == 1)
{
    z_count += 1;
    image_index = 0;
    alarm[2] = (skill[0, 2] * (1 - cdr)) / attack_speed;
    activity_var1 = 0;
    activity = 1.1;
}
if (activity == 0 && alarm[2] == -1 && z_skill == 2)
{
    z_count += 1;
    image_index = 0;
    alarm[2] = (skill[0, 2] * (1 - cdr)) / attack_speed;
    activity_var1 = 0;
    activity = 1.2;
}
if (activity == 0 && alarm[4] == -1 && c_skill == 1)
{
    z_count = 0;
    alarm[4] = (skill[1, 2] * (1 - cdr)) / attack_speed;
    activity_var1 = 0;
    activity = 3.2;
    activity_type = 1;
    image_index = 0;
}
