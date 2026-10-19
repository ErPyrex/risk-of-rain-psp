for (i = 0; i < oInit.player_max_chosen; i += 1)
{
    if (hpRecedeTimer[i] == -1)
    {
        hpLast[i] = round(oInit.player[i + 1, 2].hp);
    }
}
hp_bar_count = 0;
hit_sound_count = 0;
