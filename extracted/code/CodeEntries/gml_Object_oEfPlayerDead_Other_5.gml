if (global.diff_level >= 2 && post_game == 1)
{
    d_ini_open("Save.ini");
    for (i = 0; i <= oInit.achievement_number; i += 1)
    {
        if (oInit.achievement[i, 0] == 1)
        {
            oInit.achievement[i, 0] = 2;
            d_ini_write_real("Achievement", "achievement" + string(i), 2);
            oInit.achievement_number_unlocked += 1;
            d_ini_write_real("Record", "achievement_number_unlocked", oInit.achievement_number_unlocked);
        }
        if (oInit.achievement[i, 5] == 1)
        {
            oInit.achievement[i, 1] = 0;
        }
        else
        {
            d_ini_write_real("Achievement", "achievement_progress" + string(i), oInit.achievement[i, 1]);
        }
    }
    for (i = 0; i <= global.artifact_number; i += 1)
    {
        if (oInit.artifact_found_temp[i] != 0)
        {
            if (oInit.artifact_found[i] == 0)
            {
                oInit.artifact_found[i] = 1;
                d_ini_write_real("Record", "artifact" + string(i), 1);
            }
            else
            {
                oInit.artifact_found_temp[i] = 0;
            }
        }
    }
    if (oInit.record_level < death_level)
    {
        d_ini_write_real("Record", "record_level", death_level);
        oInit.record_level = death_level;
        oInit.trophy_stats_new[0] = 1;
        oInit.trophy_unlocked += 1;
    }
    if (oInit.record_time < ((death_minute * 60) + death_second))
    {
        d_ini_write_real("Record", "record_time", (death_minute * 60) + death_second);
        oInit.record_time = (death_minute * 60) + death_second;
        oInit.trophy_stats_new[1] = 1;
        oInit.trophy_unlocked += 1;
    }
    if (oInit.record_kills < death_kills)
    {
        d_ini_write_real("Record", "record_kills", death_kills);
        oInit.record_kills = death_kills;
    }
    if (oInit.record_bosses < death_bosses)
    {
        d_ini_write_real("Record", "record_bosses", death_bosses);
        oInit.record_bosses = death_bosses;
    }
    if (oInit.record_item < death_item)
    {
        oInit.trophy_unlocked += 1;
        oInit.trophy_stats[8] = death_item;
        oInit.trophy_stats_new[8] += 1;
        d_ini_write_real("Record", "record_item", death_item);
        oInit.record_item = death_item;
    }
    if (oInit.record_gold < death_gold)
    {
        d_ini_write_real("Record", "record_gold", death_gold);
        oInit.record_gold = death_gold;
    }
    if (oInit.record_chest < death_chest)
    {
        d_ini_write_real("Record", "record_chest", death_chest);
        oInit.record_chest = death_chest;
    }
    if (oInit.record_points < (death_level_points + death_time_points + death_kills_points + death_bosses_points + death_item_points + death_gold_points + death_chest_points))
    {
        d_ini_write_real("Record", "record_points", death_level_points + death_time_points + death_kills_points + death_bosses_points + death_item_points + death_gold_points + death_chest_points);
    }
    oInit.record_points = death_level_points + death_time_points + death_kills_points + death_bosses_points + death_item_points + death_gold_points + death_chest_points;
    if (oInit.record_kills_points < death_kills_points)
    {
        d_ini_write_real("Record", "record_kills_points", death_kills_points);
        oInit.record_kills_points = death_kills_points;
    }
    if (oInit.record_bosses_points < death_bosses_points)
    {
        d_ini_write_real("Record", "record_bosses_points", death_bosses_points);
        oInit.record_bosses_points = death_bosses_points;
    }
    d_ini_write_real("Record", "record_char[" + string(class) + "]", oInit.record_char[class]);
    for (i = 0; i <= global.item_number; i += 1)
    {
        if (oInit.item_found_temp[i] != 0)
        {
            if (oInit.item_found[i] == 0)
            {
                oInit.new_item_found += 1;
                oInit.item_number_unlocked += 1;
                oInit.item_found[i] = 1;
                d_ini_write_real("Record", "item" + string(i), 1);
                d_ini_write_real("Record", "item_number_unlocked", oInit.item_number_unlocked);
            }
            else
            {
                oInit.item_found_temp[i] = 0;
            }
        }
    }
    for (i = 0; i <= global.mons_number; i += 1)
    {
        if (oInit.mons_found_temp[i] != 0)
        {
            if (oInit.mons_found[i] == 0)
            {
                oInit.new_mons_found += 1;
                oInit.mons_number_unlocked += 1;
                oInit.mons_found[i] = 1;
                d_ini_write_real("Record", "mons" + string(i), 1);
                d_ini_write_real("Record", "mons_number_unlocked", oInit.mons_number_unlocked);
            }
            else
            {
                oInit.mons_found_temp[i] = 0;
            }
        }
    }
    oInit.general_stats[0] += (death_minute * 60) + death_second;
    oInit.general_stats[1] += 1;
    oInit.general_stats[2] += death_kills;
    oInit.general_stats[3] += death_bosses;
    oInit.general_stats[4] += death_gold;
    oInit.general_stats[5] += distance_ran;
    if (ds_map_exists(oInit.arch_enemy_list, death_last_hit) == 1)
    {
        ds_map_replace(oInit.arch_enemy_list, death_last_hit, ds_map_find_value(oInit.arch_enemy_list, death_last_hit) + 1);
    }
    else
    {
        ds_map_add(oInit.arch_enemy_list, death_last_hit, 1);
    }
    d_ini_write_string("Record", "arch_enemy_list", ds_map_write(oInit.arch_enemy_list));
    d_ini_write_string("Record", "use_list", ds_map_write(oInit.use_list));
    oInit.trophy_stats[0] = oInit.record_level;
    oInit.trophy_stats[1] = oInit.record_time;
    if (stages_passed > oInit.trophy_stats[2])
    {
        oInit.trophy_stats_new[2] = 1;
        oInit.trophy_unlocked += 1;
        oInit.trophy_stats[2] = stages_passed;
    }
    if (oInit.win_shrine_max > oInit.trophy_stats[5])
    {
        oInit.trophy_stats_new[5] = 1;
        oInit.trophy_unlocked += 1;
        oInit.trophy_stats[5] = oInit.win_shrine_max;
    }
    if (oInit.loss_shrine_max > oInit.trophy_stats[6])
    {
        oInit.trophy_stats_new[6] = 1;
        oInit.trophy_unlocked += 1;
        oInit.trophy_stats[6] = oInit.loss_shrine_max;
    }
    if (highest_item_stack > oInit.trophy_stats[9])
    {
        oInit.trophy_stats_new[9] = 1;
        oInit.trophy_unlocked += 1;
        oInit.trophy_stats[9] = highest_item_stack;
    }
    if (drone_count > oInit.trophy_stats[10])
    {
        oInit.trophy_stats_new[10] = 1;
        oInit.trophy_unlocked += 1;
        oInit.trophy_stats[10] = drone_count;
    }
    for (i = 0; i <= global.general_stats_number; i += 1)
    {
        if (i != 6)
        {
            d_ini_write_real("Record", "general_stats[" + string(i) + "]", oInit.general_stats[i]);
        }
    }
    for (i = 0; i <= global.trophy_stats_number; i += 1)
    {
        d_ini_write_real("Record", "trophy_stats[" + string(i) + "]", oInit.trophy_stats[i]);
    }
    d_ini_close();
}
