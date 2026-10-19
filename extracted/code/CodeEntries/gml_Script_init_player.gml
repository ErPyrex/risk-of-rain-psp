if (global.artifact_lock)
{
    if (class != 8)
    {
        artifact_lock_choice = irandom(3);
    }
    else
    {
        artifact_lock_choice = irandom(2) + 1;
    }
}
else
{
    artifact_lock_choice = 0;
}
swap_item = 0;
following_player_index = -10;
following_player = -10;
force_swap = 0;
use_item_held = 0;
last_hit_time = oInit.image_index;
distance_ran = 0;
outside_screen = 0;
ropeUp = 0;
ropeDown = 0;
item_count = -1;
for (i = 0; i <= 120; i += 1)
{
    item[i, 0] = -1;
    item[i, 1] = -1;
    item[i, 2] = -1;
}
item_value = 0;
dead_body = -1;
dead = 0;
if (!global.artifact_use)
{
    use[0] = -1;
    use[1] = -1;
    use[2] = -1;
}
else
{
    use[0] = 442;
    use[1] = 835;
    use[2] = "Random effect.";
}
if (global.artifact_lock)
{
    cdr = 0.25;
}
oHUD.gold = 15 + ((global.diff_level == 1) * 20);
rope_parent = -5;
gold_cooldown = 0;
total_gold = 0;
opened_chests = 0;
kill_count = 0;
kill_points = 0;
boss_count = 0;
boss_points = 0;
last_hit = -1;
last_hit_name = -1;
last_hit_number = 0;
use_cooldown = 45;
expyy = 0;
maxexp = 20;
level = 1;
firework = 0;
tree_on_kill = 0;
gauss = 0;
gauss_charge = 0;
icy = 0;
for (i = 0; i < 4; i += 1)
{
    skill[i, 0] = "";
    skill[i, 1] = "None";
    skill[i, 2] = 1;
    skill[i, 3] = 291;
    skill[i, 4] = 0;
    skill[i, 5] = 1;
}
