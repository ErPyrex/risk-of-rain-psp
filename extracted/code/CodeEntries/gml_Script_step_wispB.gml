step_default();
death_timer = 60;
if (activity == 0 && free == 0 && alarm[2] == -1 && z_skill == 1)
{
    if (inside_view(x, y) == 1)
    {
        caster_play(161, global.volume, 1);
    }
    alarm[2] = (skill[0, 2] * (1 - cdr) * (hp / maxhp)) + 120;
    activity_var1 = 0;
    activity = 1;
    image_index = 0;
}
