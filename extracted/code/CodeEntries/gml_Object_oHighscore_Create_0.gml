page = 0;
black_screen = 1;
choice = 0;
record_time_points = oInit.record_time * 3;
record_level_points = (oInit.record_level * 230) - 230;
record_item_points = oInit.record_item * 110;
record_kills_points = round(oInit.record_kills_points);
record_bosses_points = round(oInit.record_bosses_points);
record_gold_points = oInit.record_gold * 2;
record_chest_points = oInit.record_chest * 35;
piechart_total = 0;
for (i = 1; i <= 12; i += 1)
{
    piechart[i, 0] = oInit.record_char[i];
    piechart[i, 1] = oInit.class_color[i];
    piechart_total += piechart[i, 0];
}
piechart[1, 3] = "Commando";
piechart[2, 3] = "Enforcer";
piechart[3, 3] = "Bandit";
piechart[4, 3] = "Huntress";
piechart[5, 3] = "HAN-D";
piechart[6, 3] = "Engineer";
piechart[7, 3] = "Miner";
piechart[8, 3] = "Sniper";
piechart[9, 3] = "Acrid";
piechart[10, 3] = "Mercenary";
piechart[11, 3] = "Loader";
piechart[12, 3] = "CHEF";
progress = oInit.item_number_unlocked + (oInit.mons_number_unlocked * 7) + (oInit.achievement_number_unlocked * 8);
total_progress = global.item_number + 1 + ((global.mons_number + 1) * 7) + (oInit.achievement_number * 8);
if (piechart_total > 0)
{
    for (i = 1; i <= 12; i += 1)
    {
        piechart[i, 2] = piechart[i, 0] / piechart_total;
    }
}
legend_square = background_create_color(8, 8, c_white);
var tvalue = -1;
var tobj_index = 220;
var tkey = ds_map_find_first(oInit.arch_enemy_list);
for (i = 0; i <= global.general_stats_number; i += 1)
{
    switch (i)
    {
        case 0:
            general_stats[i, 1] = string(floor(oInit.general_stats[i] / 60)) + ":" + string(oInit.general_stats[i] % 60);
            break;
        case 4:
            general_stats[i, 1] = "$" + string(oInit.general_stats[i]);
            break;
        case 5:
            if ((oInit.general_stats[i] * 0.5454545454545454 * 0.3048 * 0.2) < 1000)
            {
                general_stats[i, 1] = string(round(oInit.general_stats[i] * 0.5454545454545454 * 0.3048 * 0.2)) + " meter(s)";
            }
            else if ((oInit.general_stats[i] * 0.5454545454545454 * 0.3048 * 0.2) < 42194.988000000005)
            {
                general_stats[i, 1] = string(round(oInit.general_stats[i] * 0.5454545454545454 * 0.3048 * 0.2 * 0.001 * 10) / 10) + " kilometer(s)";
            }
            else
            {
                general_stats[i, 1] = string(round(((oInit.general_stats[i] * 0.5454545454545454 * 0.3048 * 0.2 * 0.001) / 42.194988) * 10) / 10) + " marathon(s)";
            }
            break;
        case 6:
            for (ii = 0; ii < ds_map_size(oInit.arch_enemy_list); ii += 1)
            {
                var tt = ds_map_find_value(oInit.arch_enemy_list, tkey);
                if (tt > tvalue)
                {
                    tvalue = tt;
                    tobj_index = tkey;
                }
                tkey = ds_map_find_next(oInit.arch_enemy_list, tkey);
            }
            general_stats[i, 1] = tobj_index;
            break;
        default:
            general_stats[i, 1] = string(oInit.general_stats[i]);
            break;
    }
}
tvalue = -1;
tkey = ds_map_find_first(oInit.use_list);
for (i = 0; i <= global.trophy_stats_number; i += 1)
{
    switch (i)
    {
        case 1:
            trophy_stats[i, 1] = string(floor(oInit.trophy_stats[i] / 60)) + ":" + string(oInit.trophy_stats[i] % 60);
            break;
        case 3:
            if (oInit.trophy_stats[i] == 0)
            {
                trophy_stats[i, 1] = "-:-";
            }
            else
            {
                trophy_stats[i, 1] = string(floor(oInit.trophy_stats[i] / 60)) + ":" + string(oInit.trophy_stats[i] % 60);
            }
            break;
        case 4:
            trophy_stats[i, 1] = string(floor(oInit.trophy_stats[i])) + " damage";
            break;
        case 11:
            for (ii = 0; ii < ds_map_size(oInit.use_list); ii += 1)
            {
                var tt = real(ds_map_find_value(oInit.use_list, tkey));
                if (tt > tvalue)
                {
                    tvalue = tt;
                    tobj_index = tkey;
                }
                tkey = ds_map_find_next(oInit.use_list, tkey);
            }
            trophy_stats[i, 1] = tobj_index;
            break;
        case 12:
            trophy_stats[i, 1] = string(floor(oInit.trophy_stats[i] / 60)) + ":" + string(oInit.trophy_stats[i] % 60);
            break;
        default:
            trophy_stats[i, 1] = string(oInit.trophy_stats[i]);
            break;
    }
}
general_stats[0, 0] = "Total Time Played:";
general_stats[1, 0] = "Total Deaths:";
general_stats[2, 0] = "Total Monster Kills:";
general_stats[3, 0] = "Total Boss Kills:";
general_stats[4, 0] = "Total Gold Collected:";
general_stats[5, 0] = "Total Distance Ran:";
general_stats[6, 0] = "Nemesis:";
trophy_stats[0, 0] = "Highest Level:";
trophy_stats[1, 0] = "Longest Game Played:";
trophy_stats[2, 0] = "Most Stages Beaten in a Row:";
trophy_stats[3, 0] = "Fastest Boss Kill:";
trophy_stats[4, 0] = "Highest Damage Dealt:";
trophy_stats[5, 0] = "Longest Win Streak on Shrines:";
trophy_stats[6, 0] = "Longest Loss Streak on Shrines:";
trophy_stats[7, 0] = "Largest Multi-kill:";
trophy_stats[8, 0] = "Most Items Collected:";
trophy_stats[9, 0] = "Highest Item Stack:";
trophy_stats[10, 0] = "Highest Drone Count:";
trophy_stats[11, 0] = "Favorite Use Item:";
trophy_stats[12, 0] = "Time Spent Untouched:";
trophy_stats[13, 0] = "Close Calls:";
ds_ach = ds_list_create();
ds_challenge = ds_list_create();
ds_list_add(ds_challenge, "Challenge:");
ds_list_add(ds_challenge, 0);
ds_list_add(ds_challenge, 1);
ds_list_add(ds_challenge, 3);
ds_list_add(ds_challenge, 4);
ds_list_add(ds_challenge, 5);
ds_list_add(ds_challenge, 7);
ds_list_add(ds_challenge, 8);
ds_list_add(ds_challenge, 11);
ds_list_add(ds_challenge, 12);
ds_list_add(ds_challenge, 35);
ds_list_add(ds_challenge, 36);
ds_list_add(ds_challenge, 37);
ds_list_add(ds_challenge, 38);
ds_list_add(ds_challenge, 39);
ds_list_add(ds_challenge, 40);
ds_list_add(ds_challenge, 41);
ds_list_add(ds_challenge, 42);
ds_list_add(ds_challenge, 43);
ds_list_add(ds_challenge, 44);
ds_list_add(ds_challenge, 45);
ds_list_add(ds_ach, ds_challenge);
ds_class1 = ds_list_create();
ds_list_add(ds_class1, "Characters (1/2):");
ds_list_add(ds_class1, 2);
ds_list_add(ds_class1, 13);
ds_list_add(ds_class1, 14);
ds_list_add(ds_class1, 15);
ds_list_add(ds_class1, 16);
ds_list_add(ds_class1, 6);
ds_list_add(ds_class1, 9);
ds_list_add(ds_class1, 10);
ds_list_add(ds_class1, 20);
ds_list_add(ds_class1, 21);
ds_list_add(ds_class1, 22);
ds_list_add(ds_class1, 17);
ds_list_add(ds_class1, 18);
ds_list_add(ds_class1, 19);
ds_list_add(ds_class1, 23);
ds_list_add(ds_class1, 24);
ds_list_add(ds_class1, 25);
ds_list_add(ds_ach, ds_class1);
ds_class2 = ds_list_create();
ds_list_add(ds_class2, "Characters (2/2):");
ds_list_add(ds_class2, 26);
ds_list_add(ds_class2, 27);
ds_list_add(ds_class2, 28);
ds_list_add(ds_class2, 29);
ds_list_add(ds_class2, 30);
ds_list_add(ds_class2, 31);
ds_list_add(ds_class2, 32);
ds_list_add(ds_class2, 33);
ds_list_add(ds_class2, 34);
ds_list_add(ds_class2, 47);
ds_list_add(ds_class2, 48);
ds_list_add(ds_class2, 46);
ds_list_add(ds_class2, 52);
ds_list_add(ds_class2, 53);
ds_list_add(ds_class2, 54);
ds_list_add(ds_class2, 49);
ds_list_add(ds_class2, 50);
ds_list_add(ds_class2, 51);
ds_list_add(ds_ach, ds_class2);
ds_page = 0;
ds_page_max = 2;
