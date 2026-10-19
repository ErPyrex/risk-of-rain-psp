boss_death_index = oInit.image_index - boss_death_index;
if (oInit.trophy_stats[3] > round(boss_death_index / 60) || oInit.trophy_stats[3] == 0)
{
    oInit.trophy_stats_new[3] = 1;
    oInit.trophy_unlocked += 1;
    oInit.trophy_stats[3] = round(boss_death_index / 60);
}
with (oP)
{
    if (dead == 0)
    {
        boss_count += 1;
        boss_points += (1 * global.enemy_buff * (other.elite + 1));
    }
    if (oInit.coop != 2 || global.my_player == id)
    {
        if (hp <= (maxhp * 0.2) && dead == 0)
        {
            achievement_progress(3, 1);
        }
        if (class == 6 && round(other.boss_death_index / 60) <= 15 && (oInit.coop != 2 || global.my_player == id))
        {
            achievement_progress(25, 1);
        }
    }
}
