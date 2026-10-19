var __b__ = action_if(page == 0);
var d;
if (__b__)
{
    draw_set_valign(fa_top);
    draw_set_alpha(0.8);
    d = 3811112;
    draw_rectangle_color(view_xview[0] + (view_wview[0] * 0.5), view_yview[0] + (view_hview[0] * 0.1), (view_xview[0] + view_wview[0]) - 8, view_yview[0] + (view_hview[0] * 0.7), c_dkgray, c_dkgray, c_dkgray, c_dkgray, 0);
    draw_rectangle_color(view_xview[0] + (view_wview[0] * 0.5) + 2, view_yview[0] + (view_hview[0] * 0.1) + 2, (view_xview[0] + view_wview[0]) - 10, (view_yview[0] + (view_hview[0] * 0.7)) - 2, d, d, d, d, 0);
    draw_set_color(c_white);
    draw_line(view_xview[0] + (view_wview[0] * 0.5) + 8 + 2, view_yview[0] + (view_hview[0] * 0.1) + 32 + 146, (view_xview[0] + view_wview[0]) - 16 - 2, view_yview[0] + (view_hview[0] * 0.1) + 32 + 146);
    draw_set_halign(fa_left);
    draw_set_color(c_white);
    draw_set_font(global.fntTinyAlt);
    draw_ctext(view_xview[0] + (view_wview[0] * 0.5) + 12, view_yview[0] + (view_hview[0] * 0.1) + 32 + 10, "Level: &y&" + string(oInit.record_level) + "&!&");
    draw_ctext(view_xview[0] + (view_wview[0] * 0.5) + 12, view_yview[0] + (view_hview[0] * 0.1) + 32 + 30, "TIME: &y&" + string(floor(oInit.record_time / 60)) + ":" + string(oInit.record_time % 60) + "&!&");
    draw_ctext(view_xview[0] + (view_wview[0] * 0.5) + 12, view_yview[0] + (view_hview[0] * 0.1) + 32 + 50, "KILLS: &y&" + string(oInit.record_kills) + "&!&");
    draw_ctext(view_xview[0] + (view_wview[0] * 0.5) + 12, view_yview[0] + (view_hview[0] * 0.1) + 32 + 70, "BOSSES: &y&" + string(oInit.record_bosses) + "&!&");
    draw_ctext(view_xview[0] + (view_wview[0] * 0.5) + 12, view_yview[0] + (view_hview[0] * 0.1) + 32 + 90, "ITEMS: &y&" + string(oInit.record_item) + "&!&");
    draw_ctext(view_xview[0] + (view_wview[0] * 0.5) + 12, view_yview[0] + (view_hview[0] * 0.1) + 32 + 110, "GOLD: &y&" + string(oInit.record_gold) + "&!&");
    draw_ctext(view_xview[0] + (view_wview[0] * 0.5) + 12, view_yview[0] + (view_hview[0] * 0.1) + 32 + 130, "PURCHASES: &y&" + string(oInit.record_chest) + "&!&");
    draw_ctext(view_xview[0] + (view_wview[0] * 0.825), view_yview[0] + (view_hview[0] * 0.1) + 32 + 10, "&y&" + string(record_level_points) + "&!& POINTS");
    draw_ctext(view_xview[0] + (view_wview[0] * 0.825), view_yview[0] + (view_hview[0] * 0.1) + 32 + 30, "&y&" + string(record_time_points) + "&!& POINTS");
    draw_ctext(view_xview[0] + (view_wview[0] * 0.825), view_yview[0] + (view_hview[0] * 0.1) + 32 + 50, "&y&" + string(record_kills_points) + "&!& POINTS");
    draw_ctext(view_xview[0] + (view_wview[0] * 0.825), view_yview[0] + (view_hview[0] * 0.1) + 32 + 70, "&y&" + string(record_bosses_points) + "&!& POINTS");
    draw_ctext(view_xview[0] + (view_wview[0] * 0.825), view_yview[0] + (view_hview[0] * 0.1) + 32 + 90, "&y&" + string(record_item_points) + "&!& POINTS");
    draw_ctext(view_xview[0] + (view_wview[0] * 0.825), view_yview[0] + (view_hview[0] * 0.1) + 32 + 110, "&y&" + string(record_gold_points) + "&!& POINTS");
    draw_ctext(view_xview[0] + (view_wview[0] * 0.825), view_yview[0] + (view_hview[0] * 0.1) + 32 + 130, "&y&" + string(record_chest_points) + "&!& POINTS");
    draw_ctext(view_xview[0] + (view_wview[0] * 0.825), view_yview[0] + (view_hview[0] * 0.1) + 32 + 150, "&y&" + string(record_level_points + record_time_points + record_kills_points + record_bosses_points + record_item_points + record_gold_points + record_chest_points) + "&!& TOTAL");
    draw_set_font(global.fntSmall);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(view_xview[0] + (view_wview[0] * 0.75), (view_yview[0] + (view_hview[0] * 0.1) + 32) - 18, "Top Scores:");
    d = 3811112;
    if (piechart_total > 0)
    {
        var radius = 70;
        var char_index = 1;
        i_last = 0;
        var angle_last = 90;
        draw_set_alpha(0.8);
        d = 3811112;
        draw_rectangle_color(view_xview[0] + 16, view_yview[0] + (view_hview[0] * 0.1), (view_xview[0] + (view_wview[0] * 0.5)) - 8, view_yview[0] + (view_hview[0] * 0.7), c_dkgray, c_dkgray, c_dkgray, c_dkgray, 0);
        draw_rectangle_color(view_xview[0] + 16 + 2, view_yview[0] + (view_hview[0] * 0.1) + 2, (view_xview[0] + (view_wview[0] * 0.5)) - 10, (view_yview[0] + (view_hview[0] * 0.7)) - 2, d, d, d, d, 0);
        draw_text(view_xview[0] + (view_wview[0] * 0.25), (view_yview[0] + (view_hview[0] * 0.1) + 32) - 18, "Games Played:");
        draw_set_font(global.fntTiny);
        draw_set_alpha(1);
        draw_set_halign(fa_left);
        var tvert_align = 12;
        for (i = 1; i <= 12; i += 1)
        {
            if (piechart[i, 0] != 0)
            {
                draw_set_color(piechart[i, 1]);
                draw_sector((view_xview[0] + (view_wview[0] * 0.25)) - 45, view_yview[0] + (view_hview[0] * 0.4), angle_last, angle_last + (piechart[i, 2] * 360), 5, 20, radius);
                draw_set_halign(fa_left);
                draw_text_outline(piechart[i, 3] + " (" + string(piechart[i, 0]) + ")", ((view_xview[0] + (view_wview[0] * 0.31)) - 43) + radius, ((view_yview[0] + (view_hview[0] * 0.4)) - 80) + (char_index * tvert_align), 16777215, 4210752);
                draw_background_ext(legend_square, (((view_xview[0] + (view_wview[0] * 0.31)) - 45) + radius) - 10, ((view_yview[0] + (view_hview[0] * 0.4)) - 80) + (char_index * tvert_align), 1, 1, 0, piechart[i, 1], 1);
                char_index += 1;
                angle_last = angle_last + (piechart[i, 2] * 360);
            }
        }
        angle_last = 90;
        for (i = 1; i <= 12; i += 1)
        {
            if (piechart[i, 0] != 0)
            {
                draw_set_halign(fa_center);
                if (round(piechart[i, 2] * 100) >= 5)
                {
                    draw_text_outline("" + string(round(piechart[i, 2] * 100)) + "%", round(((view_xview[0] + (view_wview[0] * 0.25)) - 45) + lengthdir_x(55, angle_last + (piechart[i, 2] * 180))), round(view_yview[0] + (view_hview[0] * 0.4) + lengthdir_y(55, angle_last + (piechart[i, 2] * 180))), 16777215, 4210752);
                }
                char_index += 1;
                angle_last = angle_last + (piechart[i, 2] * 360);
            }
        }
    }
    draw_set_alpha(0.8);
    draw_rectangle_color(view_xview[0] + 16, view_yview[0] + (view_hview[0] * 0.7) + 8, (view_xview[0] + view_wview[0]) - 16, (view_yview[0] + view_hview[0]) - 40, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 0);
    draw_rectangle_color(view_xview[0] + 18, view_yview[0] + (view_hview[0] * 0.7) + 10, (view_xview[0] + view_wview[0]) - 18, (view_yview[0] + view_hview[0]) - 42, d, d, d, d, 0);
    draw_rectangle_color(view_xview[0] + 22, (view_yview[0] + view_hview[0]) - 50 - 20, (view_xview[0] + view_wview[0]) - 22, (view_yview[0] + view_hview[0]) - 46, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 0);
    draw_rectangle_color(view_xview[0] + 24, (view_yview[0] + view_hview[0]) - 48 - 20, (view_xview[0] + view_wview[0]) - 24, (view_yview[0] + view_hview[0]) - 48, c_black, c_black, c_black, c_black, 0);
    draw_set_color(#DEC083);
    draw_rectangle(view_xview[0] + 24, (view_yview[0] + view_hview[0]) - 48 - 20, view_xview[0] + 24 + ((view_wview[0] - 48) * (progress / total_progress)), (view_yview[0] + view_hview[0]) - 48, false);
    draw_set_color(#ECE2BB);
    draw_rectangle(view_xview[0] + 24, (view_yview[0] + view_hview[0]) - 48 - 18, view_xview[0] + 24 + ((view_wview[0] - 48) * (progress / total_progress)), (view_yview[0] + view_hview[0]) - 48 - 12, false);
    draw_set_font(global.fntSmall);
    draw_set_halign(fa_center);
    draw_set_color(c_white);
    draw_text(view_xview[0] + (view_wview[0] * 0.5), view_yview[0] + (view_hview[0] * 0.7) + 16, "Game Completed:");
    draw_set_valign(fa_middle);
    draw_text_outline(string(round((progress / total_progress) * 1000) * 0.1) + " %", view_xview[0] + (view_wview[0] * 0.5), (view_yview[0] + view_hview[0]) - 48 - 7, 16777215, 4210752);
}
__b__ = action_if(page == 1);
if (__b__)
{
    var arch_enemy_sprite = -5;
    var ydisp = 0;
    arch_enemy_sprite = object_get_sprite(general_stats[6, 1]);
    var use_sprite = object_get_sprite(trophy_stats[11, 1]);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_alpha(0.8);
    d = 3811112;
    draw_rectangle_color(view_xview[0] + 16, view_yview[0] + (view_hview[0] * 0.1), (view_xview[0] + view_wview[0]) - 8, view_yview[0] + (view_hview[0] * 0.9), c_dkgray, c_dkgray, c_dkgray, c_dkgray, 0);
    draw_rectangle_color(view_xview[0] + 16 + 2, view_yview[0] + (view_hview[0] * 0.1) + 2, (view_xview[0] + view_wview[0]) - 10, (view_yview[0] + (view_hview[0] * 0.9)) - 2, d, d, d, d, 0);
    draw_set_color(c_white);
    draw_set_font(global.fntTiny);
    for (i = 0; i <= global.general_stats_number; i += 1)
    {
        if (i == 6)
        {
            if (sprite_exists(arch_enemy_sprite))
            {
                draw_ctext(view_xview[0] + 20 + 2 + 4, view_yview[0] + (view_hview[0] * 0.1) + 32 + 16 + (i * 14) + sprite_get_yoffset(arch_enemy_sprite), "* " + general_stats[i, 0]);
                draw_sprite(arch_enemy_sprite, 0, ((view_xview[0] + 20 + 2 + 4 + string_width("* " + general_stats[i, 0])) - sprite_get_xoffset(arch_enemy_sprite)) + sprite_get_width(arch_enemy_sprite) + 4, view_yview[0] + (view_hview[0] * 0.1) + 32 + 16 + (i * 14) + sprite_get_yoffset(arch_enemy_sprite));
            }
        }
        else
        {
            draw_ctext(view_xview[0] + 20 + 2 + 4, view_yview[0] + (view_hview[0] * 0.1) + 32 + 16 + (i * 14), "* " + general_stats[i, 0] + "&y& " + general_stats[i, 1] + "&!&");
        }
    }
    for (i = 0; i <= global.trophy_stats_number; i += 1)
    {
        if (i == 11)
        {
            ydisp = sprite_get_yoffset(use_sprite) * 2;
            draw_ctext(view_xview[0] + (view_wview[0] * 0.5), view_yview[0] + (view_hview[0] * 0.1) + 32 + 16 + (i * 14) + sprite_get_yoffset(use_sprite), "* " + trophy_stats[i, 0]);
            if (sprite_exists(use_sprite))
            {
                draw_sprite(use_sprite, 0, ((view_xview[0] + (view_wview[0] * 0.5) + string_width("* " + trophy_stats[i, 0])) - sprite_get_xoffset(use_sprite)) + sprite_get_width(use_sprite) + 4, view_yview[0] + (view_hview[0] * 0.1) + 32 + 16 + (i * 14) + sprite_get_yoffset(use_sprite));
            }
        }
        else
        {
            draw_ctext(view_xview[0] + (view_wview[0] * 0.5), view_yview[0] + (view_hview[0] * 0.1) + 32 + 16 + (i * 14) + ydisp, "* " + trophy_stats[i, 0] + "&y& " + trophy_stats[i, 1] + "&!&");
        }
        if (oInit.trophy_stats_new[i] == 1)
        {
            draw_sprite(sHighscore, current_time / 400, (view_xview[0] + (view_wview[0] * 0.5) + string_width("* " + trophy_stats[i, 0] + "&y& " + trophy_stats[i, 1] + "&!&")) - 32, view_yview[0] + (view_hview[0] * 0.1) + 32 + 16 + (i * 14) + ydisp);
        }
    }
    draw_set_font(global.fntSmall);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(view_xview[0] + (view_wview[0] * 0.5), view_yview[0] + (view_hview[0] * 0.1) + 16, "Stats:");
}
__b__ = action_if(page == 2);
if (__b__)
{
    var previous_parent = 99;
    var xdisp = 0;
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_alpha(0.8);
    d = 3811112;
    draw_rectangle_color(view_xview[0] + 16, view_yview[0] + (view_hview[0] * 0.1), (view_xview[0] + view_wview[0]) - 8, view_yview[0] + (view_hview[0] * 0.9), c_dkgray, c_dkgray, c_dkgray, c_dkgray, 0);
    draw_rectangle_color(view_xview[0] + 16 + 2, view_yview[0] + (view_hview[0] * 0.1) + 2, (view_xview[0] + view_wview[0]) - 10, (view_yview[0] + (view_hview[0] * 0.9)) - 2, d, d, d, d, 0);
    draw_set_color(c_white);
    draw_set_font(global.fntTiny);
    var ds_list = ds_list_find_value(ds_ach, ds_page);
    for (i = 1; i < ds_list_size(ds_list); i += 1)
    {
        if (oInit.achievement[ds_list_find_value(ds_list, i), 8] != previous_parent || ds_list_find_value(ds_list, i) == 2)
        {
            xdisp += 1;
        }
        if (oInit.achievement[ds_list_find_value(ds_list, i), 8] == 99 && ds_list_find_value(ds_list, i) != 2 && ds_list_find_value(ds_list, i) != 13)
        {
            xdisp = 0;
        }
        if (oInit.achievement[ds_list_find_value(ds_list, i), 0] != 0)
        {
            draw_set_halign(fa_left);
            draw_set_color(#EFD27B);
            draw_sprite(sLockedInSmall, 1, view_xview[0] + 53 + (8 * xdisp), (view_yview[0] + view_yview[0] + (view_hview[0] * 0.1) + 56 + (11 * i)) - 3);
            draw_text(view_xview[0] + 55 + (8 * xdisp), (view_yview[0] + view_yview[0] + (view_hview[0] * 0.1) + 56 + (11 * i)) - 3, oInit.achievement[ds_list_find_value(ds_list, i), 6]);
            draw_set_halign(fa_right);
            draw_set_color(#7EB686);
            draw_text((view_xview[0] + view_wview[0]) - 10, (view_yview[0] + view_yview[0] + (view_hview[0] * 0.1) + 56 + (11 * i)) - 3, oInit.achievement[ds_list_find_value(ds_list, i), 7]);
        }
        else
        {
            draw_set_color(c_white);
            draw_set_halign(fa_left);
            draw_sprite(sLockedInSmall, 0, view_xview[0] + 53 + (8 * xdisp), (view_yview[0] + view_yview[0] + (view_hview[0] * 0.1) + 56 + (11 * i)) - 3);
            if (oInit.achievement[oInit.achievement[ds_list_find_value(ds_list, i), 8], 0] == 0 && oInit.achievement[ds_list_find_value(ds_list, i), 8] != 99)
            {
                draw_text(view_xview[0] + 55 + (8 * xdisp), (view_yview[0] + view_yview[0] + (view_hview[0] * 0.1) + 56 + (11 * i)) - 3, "???");
            }
            else
            {
                draw_text(view_xview[0] + 55 + (8 * xdisp), (view_yview[0] + view_yview[0] + (view_hview[0] * 0.1) + 56 + (11 * i)) - 3, oInit.achievement[ds_list_find_value(ds_list, i), 6]);
            }
        }
        previous_parent = oInit.achievement[ds_list_find_value(ds_list, i), 8];
    }
    draw_set_font(global.fntSmall);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(view_xview[0] + (view_wview[0] * 0.5), view_yview[0] + (view_hview[0] * 0.1) + 16, "Unlockables:");
    draw_set_font(global.fntSmall);
    draw_set_halign(fa_left);
    draw_text(view_xview[0] + 48, view_yview[0] + (view_hview[0] * 0.1) + 40, ds_list_find_value(ds_list, 0));
    if (ds_page > 0)
    {
        if (mouse_x > ((view_xview[0] + 48) - 30) && mouse_x < (((view_xview[0] + 48) - 20) + 15) && mouse_y > (view_yview[0] + (view_hview[0] * 0.1) + 40) && mouse_y < (view_yview[0] + (view_hview[0] * 0.1) + 40 + 14))
        {
            if (mouse_check_button_pressed(mb_left))
            {
                ds_page = max(ds_page - 1, 0);
            }
            draw_sprite_ext(sArrow, 0, (view_xview[0] + 48) - 15, view_yview[0] + (view_hview[0] * 0.1) + 40 + 7, -1, 1, 0, c_white, 1);
        }
        else
        {
            draw_sprite_ext(sArrow, 0, (view_xview[0] + 48) - 15, view_yview[0] + (view_hview[0] * 0.1) + 40 + 7, -1, 1, 0, #EFD27B, 1);
        }
    }
    if (ds_page < ds_page_max)
    {
        if (mouse_x < (view_xview[0] + 48 + string_width(ds_list_find_value(ds_list, 0)) + 10 + 15) && mouse_x > (view_xview[0] + 48 + string_width(ds_list_find_value(ds_list, 0))))
        {
            if (mouse_check_button_pressed(mb_left))
            {
                ds_page = min(ds_page + 1, ds_page_max);
            }
            draw_sprite_ext(sArrow, 0, view_xview[0] + 48 + string_width(ds_list_find_value(ds_list, 0)) + 10, view_yview[0] + (view_hview[0] * 0.1) + 40 + 7, 1, 1, 0, c_white, 1);
        }
        else
        {
            draw_sprite_ext(sArrow, 0, view_xview[0] + 48 + string_width(ds_list_find_value(ds_list, 0)) + 10, view_yview[0] + (view_hview[0] * 0.1) + 40 + 7, 1, 1, 0, #EFD27B, 1);
        }
    }
}
draw_set_font(global.fntSmall);
draw_set_halign(fa_center);
draw_set_alpha(1);
if (choice == 1)
{
    d = 16777215;
}
else
{
    d = 8421504;
}
draw_text_outline("Back to main menu", view_xview[0] + (view_wview[0] / 2), (view_yview[0] + view_hview[0]) - 24, d, 4210752);
for (i = 0; i <= 2; i += 1)
{
    var index;
    if (page == i)
    {
        index = i + 6;
    }
    else
    {
        index = i;
    }
    if (mouse_x > (view_xview[0] + 16 + (i * (sprite_get_width(sHighscoreTabs) + 2))) && mouse_x < (view_xview[0] + 16 + (i * (sprite_get_width(sHighscoreTabs) + 2)) + 84) && mouse_y < (view_yview[0] + 16 + 32))
    {
        index = i + 3;
        if (mouse_check_button_pressed(mb_left) == 1)
        {
            page = i;
        }
    }
    draw_sprite_ext(sHighscoreTabs, index, view_xview[0] + 16 + (i * (sprite_get_width(sHighscoreTabs) + 2)), view_yview[0] + 16, 1, 1, 0, c_white, 0.8);
}
draw_set_color(c_black);
draw_set_alpha(black_screen);
draw_rectangle(view_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + view_hview[0], false);
draw_set_alpha(1);
