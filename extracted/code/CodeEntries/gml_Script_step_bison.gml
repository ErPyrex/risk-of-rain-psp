step_default();
if (activity == 0 && alarm[2] == -1 && z_skill == 1)
{
    alarm[2] = skill[0, 2] * (1 - cdr);
    activity_var1 = 0;
    activity = 1;
    image_index = 0;
    caster_play(sound_attack1, global.volume, 1);
}
