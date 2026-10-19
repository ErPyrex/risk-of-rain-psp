boss_death();
with (oP)
{
    if (other.elite != 0 && class == 11)
    {
        achievement_progress(54, 1);
    }
}
if (oInit.achievement[14, 0] != 0)
{
    exit;
}
if (oInit.achievement[14, 1] == 0)
{
    achievement_progress(14, 3);
}
else if (oInit.achievement[14, 1] == 10)
{
    achievement_progress(14, (oInit.achievement[14, 1] * 3) - oInit.achievement[14, 1] - 1);
    with (instance_create(x, y, oPod))
    {
        sprite_index = sRiotPod;
        achievement_id = 14;
    }
}
else if ((oInit.achievement[14, 1] % 3) != 0)
{
    achievement_progress(14, (oInit.achievement[14, 1] * 3) - oInit.achievement[14, 1]);
}
