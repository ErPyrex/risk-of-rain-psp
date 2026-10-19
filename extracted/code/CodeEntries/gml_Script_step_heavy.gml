step_default();
step_player();
if (activity == 0 && alarm[2] == -1 && z_skill == 1)
{
    alarm[2] = skill[0, 2] / attack_speed;
    activity_var1 = 0;
    activity = 1;
    image_index = 0;
}
if (activity == 0 && alarm[3] == -1 && x_skill == 1)
{
    alarm[3] = skill[1, 2] * (1 - cdr);
    activity_var1 = 0;
    activity = 2;
    image_index = 0;
}
if (activity == 0 && alarm[4] == -1 && c_skill == 1)
{
    alarm[4] = skill[2, 2] * (1 - cdr);
    activity_var1 = 0;
    activity = 3;
    image_index = 0;
}
if (activity == 0 && alarm[5] == -1 && v_skill == 1)
{
    alarm[5] = skill[3, 2] * (1 - cdr);
    activity_var1 = 0;
    if (check_trace(600, 0) == 1 && check_trace(600, 180) == 1)
    {
        activity = 4.1;
    }
    else
    {
        activity = 4.2;
    }
    image_index = 0;
}
