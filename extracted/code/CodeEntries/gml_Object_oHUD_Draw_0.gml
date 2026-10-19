draw_set_alpha(1);
var vy_16 = view_yview[0] + 16;
var vxw = view_xview[0] + view_wview[0];
var vxw5 = view_xview[0] + (view_wview[0] * 0.5);
var vyh = view_yview[0] + view_hview[0];
var vxw2 = view_xview[0] + (view_wview[0] * 0.5);
var vxw2_80 = vxw2 - 80;
vyh = view_yview[0] + view_hview[0];
var vyh_35 = vyh - 35;
if (oInit.coop != 1 && oInit.player[1, 2].following_player_index == -10)
{
    draw_sprite(sHUDOutline, 0, vxw2 - 78, vyh - 64);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_alpha(1);
    draw_background_stretched_ext(bg_hp, vxw2_80, vyh_35, 160 * max(0, hpLast[0] / oInit.player[1, 2].maxhp), 7, c_red, 1);
    draw_background_stretched_ext(bg_hp, vxw2_80, vyh_35, 160 * max(0, oInit.player[1, 2].hp / oInit.player[1, 2].maxhp), 7, health_color[0], 1);
    if (oInit.player[1, 2].maxshield != 0)
    {
        draw_background_stretched_ext(bg_hp, vxw2_80, vyh_35, 160 * max(0, oInit.player[1, 2].shield / oInit.player[1, 2].maxshield), 7, c_teal, 0.5);
    }
    draw_background_stretched(bg_exp, vxw2_80, vyh - 22, 160 * max(0, oInit.player[1, 2].expyy / oInit.player[1, 2].maxexp), 2);
    draw_set_font(global.fntTiny);
    if (oInit.player[1, 2].shield > 0)
    {
        d = 8421376;
    }
    else
    {
        d = 4210752;
    }
    if (oInit.player[1, 2].invincible <= 1)
    {
        draw_set_color(c_white);
        draw_set_font(oInit.fntTinyOutline);
        draw_text(vxw2, vyh - 31, string(ceil(oInit.player[1, 2].hp + oInit.player[1, 2].shield)) + "/" + string(oInit.player[1, 2].maxhp));
    }
    else if (oInit.player[1, 2].invincible <= 1000)
    {
        draw_background_ext(bg_hp, vxw2_80, vyh_35, 160, 1, 0, #EFD27B, 0.8);
        draw_sprite(sImmune, 0, vxw2, vyh - 32);
    }
    else
    {
        draw_background_ext(bg_hp, vxw2_80, vyh_35, 160, 1, 0, c_white, 0.8);
        draw_sprite(sImmune, 1, vxw2, vyh - 32);
    }
    draw_set_font(global.fntSmall);
    draw_set_color(c_white);
    draw_text(vxw2 - 66, vyh - 55, string(oInit.player[1, 2].level));
}
if (boss == 1)
{
    var vxv6 = view_xview[0] + 6;
    var bbhp = boss_hp / boss_maxhp;
    var vxvbb = vxv6 + ((view_wview[0] - 12) * bbhp);
    if (global.graphics >= 2)
    {
        draw_background_stretched(bg_backdrop_hp, view_xview[0] + 4, view_yview[0] + 4, view_wview[0] - 8, 12);
    }
    draw_background_stretched(bg_empty_hp, vxv6, view_yview[0] + 6, view_wview[0] - 12, 9);
    if (boss_hp_color == 10833558)
    {
        draw_background_stretched_ext(bg_hp, vxv6, view_yview[0] + 6, view_wview[0] - 12, 4, #C65A13, 1);
        draw_background_stretched_ext(bg_hp, vxv6, view_yview[0] + 6, view_wview[0] - 12, 2, c_white, 0.4);
        draw_background_stretched_ext(bg_hp, vxv6, view_yview[0] + 6 + 5, view_wview[0] - 12, 4, #C65A13, 1);
        draw_background_stretched_ext(bg_hp, vxv6, view_yview[0] + 6 + 5, view_wview[0] - 12, 2, c_white, 0.4);
    }
    draw_background_stretched_ext(bg_hp, vxv6, view_yview[0] + 6, (view_wview[0] - 12) * bbhp, 9, boss_hp_color, 1);
    draw_background_stretched_ext(bg_hp, vxv6, view_yview[0] + 7, (view_wview[0] - 12) * bbhp, 3, c_white, 0.4);
    draw_set_font(global.fntSmall);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_set_color(#FFFFB3);
    draw_text(vxw2, view_yview[0] + 19, boss_text1);
    draw_set_font(global.fntTiny);
    draw_set_color(c_ltgray);
    draw_text(vxw2, view_yview[0] + 36, boss_text2);
    draw_set_color(c_white);
    draw_text(vxw2, view_yview[0] + 6, string(ceil(max(boss_hp, 0))) + "/" + string(ceil(boss_maxhp)));
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_font(global.fntDamageLarge);
draw_sprite(sMoney, 0, view_xview[0] + 30, view_yview[0] + 16);
draw_text(view_xview[0] + 42, view_yview[0] + 16, string(floor(gold)));
draw_set_font(global.fntTinyAlt);
if (alarm[1] != -1 && instance_exists(oBase))
{
    draw_sprite(tutorial_sprite, second, oBase.x + 50, oBase.y - 100);
}
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_color(c_white);
draw_text(vxw5, vyh - 76, objective_text);
if (tutorial_use == 1 && oInit.coop == 0)
{
    draw_sprite(tutorial_sprite_use, second, vxw5 + 58, vyh - 90);
}
if (title_alpha != 0)
{
    title_alpha = max(0, title_alpha - 0.02);
    draw_set_alpha(title_alpha - 4);
    draw_rectangle_color(view_xview[0], view_yview[0], vxw, vyh, c_black, c_black, c_black, c_black, 0);
    draw_set_alpha(title_alpha);
    draw_set_font(global.fntSmall);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_text_outline(global.level_name, vxw5, (view_yview[0] + (view_hview[0] * 0.5)) - 20, 16777215, 4210752);
    draw_set_font(global.fntTinyAlt);
    draw_text_outline(global.level_subname, vxw5, view_yview[0] + (view_hview[0] * 0.5) + 30, 16777215, 4210752);
    draw_set_alpha(1);
}
draw_set_valign(fa_top);
draw_sprite(sDifficulty, 1, vxw - 68, vy_16);
draw_rectangle_color((vxw - 68) + 45, vy_16 + 20, (vxw - 68) + 45 + 5, vy_16 + 20 + max(80 * (1 - (((60 * minute) + second) / ((81 / global.diff_level) * 60))), 0), c_black, c_black, c_black, c_black, 0);
draw_sprite(sDifficulty, 0, vxw - 68, vy_16);
draw_sprite(sDifficultyButton, global.diff_level + 2, vxw - 88, view_yview[0] + 26);
draw_set_font(global.fntTiny);
draw_set_halign(fa_right);
draw_set_color(d1);
draw_text(vxw - 27, view_yview[0] + 45, difficulty);
draw_text(vxw - 22, view_yview[0] + 20, ssecond);
draw_text(vxw - 22 - 13, view_yview[0] + 20, ":");
draw_set_font(global.fntSmall);
draw_text(vxw - 22 - 17, view_yview[0] + 18, sminute);
draw_set_halign(fa_left);
if (oInit.coop != 1)
{
    var trow_max = floor((view_wview[0] - 218) / 28);
    j = 0;
    k = 0;
    b = 0;
    for (i = 1; i <= (oInit.player[1, 2].item_count + 1); i += 1)
    {
        if (i > (trow_max * (j + 1)))
        {
            j += 1;
        }
        if ((i - 1) >= ((trow_max / 2) + (trow_max * j)))
        {
            k = 1;
        }
        else
        {
            k = 0;
        }
        draw_sprite_ext(oInit.player[1, 2].item[i - 1, 0], 0, view_xview[0] + 8 + ((i - (j * trow_max)) * 28) + (k * 178), ((view_yview[0] + view_hview[0]) - 64) + (j * 28), 1, 1, 0, c_white, 0.6);
        if (point_distance(mouse_x, mouse_y, view_xview[0] + 8 + ((i - (j * trow_max)) * 28) + (k * 178), ((view_yview[0] + view_hview[0]) - 64) + (j * 28)) < 20)
        {
            if (mouse_x <= (view_xview[0] + (view_wview[0] * 0.5)))
            {
                b = -i;
            }
            else
            {
                b = i;
            }
        }
        if (oInit.player[1, 2].item[i - 1, 1] > 1)
        {
            draw_set_font(global.fntTinyAlt);
            draw_set_halign(fa_center);
            draw_set_valign(fa_bottom);
            draw_set_color(c_white);
            draw_text(view_xview[0] + 8 + ((i - (j * trow_max)) * 28) + (k * 178), ((view_yview[0] + view_hview[0]) - 64) + (j * 28) + 16, "x" + string(oInit.player[1, 2].item[i - 1, 1]));
        }
    }
    if (b != 0)
    {
        draw_set_font(global.fntTinyAlt);
        if (b < 0)
        {
            draw_set_halign(fa_left);
        }
        else
        {
            draw_set_halign(fa_right);
        }
        draw_set_valign(fa_bottom);
        draw_set_color(#1C1A24);
        draw_set_alpha(0.7);
        draw_rectangle(mouse_x + (3 * sign(b)), mouse_y, mouse_x - (string_width(oInit.player[1, 2].item[abs(b) - 1, 2]) * sign(b)), mouse_y - string_height(oInit.player[1, 2].item[abs(b) - 1, 2]), false);
        draw_set_color(c_white);
        draw_set_alpha(1);
        draw_text(round(mouse_x), round(mouse_y), oInit.player[1, 2].item[abs(b) - 1, 2]);
    }
}
if (oInit.coop != 1 && oInit.player[1, 2].following_player_index == -10)
{
    draw_hud(info_index);
}
draw_hud_coop(info_index);
vy_16 = view_yview[0] + 16;
vxw = view_xview[0] + view_wview[0];
vxw5 = view_xview[0] + (view_wview[0] * 0.5);
vyh = view_yview[0] + view_hview[0];
draw_set_font(global.fntTinyAlt);
draw_set_valign(fa_bottom);
draw_set_color(c_ltgray);
if (oInit.coop == 2 && !global.host)
{
    draw_set_halign(fa_right);
    draw_text(vxw - 6, vyh - 16, global.my_player.ping);
}
draw_set_halign(fa_left);
draw_set_halign(fa_right);
draw_set_alpha(1);
draw_set_color(c_gray);
draw_set_font(global.fntTinyAlt);
if (oInit.coop != 0)
{
    with (oP)
    {
        if (inside_view(x, y) == 0 && dead == 0)
        {
            draw_sprite_ext(sprite_index, -1, max(min(x, vxw - 8), view_xview[0] + 8), max(min(y, vyh) - 8, view_yview[0] + 8), image_xscale, image_yscale, 0, c_white, 1);
            draw_circle_color(max(min(x, vxw - 8), view_xview[0] + 8), max(min(y, vyh) - 8, view_yview[0] + 8), 8, oInit.player_color[player_id], oInit.player_color[player_id], 1);
        }
    }
}
