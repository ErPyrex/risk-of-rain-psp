var tp = instance_nearest(x, y, oP);
npc_death(1, force_death);
caster_play(106, global.volume, 1);
if (has_leg == 1)
{
    for (s = 0; s != 3; s += 1)
    {
        for (i = 1; i <= 3; i += 1)
        {
            with (leg[s, i])
            {
                instance_destroy();
            }
        }
    }
}
boss_death();
if (oInit.coop != 2 || global.host)
{
    if (random(100) < 85 || global.artifact_command)
    {
        with (tp)
        {
            if (global.director.boss_drop == 0)
            {
                global.director.boss_drop = 1;
                drop_item(2);
            }
            else
            {
                drop_item(1);
            }
        }
    }
    else
    {
        instance_create(tp.x, tp.y - 15, oJellyBox);
    }
}
if (oInit.achievement[14, 0] != 0)
{
    exit;
}
if (oInit.achievement[14, 1] == 0)
{
    achievement_progress(14, 5);
}
else if (oInit.achievement[14, 1] == 6)
{
    achievement_progress(14, (oInit.achievement[14, 1] * 5) - oInit.achievement[14, 1] - 1);
    with (instance_create(x, y, oPod))
    {
        sprite_index = sRiotPod;
        achievement_id = 14;
    }
}
else if ((oInit.achievement[14, 1] % 5) != 0)
{
    achievement_progress(14, (oInit.achievement[14, 1] * 5) - oInit.achievement[14, 1]);
}
