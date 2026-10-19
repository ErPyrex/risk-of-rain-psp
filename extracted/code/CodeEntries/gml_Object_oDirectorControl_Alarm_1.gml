if (oInit.coop == 2 && global.host == 0)
{
    exit;
}
target_poi = find_target();
alarm[1] = ceil((60 * random_range(3, 9)) / bonus_rate);
if (global.artifact_crew)
{
    card_choice = global.artifact_crew_choice;
}
if (spawn_boss == 1 && oHUD.boss == -1 && points >= 700 && !global.artifact_crew)
{
    card_choice = irandom_range(monster_number - (boss_number - 1), monster_number);
}
if (card[spawn[card_choice, 0], 2] < (points / 50) && room != r6_1_1 && !global.artifact_crew)
{
    card_choice = irandom(monster_number);
    count = 0;
    alarm[1] = 15;
}
else if ((points - (card[spawn[card_choice, 0], 2] * (1 + (count * 0.2)) * 1)) > 0 && count < 4 && global.time_stop == 0 && instance_exists(oB) == 1 && instance_exists(target_poi))
{
    instance_activate_region(target_poi.x - 900, target_poi.y - 900, 1800, 1800, true);
    switch (card[spawn[card_choice, 0], 1])
    {
        case 0:
            points -= (card[spawn[card_choice, 0], 2] * (1 + (count * 0.2)) * (1 + global.artifact_elite));
            count += 1;
            xx = target_poi.x + ((((random_range(-15, 30) * random_range(-15, 30)) + 300) * choose(1, -1)) / (bonus_rate * 1));
            yy = target_poi.y + ((((random_range(-15, 30) * random_range(-15, 30)) + 200) * choose(1, -1)) / (bonus_rate * 10));
            i = instance_nearest(xx, yy, oB);
            s = instance_create(i.x + 16 + random((16 * (i.image_xscale - 1)) - 16), i.y, oSpawn);
            s.sprite_index = card[spawn[card_choice, 0], 3];
            s.child = card[spawn[card_choice, 0], 4];
            s.sound_spawn = card[spawn[card_choice, 0], 5];
            s.y = (s.y + s.sprite_yoffset) - s.sprite_height;
            s.elite = 0;
            s.elite_tier = -1;
            s.sprite_palette = card[spawn[card_choice, 0], 6];
            s.point_value = card[spawn[card_choice, 0], 2];
            if (max(card[spawn[card_choice, 0], 2] * 25, 500) <= points && oHUD.minute >= 4 && global.diff_level == 3 && !global.artifact_elite)
            {
                s.elite = 1;
                var ds = ds_list_create();
                ds_list_add(ds, 3);
                ds_list_add(ds, 5);
                ds_list_add(ds, 9);
                ds_list_add(ds, 11);
                ds_list_add(ds, 13);
                ds_list_shuffle(ds);
                var ee = ds_list_find_value(ds, 0) * ds_list_find_value(ds, 1);
                ds_list_destroy(ds);
                s.elite_tier = ee;
                s.point_value += card[spawn[card_choice, 0], 2] * 25;
                points -= max(card[spawn[card_choice, 0], 2] * 25, 500);
            }
            else if ((random(100) < 80 && (card[spawn[card_choice, 0], 2] * 4) <= points && oHUD.minute >= 2) || global.artifact_elite)
            {
                s.elite = 1;
                if (global.diff_level == 3 || oInit.current_level >= 3)
                {
                    s.elite_tier = irandom_range(5, 9);
                }
                else
                {
                    s.elite_tier = irandom(4);
                }
                if (!global.artifact_elite)
                {
                    s.point_value += card[spawn[card_choice, 0], 2] * 4;
                    points -= (card[spawn[card_choice, 0], 2] * 4);
                }
                else
                {
                    s.point_value += card[spawn[card_choice, 0], 2];
                }
            }
            if (oInit.coop == 2)
            {
                server_message_send(0, 15, object_index, s.m_id, card_choice, s.x, s.y, s.elite, s.elite_tier, s.point_value, s.image_xscale);
            }
            if (points >= card[spawn[card_choice, 0], 1])
            {
                alarm[1] = random(50) + 1;
            }
            else
            {
                card_choice = irandom(monster_number);
                count = 0;
            }
            break;
        case 1:
            points -= (card[spawn[card_choice, 0], 2] * (1 + (count * 0.2)));
            count += 1;
            xx = target_poi.x + ((-100 + random(200)) / (bonus_rate * 0.75));
            yy = target_poi.y + ((-32 + random(64)) / (bonus_rate * 30));
            s = instance_create(xx, yy, card[spawn[card_choice, 0], 3]);
            s.point_value = card[spawn[card_choice, 0], 2];
            caster_play(card[spawn[card_choice, 0], 4], global.volume, 1);
            if ((card[spawn[card_choice, 0], 2] * 2) <= points || global.artifact_elite)
            {
                s.elite = 1;
                if (!global.artifact_elite)
                {
                    points -= (card[spawn[card_choice, 0], 2] * 2);
                    s.point_value += card[spawn[card_choice, 0], 2] * 2;
                }
            }
            break;
        case 2:
            points -= (card[spawn[card_choice, 0], 2] * (1 + (count * 0.2)));
            count += 1;
            s = instance_create(0, 0, card[spawn[card_choice, 0], 3]);
            s.point_value = card[spawn[card_choice, 0], 2];
            if ((card[spawn[card_choice, 0], 2] * 2) <= points || global.artifact_elite)
            {
                s.elite = 1;
                if (!global.artifact_elite)
                {
                    points -= (card[spawn[card_choice, 0], 2] * 2);
                }
            }
            break;
        case 3:
            points -= (card[spawn[card_choice, 0], 2] * (1 + (count * 0.2)));
            s = instance_create(choose(view_xview[0] - 16 - random(100), view_xview[0] + view_wview[0] + 16 + random(100)), view_yview[0] - 16 - random(32), card[spawn[card_choice, 0], 3]);
            s.point_value = card[spawn[card_choice, 0], 2];
            if (((card[spawn[card_choice, 0], 2] * 2) <= points || global.artifact_elite) && card[spawn[card_choice, 0], 3] != 245)
            {
                s.elite = 1;
                if (!global.artifact_elite)
                {
                    points -= (card[spawn[card_choice, 0], 2] * 2);
                    s.point_value += card[spawn[card_choice, 0], 2] * 2;
                }
            }
            count += 1;
            if (points >= card[spawn[card_choice, 0], 1])
            {
                alarm[1] = random(50) + 1;
            }
            else
            {
                card_choice = irandom(monster_number);
                count = 0;
            }
            break;
    }
    if (card_choice >= (monster_number - (boss_number - 1)))
    {
        spawn_boss = 0;
    }
}
else
{
    card_choice = irandom(monster_number);
    count = 0;
}
