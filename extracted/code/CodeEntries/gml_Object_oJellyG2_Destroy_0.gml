if (oCommand.active == 0)
{
    var tp = instance_nearest(x, y, oP);
    npc_death(1, force_death);
    caster_play(106, global.volume, 1);
}
if (has_leg == 1)
{
    for (s = 0; s != 2; s += 1)
    {
        for (i = 1; i <= 2; i += 1)
        {
            with (leg[s, i])
            {
                instance_destroy();
            }
        }
    }
}
