step_default();
if (activity == 0 && alarm[2] == -1 && z_skill == 1)
{
    if (inside_view(x, y) == 1)
    {
        alarm[2] = skill[0, 2] * (1 - cdr);
    }
    activity_var1 = 0;
    activity = 1;
    activity_type = 1;
    image_index = 0;
}
if (activity == 0 && alarm[3] == -1 && x_skill == 1 && instance_exists(target))
{
    if (team == "enemy")
    {
        if (target.parent.free == 0 && target.parent.activity != 30)
        {
            alarm[3] = skill[1, 2];
            activity_var1 = 0;
            activity = 2;
            activity_type = 1;
            image_index = 0;
            caster_play(98, global.volume, 1);
        }
    }
    else
    {
        alarm[3] = skill[1, 2];
        activity_var1 = 0;
        activity = 2;
        activity_type = 1;
        image_index = 0;
        caster_play(98, global.volume, 1);
    }
}
