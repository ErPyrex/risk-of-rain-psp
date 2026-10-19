if (oInit.achievement[argument0, 8] == 99 || oInit.achievement[oInit.achievement[argument0, 8], 0] != 0)
{
    oInit.achievement[argument0, 1] += argument1;
}
if (oInit.achievement[argument0, 1] >= oInit.achievement[argument0, 2] && oInit.achievement[argument0, 0] == 0)
{
    oInit.achievement[argument0, 0] = 1;
    with (instance_create(x, y, oAchievement))
    {
        sprite_index = oInit.achievement[argument0, 3];
        text1 = oInit.achievement[argument0, 6];
    }
    steam_achievement(oInit.achievement[argument0, 9]);
}
