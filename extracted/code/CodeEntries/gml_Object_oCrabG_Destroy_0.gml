y += 50;
boss_death();
if (oInit.coop == 2 && !global.host)
{
    exit;
}
if (random(100) < 85)
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
else
{
    instance_create(x, y, oKnurl);
}
if (oInit.achievement[14, 1] == 0)
{
    achievement_progress(14, 2);
}
else if (oInit.achievement[14, 1] == 15)
{
    achievement_progress(14, (oInit.achievement[14, 1] * 2) - oInit.achievement[14, 1] - 1);
    with (instance_create(x, y, oPod))
    {
        sprite_index = sRiotPod;
        achievement_id = 14;
    }
}
else if ((oInit.achievement[14, 1] % 2) != 0)
{
    achievement_progress(14, (oInit.achievement[14, 1] * 2) - oInit.achievement[14, 1]);
}
