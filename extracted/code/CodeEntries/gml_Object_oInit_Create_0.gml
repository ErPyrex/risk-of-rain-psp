global.CollisionArray = -1;
screen_sur = -1;
display_width = display_get_width();
display_height = display_get_height();
pal_swap_init_system();
pal_swap_add_palette(634);
pal_swap_add_palette(441);
pal_swap_add_palette(471);
pal_swap_add_palette(525);
pal_swap_add_palette(544);
pal_swap_add_palette(531);
pal_swap_add_palette(551);
pal_swap_add_palette(562);
pal_swap_add_palette(590);
pal_swap_add_palette(604);
pal_swap_add_palette(609);
pal_swap_add_palette(623);
pal_swap_add_palette(667);
pal_swap_add_palette(685);
pal_swap_add_palette(698);
pal_swap_add_palette(708);
pal_swap_add_palette(652);
pal_swap_add_palette(639);
pal_swap_add_palette(520);
pal_swap_add_palette(458);
pal_swap_add_palette(509);
pal_swap_add_palette(485);
pal_swap_add_palette(1031);
has_palette = 0;
randomize();
global.ljoyInitialized = 0;
global.pause = 0;
global.music_name = -1;
global.music_id = -1;
music_fade = 1;
alarm[2] = 3;
moved_mouse = 0;
error_timer = 0;
skip = 0;
global.__timePrevious = 0;
global.deltatime = 0;
init_multiplayer_globals(0);
alarm[8] = 10;
SOUND_COUNTER = 0;
joystick_actually_on = 1;
alarm[11] = 60;
last_mouse_timer = 0;
last_mouse_x = 0;
last_mouse_y = 0;
global.artifact_number = 10;
global.artifact_elite = 0;
global.artifact_crew = 0;
global.artifact_crew_choice = 0;
global.artifact_lock = 0;
global.artifact_death = 0;
global.artifact_glass = 0;
global.artifact_use = 0;
global.artifact_loot = 0;
global.artifact_command = 1;
global.artifact_speed = 0;
global.artifact_imp = 0;
global.menu_delay = 0;
global.mouse_on = 1;
global.steam_version = 0;
global.dis_ach = 0;
global.host_ip = "";
global.first_time = 1;
global.time_stop = 0;
global.general_stats_number = 6;
global.trophy_stats_number = 12;
global.level_name = "";
global.level_subname = "";
global.debug = 0;
global.redis = 1;
version = "v1.3.0";
global.enemy_buff = 1;
global.item_number = 109;
global.mons_number = 30;
achievement_number = 55;
global.collision_x = 0;
global.collision_y = 0;
global.damage_co = 0.72;
global.hp_co = 1.13;
current_level = 0;
starting_level = 1;
last_level = 5;
last_level_online = 5;
player_class = 1;
factor = display_width / display_height;
global.width = 640;
global.height = 640 / factor;
res_array[0, 0] = 800;
res_array[0, 1] = 600;
res_array[1, 0] = 1024;
res_array[1, 1] = 768;
res_array[2, 0] = 1152;
res_array[2, 1] = 864;
res_array[3, 0] = 1280;
res_array[3, 1] = 800;
res_array[4, 0] = 1280;
res_array[4, 1] = 960;
res_array[5, 0] = 1360;
res_array[5, 1] = 768;
res_array[6, 0] = 1366;
res_array[6, 1] = 768;
res_array[7, 0] = 1440;
res_array[7, 1] = 900;
res_array[8, 0] = 1600;
res_array[8, 1] = 900;
res_array[9, 0] = 1600;
res_array[9, 1] = 1024;
res_array[10, 0] = 1680;
res_array[10, 1] = 1050;
res_array[11, 0] = 1920;
res_array[11, 1] = 1080;
res_recommended = 0;
for (i = 0; i < array_height_2d(res_array); i++)
{
    if (res_array[i, 0] <= display_get_width() && res_array[i, 1] <= display_get_height())
    {
        res_recommended = i;
    }
}
xx = 0;
yy = 0;
i = max(1, floor(display_width / global.width));
s = max(1, floor(display_height / global.height));
class_color[1] = 4096193;
class_color[2] = 12949116;
class_color[3] = 14121933;
class_color[4] = 6710991;
class_color[5] = 11579022;
class_color[6] = 10908557;
class_color[7] = 4108737;
class_color[8] = 7295054;
class_color[9] = 5108425;
class_color[10] = 16310955;
class_color[11] = make_color_rgb(219, 222, 105);
class_color[12] = make_color_rgb(189, 190, 194);
player_color[1] = 6710991;
player_color[2] = 12093564;
player_color[3] = 8114927;
player_color[4] = 8828542;
for (i = 5; i < 12; i += 1)
{
    player_color[i] = class_color[i - 4];
}
for (i = 1; i <= 4; i += 1)
{
    player[i, 0] = -1;
    player[i, 1] = -1;
    player[i, 2] = -10;
    player[i, 6] = "";
}
coop = 0;
player_number = 0;
player_max_chosen = 0;
global.disable_fs = 0;
d_ini_open("Save.ini");
record_time = d_ini_read_real("Record", "record_time", 0);
record_level = d_ini_read_real("Record", "record_level", 1);
record_item = d_ini_read_real("Record", "record_item", 0);
record_kills = d_ini_read_real("Record", "record_kills", 0);
record_kills_points = d_ini_read_real("Record", "record_kills_points", 0);
record_bosses = d_ini_read_real("Record", "record_bosses", 0);
record_bosses_points = d_ini_read_real("Record", "record_bosses_points", 0);
record_chest = d_ini_read_real("Record", "record_chest", 0);
record_gold = d_ini_read_real("Record", "record_gold", 0);
record_points = d_ini_read_real("Record", "record_points", 0);
item_number_unlocked = d_ini_read_real("Record", "item_number_unlocked", 0);
mons_number_unlocked = d_ini_read_real("Record", "mons_number_unlocked", 0);
achievement_number_unlocked = d_ini_read_real("Record", "achievement_number_unlocked", 0);
for (i = 0; i <= global.general_stats_number; i += 1)
{
    if (i == 6)
    {
        general_stats[i] = d_ini_read_real("Record", "general_stats[" + string(i) + "]", 732);
    }
    else
    {
        general_stats[i] = d_ini_read_real("Record", "general_stats[" + string(i) + "]", 0);
    }
}
arch_enemy_list = ds_map_create();
ds_map_add(arch_enemy_list, 0, 0);
var tread_string = d_ini_read_string("Record", "arch_enemy_list", ds_map_write(arch_enemy_list));
if (is_string(tread_string))
{
    ds_map_read(arch_enemy_list, tread_string);
}
use_list = ds_map_create();
ds_map_add(use_list, 0, 0);
tread_string = d_ini_read_string("Record", "use_list", string(use_list));
if (is_string(tread_string))
{
    ds_map_read(use_list, tread_string);
}
win_shrine = 0;
win_shrine_max = 0;
loss_shrine = 0;
loss_shrine_max = 0;
for (i = 0; i <= global.trophy_stats_number; i += 1)
{
    trophy_stats_new[i] = 0;
    trophy_stats[i] = d_ini_read_real("Record", "trophy_stats[" + string(i) + "]", 0);
}
trophy_unlocked = 0;
for (i = 1; i <= 12; i += 1)
{
    record_char[i] = d_ini_read_real("Record", "record_char[" + string(i) + "]", 0);
}
for (i = 0; i <= global.item_number; i += 1)
{
    item_found[i] = d_ini_read_real("Record", "item" + string(i), 0);
    item_found_temp[i] = 0;
}
for (i = 0; i <= global.artifact_number; i += 1)
{
    artifact_found[i] = d_ini_read_real("Record", "artifact" + string(i), 0);
    artifact_found_temp[i] = 0;
}
new_item_found = 0;
for (i = 0; i <= global.mons_number; i += 1)
{
    mons_found[i] = d_ini_read_real("Record", "mons" + string(i), 0);
    mons_found_temp[i] = 0;
}
new_mons_found = 0;
d_ini_close();
level[1, 0] = 2;
level[1, 1] = 3;
level[2, 0] = 2;
level[2, 1] = 2;
level[3, 0] = 2;
level[3, 1] = 2;
level[4, 0] = 2;
level[4, 1] = 2;
level[5, 0] = 1;
level[5, 1] = 2;
d_ini_open("Prefs.ini");
switch (os_type)
{
    case os_psvita:
        global.left_key_gp = d_ini_read_real("Key", "left_key_gp", 111);
        global.right_key_gp = d_ini_read_real("Key", "right_key_gp", 112);
        global.up_key_gp = d_ini_read_real("Key", "up_key_gp", 113);
        global.down_key_gp = d_ini_read_real("Key", "down_key_gp", 114);
        global.jump_key_gp = d_ini_read_real("Key", "jump_key_gp", 32769);
        global.z_key_gp = d_ini_read_real("Key", "z_key_gp", 32774);
        global.x_key_gp = d_ini_read_real("Key", "x_key_gp", 32773);
        global.c_key_gp = d_ini_read_real("Key", "c_key_gp", 32773);
        global.v_key_gp = d_ini_read_real("Key", "v_key_gp", 32774);
        global.use_key_gp = d_ini_read_real("Key", "use_key_gp", 32770);
        global.yes_key_gp = d_ini_read_real("Key", "yes_key_gp", 32771);
        global.swap_key_gp = d_ini_read_real("Key", "swap_key_gp", 32772);
        global.graphics = 1;
        global.frame_skip = 1;
        global.joystick_on = 1;
        break;
    case os_ps4:
        global.left_key_gp = d_ini_read_real("Key", "left_key_gp", 111);
        global.right_key_gp = d_ini_read_real("Key", "right_key_gp", 112);
        global.up_key_gp = d_ini_read_real("Key", "up_key_gp", 113);
        global.down_key_gp = d_ini_read_real("Key", "down_key_gp", 114);
        global.jump_key_gp = d_ini_read_real("Key", "jump_key_gp", 32769);
        global.z_key_gp = d_ini_read_real("Key", "z_key_gp", 32776);
        global.x_key_gp = d_ini_read_real("Key", "x_key_gp", 32775);
        global.c_key_gp = d_ini_read_real("Key", "c_key_gp", 32773);
        global.v_key_gp = d_ini_read_real("Key", "v_key_gp", 32774);
        global.use_key_gp = d_ini_read_real("Key", "use_key_gp", 32770);
        global.yes_key_gp = d_ini_read_real("Key", "yes_key_gp", 32771);
        global.swap_key_gp = d_ini_read_real("Key", "swap_key_gp", 32772);
        global.graphics = 3;
        global.frame_skip = 0;
        global.joystick_on = 1;
        break;
    default:
        global.left_key_gp = d_ini_read_real("Key", "left_key_gp", 111);
        global.right_key_gp = d_ini_read_real("Key", "right_key_gp", 112);
        global.up_key_gp = d_ini_read_real("Key", "up_key_gp", 113);
        global.down_key_gp = d_ini_read_real("Key", "down_key_gp", 114);
        global.jump_key_gp = d_ini_read_real("Key", "jump_key_gp", 32769);
        global.z_key_gp = d_ini_read_real("Key", "z_key_gp", 32776);
        global.x_key_gp = d_ini_read_real("Key", "x_key_gp", 32775);
        global.c_key_gp = d_ini_read_real("Key", "c_key_gp", 32773);
        global.v_key_gp = d_ini_read_real("Key", "v_key_gp", 32774);
        global.use_key_gp = d_ini_read_real("Key", "use_key_gp", 32770);
        global.yes_key_gp = d_ini_read_real("Key", "yes_key_gp", 32771);
        global.swap_key_gp = d_ini_read_real("Key", "swap_key_gp", 32772);
        global.graphics = d_ini_read_real("Video Options", "graphics", 3);
        global.frame_skip = d_ini_read_real("Video Options", "frame_skip", 0);
        global.joystick_on = d_ini_read_real("Joystick", "joystick_on", 0);
        break;
}
global.fair_loot = d_ini_read_real("Online", "fair_loot", 0);
global.hide_ip = d_ini_read_real("Online", "hide_ip", 1);
global.show_border = d_ini_read_real("Video Options", "show_border", 1);
global.server_timeout = max(10, d_ini_read_real("Online", "server_timeout", 20));
global.client_timeout = max(5, d_ini_read_real("Online", "client_timeout", 10));
global.client_throttle = max(8, d_ini_read_real("Online", "client_throttle", 40));
global.max_players_online = min(d_ini_read_real("Online", "max_players_online", 4), 10);
global.pref_name_host = d_ini_read_string("Online", "pref_name_host", "Player");
global.pref_name_client = d_ini_read_string("Online", "pref_name_client", "Player");
global.host_port = d_ini_read_real("Online", "host_port", 11100);
global.client_port = d_ini_read_real("Online", "client_port", 11100);
global.client_ip = d_ini_read_string("Online", "client_ip", "127.0.0.1");
global.left_key = d_ini_read_real("Key", "left_key", 37);
global.right_key = d_ini_read_real("Key", "right_key", 39);
global.up_key = d_ini_read_real("Key", "up_key", 38);
global.down_key = d_ini_read_real("Key", "down_key", 40);
global.jump_key = d_ini_read_real("Key", "jump_key", 32);
global.z_key = d_ini_read_real("Key", "z_key", 90);
global.x_key = d_ini_read_real("Key", "x_key", 88);
global.c_key = d_ini_read_real("Key", "c_key", 67);
global.v_key = d_ini_read_real("Key", "v_key", 86);
global.use_key = d_ini_read_real("Key", "use_key", 71);
global.yes_key = d_ini_read_real("Key", "yes_key", 65);
global.swap_key = d_ini_read_real("Key", "swap_key", 81);
global.res_index = clamp(0, d_ini_read_real("Video Options", "res_index", res_recommended), 11);
global.fullscreen = d_ini_read_real("Video Options", "fullscreen", 1);
global.vsync = d_ini_read_real("Video Options", "vsync", 0);
global.no_surface = d_ini_read_real("Video Options", "no_surface", 0);
global.no_item_message = d_ini_read_real("Video Options", "no_item_message", 0);
scale = max(1, d_ini_read_real("Video Options", "scale", 2));
global.volume = d_ini_read_real("Video Options", "volume", 0.5);
global.music_volume = d_ini_read_real("Video Options", "music_volume", 1);
global.diff_level = d_ini_read_real("Gameplay", "diff_level", 2);
class = d_ini_read_real("Gameplay", "class", 1);
if (class == 0)
{
    class = 1;
}
global.graphics_auto = 0;
global.damage_on = d_ini_read_real("Video Options", "damage_on", 1);
global.play_cutscene = d_ini_read_real("Video Options", "play_cutscene", 1);
for (i = 0; i <= global.artifact_number; i += 1)
{
    artifact_active[i] = min(d_ini_read_real("Gameplay", "artifact_active" + string(i), 0), artifact_found[i]);
}
d_ini_close();
window_set_fullscreen(global.fullscreen);
display_reset(0, global.vsync);
view_refresh();
particle_init();
init = 0;
global.fntTiny = font_add_sprite_ext(sFntTinyAlt, " !" + '"' + "#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}„…†‡ˆ‰Š‹ŒŽ‘’“”•Ö™š›œžŸ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕ×ØÙÚÛÜÝÞßàáâãä", 1, 2);
fntTinyOutline = font_add_sprite(sFntTinyOutline, 32, 1, 0);
global.fntTinyAlt = font_add_sprite_ext(sFntTinyAlt, " !" + '"' + "#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}„…†‡ˆ‰Š‹ŒŽ‘’“”•Ö™š›œžŸ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕ×ØÙÚÛÜÝÞßàáâãä", 1, 2);
global.fntTinyAltNum = font_add_sprite(sFntTinyAltNum, 32, 1, 3);
global.fntSmallAlt = font_add_sprite(sFntSmallAlt, 32, 1, 3);
global.fntSmall = font_add_sprite(sFntSmallAlt, 32, 1, 3);
global.fntMediumAlt = font_add_sprite(sFntMediumAlt, 32, 1, 3);
global.fntMedium = global.fntSmall;
global.fntDamage = font_add_sprite(sDamage, 48, 1, 1);
global.fntCrit = font_add_sprite(sDamageCrit, 48, 1, 1);
global.fntDamageLarge = font_add_sprite(sDamageLarge, 48, 1, 1);
instance_create(x, y, oMenu);
steam_init();
d_ini_open("Save.ini");
for (i = 0; i <= achievement_number; i += 1)
{
    achievement[i, 0] = d_ini_read_real("Achievement", "achievement" + string(i), 0);
    achievement[i, 1] = d_ini_read_real("Achievement", "achievement_progress" + string(i), 0);
    achievement[i, 2] = 1;
    achievement[i, 3] = 732;
    achievement[i, 4] = "This item will now drop.";
    achievement[i, 5] = 1;
    achievement[i, 6] = "Achievement description.";
    achievement[i, 7] = "";
    achievement[i, 8] = 99;
    achievement[i, 9] = "";
}
achievement[99, 0] = d_ini_read_real("Achievement", "achievement" + string(i), 0);
achievement[99, 1] = 0;
achievement[99, 2] = 1;
achievement[99, 3] = 732;
achievement[99, 4] = "This item will now drop.";
achievement[99, 5] = 1;
achievement[99, 6] = "Achievement description.";
achievement[99, 7] = "";
achievement[99, 8] = -1;
achievement[99, 9] = "";
d_ini_close();
achievement[0, 2] = 20;
achievement[0, 3] = 743;
achievement[0, 7] = "'Gasoline' Unlocked";
achievement[0, 6] = "Defeat 20 Lemurians in one playthrough.";
achievement[0, 9] = "LEMURIANS_20";
achievement[1, 3] = 821;
achievement[1, 7] = "'Unstable Watch' Unlocked";
achievement[1, 6] = "Complete the 1st stage in under 5 minutes.";
achievement[2, 2] = 1;
achievement[2, 3] = 735;
achievement[2, 7] = "'Soldier's Syringe' Unlocked";
achievement[2, 6] = "Commando: Dodge 7 lethal attacks.";
achievement[3, 3] = 812;
achievement[3, 7] = "'Lost Doll' Unlocked";
achievement[3, 6] = "Survive a boss with less than 20% health.";
achievement[4, 3] = 823;
achievement[4, 7] = "'The Backup' Unlocked";
achievement[4, 6] = "Have 4 drone helpers at once.";
achievement[5, 2] = 3;
achievement[5, 7] = "'Pauls Goat Hoof' Unlocked";
achievement[5, 3] = 737;
achievement[5, 6] = "Fail a shrine 3 times in a row.";
achievement[5, 9] = "FAIL_3_SHRINES";
achievement[6, 3] = 77;
achievement[6, 4] = "This character is now playable.";
achievement[6, 7] = "'Bandit' Unlocked";
achievement[6, 6] = "Beat the 3rd stage.";
achievement[7, 3] = 756;
achievement[7, 7] = "'54 Leaf Clover' Unlocked";
achievement[7, 6] = "Kill the Scavenger.";
achievement[8, 3] = 782;
achievement[8, 7] = "'The Ol Lopper' Unlocked";
achievement[8, 6] = "Survive 40 minutes.";
achievement[8, 9] = "SURVIVE_40_MINUTES";
achievement[9, 3] = 815;
achievement[9, 7] = "'Pillaged Gold' Unlocked";
achievement[9, 6] = "Bandit: Kill a boss with 'Lights Out.'";
achievement[9, 8] = 6;
achievement[9, 9] = "LIGHTS_OUT";
achievement[10, 3] = 795;
achievement[10, 7] = "'The Hit List' Unlocked";
achievement[10, 6] = "Bandit: Reset your cooldown 15 times consecutively.";
achievement[10, 8] = 6;
achievement[11, 3] = 789;
achievement[11, 7] = "'Fireman's Boots' Unlocked";
achievement[11, 6] = "Survive in lava for 1 minute straight.";
achievement[12, 3] = 779;
achievement[12, 7] = "'Photon Jetpack' Unlocked";
achievement[12, 6] = "End a Teleporter timer with 0 enemies on the map.";
achievement[13, 3] = 774;
achievement[13, 7] = "'Hyper-Threader' Unlocked";
achievement[13, 6] = "Commando: Activate the 3rd teleporter without being hurt once.";
achievement[14, 2] = 30;
achievement[14, 3] = 199;
achievement[14, 4] = "This character is now playable.";
achievement[14, 5] = 0;
achievement[14, 7] = "Enforcer' Unlocked";
achievement[14, 6] = "Kill the Magma Worm, Wandering Vagrant, and Colossus.";
achievement[14, 9] = "KILL_MW_WV_GSG";
achievement[15, 2] = 2000;
achievement[15, 3] = 741;
achievement[15, 5] = 0;
achievement[15, 7] = "'Spikestrip' Unlocked";
achievement[15, 6] = "Enforcer: Block 2000 damage total with your shield.";
achievement[15, 8] = 14;
achievement[16, 2] = 2000;
achievement[16, 3] = 817;
achievement[16, 5] = 0;
achievement[16, 7] = "'Prescription' Unlocked";
achievement[16, 6] = "Enforcer: Stay in Shield Mode for 5 minutes straight (in combat).";
achievement[16, 8] = 14;
achievement[17, 3] = 96;
achievement[17, 4] = "This character is now playable.";
achievement[17, 7] = "'HAN-D' Unlocked";
achievement[17, 6] = "Find the robot janitor.";
achievement[17, 9] = "ROBOT_JANITOR";
achievement[18, 3] = 753;
achievement[18, 7] = "'Arms Race' Unlocked";
achievement[18, 6] = "HAN-D: Kill 10 enemies simultaneously with FORCED_REASSEMBLY.";
achievement[18, 8] = 17;
achievement[19, 3] = 818;
achievement[19, 7] = "'Shield Generator' Unlocked";
achievement[19, 6] = "HAN-D: Stay above 70% health for 25 minutes.";
achievement[19, 8] = 17;
achievement[20, 2] = 15;
achievement[20, 5] = 0;
achievement[20, 3] = 138;
achievement[20, 4] = "This character is now playable.";
achievement[20, 7] = "'Huntress' Unlocked";
achievement[20, 6] = "Collect 15 Monster Logs.";
achievement[20, 9] = "MONSTER_LOGS_15";
achievement[21, 3] = 721;
achievement[21, 7] = "'Hermit's Scarf' Unlocked";
achievement[21, 6] = "Huntress: Achieve 200% attack speed.";
achievement[21, 8] = 20;
achievement[22, 3] = 748;
achievement[22, 7] = "'Predatory Instincts' Unlocked";
achievement[22, 6] = "Huntress: Defeat the Legendary Wisp without taking damage.";
achievement[22, 8] = 20;
achievement[23, 2] = 40;
achievement[23, 5] = 0;
achievement[23, 3] = 180;
achievement[23, 4] = "This character is now playable.";
achievement[23, 7] = "'Engineer' Unlocked";
achievement[23, 6] = "Purchase 40 drones total.";
achievement[24, 3] = 719;
achievement[24, 7] = "'Sticky Bomb' Unlocked";
achievement[24, 6] = "Engineer: Detonate 15 Bounding Mines within 5 seconds.";
achievement[24, 8] = 23;
achievement[25, 3] = 759;
achievement[25, 7] = "'Concussion Grenade' Unlocked";
achievement[25, 6] = "Engineer: Kill a boss in 15 seconds or less.";
achievement[25, 8] = 23;
achievement[26, 3] = 62;
achievement[26, 4] = "This character is now playable.";
achievement[26, 7] = "'Miner' Unlocked";
achievement[26, 6] = "Clear a path for the survivor.";
achievement[27, 3] = 763;
achievement[27, 7] = "'Panic Mine' Unlocked";
achievement[27, 6] = "Miner: Survive the teleporter event without falling below 50% health.";
achievement[27, 8] = 26;
achievement[28, 3] = 775;
achievement[28, 7] = "'Shattering Justice' Unlocked";
achievement[28, 6] = "Miner: Reach level 10 without getting hurt more then once.";
achievement[28, 8] = 26;
achievement[29, 3] = 220;
achievement[29, 4] = "This character is now playable.";
achievement[29, 7] = "'Sniper' Unlocked";
achievement[29, 6] = "Beat the game.";
achievement[30, 3] = 807;
achievement[30, 7] = "'Crudely Drawn Buddy' Unlocked";
achievement[30, 6] = "Sniper: Achieve 20 consecutive perfect reloads.";
achievement[30, 8] = 29;
achievement[31, 3] = 781;
achievement[31, 7] = "'Telescopic Sight' Unlocked";
achievement[31, 6] = "Sniper: 1-shot kill 10 enemies consecutively.";
achievement[31, 8] = 29;
achievement[32, 3] = 118;
achievement[32, 4] = "This character is now playable.";
achievement[32, 7] = "'Acrid' Unlocked";
achievement[32, 6] = "Free the chained creature.";
achievement[33, 2] = 1000;
achievement[33, 3] = 758;
achievement[33, 5] = 0;
achievement[33, 7] = "'Toxic Worm' Unlocked";
achievement[33, 6] = "Acrid: Spread 10,000 feet of caustic sludge.";
achievement[33, 8] = 32;
achievement[34, 3] = 816;
achievement[34, 7] = "'Massive Leech' Unlocked";
achievement[34, 6] = "Acrid: Spread Epidemic to 25 enemies.";
achievement[34, 8] = 32;
achievement[35, 2] = 50;
achievement[35, 3] = 776;
achievement[35, 5] = 0;
achievement[35, 7] = "'Dio's Friend' Unlocked";
achievement[35, 6] = "Die 50 times.";
achievement[35, 9] = "DIE_100_TIMES";
achievement[36, 3] = 755;
achievement[36, 7] = "'Dead Man's Foot' Unlocked";
achievement[36, 6] = "Find the bloated survivor.";
achievement[36, 9] = "BlOATED_SURVIVOR";
achievement[37, 3] = 787;
achievement[37, 7] = "'Alien Head' Unlocked";
achievement[37, 6] = "Obtain 7 Monster Teeth and 1 Guardian Heart.";
achievement[38, 3] = 728;
achievement[38, 7] = "'Bitter Root' Unlocked";
achievement[38, 6] = "Reach 650 health.";
achievement[39, 3] = 825;
achievement[39, 7] = "'Captain's Brooch' Unlocked";
achievement[39, 6] = "Unlock a golden chest with the Explorer's Key.";
achievement[39, 9] = "GOLDEN_CHEST_KEY";
achievement[40, 3] = 804;
achievement[40, 7] = "'Glowing Meteorite' Unlocked";
achievement[40, 6] = "Deal 5000 damage in one shot.";
achievement[40, 9] = "ONE_SHOT_5000";
achievement[41, 2] = 20;
achievement[41, 3] = 747;
achievement[41, 5] = 0;
achievement[41, 7] = "'Filial Imprint' Unlocked";
achievement[41, 6] = "Drown 20 Whorls.";
achievement[41, 9] = "KILL_ALL_FISHIES";
achievement[42, 3] = 762;
achievement[42, 7] = "'Golden Gun' Unlocked";
achievement[42, 6] = "Bank 20,000 gold.";
achievement[42, 9] = "GOLD_20000";
achievement[43, 3] = 790;
achievement[43, 7] = "'Wicked Ring' Unlocked";
achievement[43, 6] = "Collect 4 Keycards.";
achievement[43, 9] = "OPEN_4_DOORS";
achievement[44, 3] = 771;
achievement[44, 7] = "'Harvester's Scythe' Unlocked";
achievement[44, 6] = "Use a health shrine that drops you below 5% health.";
achievement[45, 2] = 4;
achievement[45, 3] = 723;
achievement[45, 7] = "'Snake Eyes' Unlocked";
achievement[45, 6] = "Pass a shrine 4 times in a row.";
achievement[45, 9] = "PASS_4_SHRINES";
achievement[46, 3] = 799;
achievement[46, 7] = "'Ancient Scepter' Unlocked";
achievement[46, 6] = "Mercenary: Beat the game on Monsoon difficulty.";
achievement[46, 8] = 47;
achievement[47, 2] = 5;
achievement[47, 3] = 249;
achievement[47, 4] = "This character is now playable.";
achievement[47, 5] = 0;
achievement[47, 7] = "'Mercenary' Unlocked";
achievement[47, 6] = "Beat the game 5 times.";
achievement[48, 2] = 50;
achievement[48, 5] = 0;
achievement[48, 3] = 749;
achievement[48, 7] = "'Chargefield Generator' Unlocked";
achievement[48, 6] = "Mercenary: Eviscerate 50 enemies.";
achievement[48, 8] = 47;
achievement[49, 3] = 274;
achievement[49, 4] = "This character is now playable.";
achievement[49, 7] = "'CHEF' Unlocked";
achievement[49, 6] = "Obtain Meat Nugget, Bustling Fungus, Sprouting Egg, Bitter Root, and Foreign Fruit in one run.";
achievement[50, 2] = 20;
achievement[50, 3] = 773;
achievement[50, 5] = 0;
achievement[50, 7] = "'Interstellar Desk Plant' Unlocked";
achievement[50, 6] = "CHEF: SEAR/FLAMBE 20 Sand Crabs.";
achievement[50, 8] = 49;
achievement[51, 3] = 772;
achievement[51, 7] = "'Gauss Laser' Unlocked";
achievement[51, 6] = "CHEF: Have 20 cleavers out at once.";
achievement[51, 8] = 49;
achievement[52, 3] = 255;
achievement[52, 4] = "This character is now playable.";
achievement[52, 7] = "'Loader' Unlocked";
achievement[52, 6] = "Obtain 30 items in one playthrough.";
achievement[53, 2] = 2000;
achievement[53, 3] = 717;
achievement[53, 5] = 0;
achievement[53, 7] = "'Taser' Unlocked";
achievement[53, 6] = "Loader: Travel for 20,000 feet using the Hydraulic Gauntlet.";
achievement[53, 8] = 52;
achievement[54, 3] = 802;
achievement[54, 7] = "'Gigantic Amethyst' Unlocked";
achievement[54, 6] = "Loader: Kill the Overloading Magma Worm";
achievement[54, 8] = 52;
if (global.steam_version == 1 && steam_init() == 1)
{
    for (i = 0; i <= achievement_number; i += 1)
    {
        if (achievement[i, 9] != "")
        {
            if (achievement[i, 0] > 0 && !steam_get_achievement(achievement[i, 9]))
            {
                steam_set_achievement(achievement[i, 9]);
            }
        }
    }
}
unlock_all();
alarm[1] = 10;
