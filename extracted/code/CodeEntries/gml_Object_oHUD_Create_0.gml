switch (os_type)
{
    default:
        tutorial_sprite = 412;
        tutorial_sprite_use = 415;
        break;
}
info_index = -1;
alarm[3] = 3;
string_debug = "";
for (i = 0; i < 15; i += 1)
{
    hpRecedeTimer[i] = 0;
    hpLast[i] = 0;
    if (!global.artifact_glass)
    {
        health_color[i] = 6804360;
    }
    else
    {
        health_color[i] = 13202607;
    }
}
shake = 0;
alarm[1] = 600;
title_alpha = 5;
hp_bar_count = 0;
hit_sound_count = 0;
boss = -1;
boss_hp = -1;
boss_maxhp = -1;
boss_text1 = -1;
boss_text2 = -1;
boss_id = -1;
map = 0;
second = 0;
minute = 0;
hour = 0;
ssecond = "";
sminute = "";
shour = "";
tutorial_use = 0;
difficulty = "Very Easy";
white_glow = 0;
objective_text = "Find the teleporter.";
graphics_cd = 0;
fps_stacks = 0;
tx = 0;
ty = 0;
tx_last = 0;
ty_last = 0;
t_count = 0;
t_count_last = 0;
transitioning = 0;
coop_scale = 1;
max_x = 0;
min_x = 0;
gold = 0;
total_gold = 0;
d1 = merge_color(c_ltgray, c_white, white_glow);
d2 = merge_color(c_dkgray, c_white, white_glow);
bg_backdrop_hp = background_create_color(164, 11, c_dkgray);
bg_backdrop_exp = background_create_color(164, 6, c_dkgray);
bg_empty_hp = background_create_color(160, 7, c_black);
bg_empty_exp = background_create_color(160, 2, c_black);
bg_lasthp = background_create_color(1, 7, c_red);
bg_hp = background_create_color(1, 7, c_white);
bg_exp = background_create_color(1, 2, #A8DFDA);
boss_hp_color = 4802996;
