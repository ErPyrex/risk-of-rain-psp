step_default();
if (activity == 0 && alarm[2] == -1 && z_skill == 1)
{
    alarm[2] = skill[0, 2] / attack_speed;
    activity_var1 = 0;
    activity = 1;
    image_index = 0;
    z_skill = 0;
}
if (activity == 0 && alarm[3] == -1 && x_skill == 1)
{
    alarm[3] = skill[1, 2] * (1 - cdr);
    activity_var1 = 0;
    activity = 2;
    image_index = 0;
}
