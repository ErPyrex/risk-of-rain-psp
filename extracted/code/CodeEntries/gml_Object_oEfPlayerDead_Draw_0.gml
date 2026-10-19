if (post_game == 0)
{
    draw_sprite_ext(sprite_index, -1, x, y, image_xscale, 1, 0, c_white, 1);
}
if (alarm[0] == -1 && rest == 1 && post_game == 0)
{
    draw_set_alpha(1);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    if (oInit.coop == 0)
    {
        draw_set_font(global.fntMedium);
        draw_text(view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 3), text[text_choice]);
    }
    else
    {
        draw_set_font(global.fntTinyAlt);
        draw_text(ceil(x), ceil(y - 8), text[text_choice]);
    }
}
if (following == 1 && instance_exists(oInit.player[1, 2].following_player))
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_color(c_white);
    draw_text(view_xview[0] + (view_wview[0] / 2), (view_yview[0] + view_hview[0]) - 54, "You have died. Following '" + oInit.player[1, 2].following_player.user_name + "'#Press JUMP to toggle players");
}
if (post_game == 1 && tab == 1)
{
    draw_set_alpha(0.8);
    d = 3811112;
    draw_rectangle_color(view_xview[0] + (view_wview[0] * 0.1), view_yview[0] + (view_hview[0] * 0.1), view_xview[0] + (view_wview[0] * 0.9), view_yview[0] + (view_hview[0] * 0.7), c_dkgray, c_dkgray, c_dkgray, c_dkgray, 0);
    draw_rectangle_color((view_xview[0] + (view_wview[0] * 0.5)) - 108, view_yview[0] + (view_hview[0] * 0.7), view_xview[0] + (view_wview[0] * 0.5) + 108, view_yview[0] + (view_hview[0] * 0.7) + 83, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 0);
    draw_rectangle_color(view_xview[0] + (view_wview[0] * 0.1) + 8, view_yview[0] + (view_hview[0] * 0.1) + 8, (view_xview[0] + (view_wview[0] * 0.9)) - 8, (view_yview[0] + (view_hview[0] * 0.7)) - 8, d, d, d, d, 0);
    draw_rectangle_color((view_xview[0] + (view_wview[0] * 0.5)) - 100, view_yview[0] + (view_hview[0] * 0.7), view_xview[0] + (view_wview[0] * 0.5) + 100, view_yview[0] + (view_hview[0] * 0.7) + 75, d, d, d, d, 0);
    draw_line_color(view_xview[0] + (view_wview[0] * 0.6), view_yview[0] + (view_hview[0] * 0.1) + 8, view_xview[0] + (view_wview[0] * 0.6), (view_yview[0] + (view_hview[0] * 0.7)) - 9, c_dkgray, c_dkgray);
    draw_set_font(global.fntSmall);
    draw_set_color(c_white);
    draw_line(view_xview[0] + (view_wview[0] * 0.1) + 12, view_yview[0] + (view_hview[0] * 0.1) + 32 + 148, view_xview[0] + (view_wview[0] * 0.45) + 65, view_yview[0] + (view_hview[0] * 0.1) + 32 + 148);
    draw_line(view_xview[0] + (view_wview[0] * 0.6) + 5, view_yview[0] + (view_hview[0] * 0.1) + 92, (view_xview[0] + (view_wview[0] * 0.9)) - 13, view_yview[0] + (view_hview[0] * 0.1) + 92);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_set_alpha(1);
    draw_text(view_xview[0] + (view_wview[0] * 0.5), view_yview[0] + (view_hview[0] * 0.1) + 12, "LOSS!");
    draw_text(view_xview[0] + (view_wview[0] * 0.75), view_yview[0] + (view_hview[0] * 0.1) + 72, "Unlocked");
    draw_set_halign(fa_left);
    if (choice != 1)
    {
        draw_set_color(c_gray);
    }
    if (oInit.coop == 2)
    {
        if (!global.host)
        {
            draw_set_color(c_gray);
            draw_text((view_xview[0] + (view_wview[0] * 0.5)) - 95, view_yview[0] + (view_hview[0] * 0.7) + 10, "Waiting for host..");
        }
        else
        {
            draw_text((view_xview[0] + (view_wview[0] * 0.5)) - 95, view_yview[0] + (view_hview[0] * 0.7) + 10, "Return to lobby?");
        }
    }
    else
    {
        draw_text((view_xview[0] + (view_wview[0] * 0.5)) - 95, view_yview[0] + (view_hview[0] * 0.7) + 10, "Try Again?");
    }
    if (oInit.coop != 2)
    {
        if (choice == 2)
        {
            draw_set_color(c_white);
        }
        else
        {
            draw_set_color(c_gray);
        }
        draw_text((view_xview[0] + (view_wview[0] * 0.5)) - 95, view_yview[0] + (view_hview[0] * 0.7) + 48, "Back to menu?");
    }
    draw_set_color(c_white);
    draw_set_font(global.fntTinyAlt);
    draw_ctext(view_xview[0] + (view_wview[0] * 0.1) + 12, view_yview[0] + (view_hview[0] * 0.1) + 32 + 10, "Level: &y&" + string(death_level) + "&!&");
    if (oInit.record_level < death_level)
    {
        draw_sprite(sHighscore, oHUD.second, view_xview[0] + (view_wview[0] * 0.1) + 12 + string_width("Level:" + string(death_level)) + 8, view_yview[0] + (view_hview[0] * 0.1) + 32 + 10);
    }
    draw_ctext(view_xview[0] + (view_wview[0] * 0.1) + 12, view_yview[0] + (view_hview[0] * 0.1) + 32 + 30, "TIME: &y&" + string(death_minute) + ":" + string(death_second) + "&!&");
    if (oInit.record_time < ((death_minute * 60) + death_second))
    {
        draw_sprite(sHighscore, oHUD.second, view_xview[0] + (view_wview[0] * 0.1) + 12 + string_width("TIME: " + string(death_minute) + ":" + string(death_second)) + 8, view_yview[0] + (view_hview[0] * 0.1) + 32 + 30);
    }
    draw_ctext(view_xview[0] + (view_wview[0] * 0.1) + 12, view_yview[0] + (view_hview[0] * 0.1) + 32 + 50, "KILLS: &y&" + string(death_kills) + "&!&");
    if (oInit.record_kills < death_kills)
    {
        draw_sprite(sHighscore, oHUD.second, view_xview[0] + (view_wview[0] * 0.1) + 12 + string_width("KILLS:" + string(death_kills)) + 8, view_yview[0] + (view_hview[0] * 0.1) + 32 + 50);
    }
    draw_ctext(view_xview[0] + (view_wview[0] * 0.1) + 12, view_yview[0] + (view_hview[0] * 0.1) + 32 + 70, "BOSSES: &y&" + string(death_bosses) + "&!&");
    if (oInit.record_bosses < death_bosses)
    {
        draw_sprite(sHighscore, oHUD.second, view_xview[0] + (view_wview[0] * 0.1) + 12 + string_width("BOSSES:" + string(death_bosses)) + 8, view_yview[0] + (view_hview[0] * 0.1) + 32 + 70);
    }
    draw_ctext(view_xview[0] + (view_wview[0] * 0.1) + 12, view_yview[0] + (view_hview[0] * 0.1) + 32 + 90, "ITEMS: &y&" + string(death_item) + "&!&");
    if (oInit.record_item < death_item)
    {
        draw_sprite(sHighscore, oHUD.second, view_xview[0] + (view_wview[0] * 0.1) + 12 + string_width("ITEMS:" + string(death_item)) + 8, view_yview[0] + (view_hview[0] * 0.1) + 32 + 90);
    }
    draw_ctext(view_xview[0] + (view_wview[0] * 0.1) + 12, view_yview[0] + (view_hview[0] * 0.1) + 32 + 110, "GOLD: &y&" + string(death_gold) + "&!&");
    if (oInit.record_gold < death_gold)
    {
        draw_sprite(sHighscore, oHUD.second, view_xview[0] + (view_wview[0] * 0.1) + 12 + string_width("GOLD:" + string(death_gold)) + 8, view_yview[0] + (view_hview[0] * 0.1) + 32 + 110);
    }
    draw_ctext(view_xview[0] + (view_wview[0] * 0.1) + 12, view_yview[0] + (view_hview[0] * 0.1) + 32 + 130, "PURCHASES: &y&" + string(death_chest) + "&!&");
    if (oInit.record_chest < death_chest)
    {
        draw_sprite(sHighscore, oHUD.second, view_xview[0] + (view_wview[0] * 0.1) + 12 + string_width("PURCHASES:" + string(death_chest)) + 8, view_yview[0] + (view_hview[0] * 0.1) + 32 + 130);
    }
    draw_ctext(view_xview[0] + (view_wview[0] * 0.45), view_yview[0] + (view_hview[0] * 0.1) + 32 + 10, "&y&" + string(death_level_points) + "&!& POINTS");
    draw_ctext(view_xview[0] + (view_wview[0] * 0.45), view_yview[0] + (view_hview[0] * 0.1) + 32 + 30, "&y&" + string(death_time_points) + "&!& POINTS");
    draw_ctext(view_xview[0] + (view_wview[0] * 0.45), view_yview[0] + (view_hview[0] * 0.1) + 32 + 50, "&y&" + string(death_kills_points) + "&!& POINTS");
    draw_ctext(view_xview[0] + (view_wview[0] * 0.45), view_yview[0] + (view_hview[0] * 0.1) + 32 + 70, "&y&" + string(death_bosses_points) + "&!& POINTS");
    draw_ctext(view_xview[0] + (view_wview[0] * 0.45), view_yview[0] + (view_hview[0] * 0.1) + 32 + 90, "&y&" + string(death_item_points) + "&!& POINTS");
    draw_ctext(view_xview[0] + (view_wview[0] * 0.45), view_yview[0] + (view_hview[0] * 0.1) + 32 + 110, "&y&" + string(death_gold_points) + "&!& POINTS");
    draw_ctext(view_xview[0] + (view_wview[0] * 0.45), view_yview[0] + (view_hview[0] * 0.1) + 32 + 130, "&y&" + string(death_chest_points) + "&!& POINTS");
    draw_ctext(view_xview[0] + (view_wview[0] * 0.45), view_yview[0] + (view_hview[0] * 0.1) + 32 + 150, "&y&" + string(death_level_points + death_time_points + death_kills_points + death_bosses_points + death_item_points + death_gold_points + death_chest_points) + "&!& TOTAL");
    if (oInit.record_points < (death_level_points + death_time_points + death_kills_points + death_bosses_points + death_item_points + death_gold_points + death_chest_points))
    {
        draw_sprite(sHighscore, oHUD.second, (view_xview[0] + (view_wview[0] * 0.45)) - sprite_get_width(sHighscore) - 8, view_yview[0] + (view_hview[0] * 0.1) + 32 + 150);
    }
    draw_ctext(view_xview[0] + (view_wview[0] * 0.6) + 5, view_yview[0] + (view_hview[0] * 0.1) + 12, "Class: " + player_name);
    draw_sprite(player_index, 0, view_xview[0] + (view_wview[0] * 0.6) + string_width("Class: " + player_name) + 15, view_yview[0] + (view_hview[0] * 0.1) + 19);
    if (death_last_hit != -1)
    {
        draw_sprite_ext(object_get_sprite(death_last_hit), 0, ((view_xview[0] + (view_wview[0] * 0.6) + string_width("Killed By: " + death_last_hit_name) + 14) - sprite_get_xoffset(object_get_sprite(death_last_hit))) + sprite_get_width(object_get_sprite(death_last_hit)), view_yview[0] + (view_hview[0] * 0.1) + 37, -1, 1, 0, c_white, 1);
        draw_ctext(view_xview[0] + (view_wview[0] * 0.6) + 5, view_yview[0] + (view_hview[0] * 0.1) + 34, "Killed By: " + death_last_hit_name);
    }
    draw_set_alpha(white_glow);
    draw_rectangle_color(view_xview[0] + (view_wview[0] * 0.1), view_yview[0] + (view_hview[0] * 0.1), view_xview[0] + (view_wview[0] * 0.9), view_yview[0] + (view_hview[0] * 0.7), c_white, c_white, c_white, c_white, 0);
    draw_set_alpha(1);
    var yoff = 0;
    var xoff = 0;
    for (i = 0; i <= oInit.achievement_number; i += 1)
    {
        if (oInit.achievement[i, 0] == 1)
        {
            xoff += 1;
            if (xoff > 6)
            {
                xoff = 1;
                yoff += 1;
            }
            draw_sprite(oInit.achievement[i, 3], 1, view_xview[0] + (view_wview[0] * 0.6) + 5 + (xoff * 25), view_yview[0] + (view_hview[0] * 0.1) + 112 + (yoff * 30));
            if (mouse_x > (view_xview[0] + (view_wview[0] * 0.6) + 5 + ((xoff - 0.5) * 25)) && mouse_x < (view_xview[0] + (view_wview[0] * 0.6) + 5 + ((xoff + 0.5) * 25)) && mouse_y < (view_yview[0] + (view_hview[0] * 0.1) + 135 + (yoff * 30)) && mouse_y > (view_yview[0] + (view_hview[0] * 0.1) + 135 + ((yoff - 1) * 30)))
            {
                d3d_set_fog(true, c_white, 0, 0);
                draw_sprite_ext(oInit.achievement[i, 3], 1, view_xview[0] + (view_wview[0] * 0.6) + 5 + (xoff * 25), view_yview[0] + (view_hview[0] * 0.1) + 112 + (yoff * 30), 1, 1, image_angle, c_white, 0.8);
                d3d_set_fog(false, c_white, 0, 0);
                draw_set_font(global.fntTinyAlt);
                draw_set_color(c_white);
                draw_set_valign(fa_top);
                draw_set_halign(fa_right);
                d = 1;
                draw_set_alpha(0.7);
                draw_rectangle_color(mouse_x + 8, mouse_y - 12, mouse_x - (string_width(oInit.achievement[i, 4]) + 8), (mouse_y - 12) + string_height(oInit.achievement[i, 4]), c_black, c_black, c_black, c_black, 0);
                draw_set_alpha(1);
                draw_text(mouse_x, mouse_y - 12, oInit.achievement[i, 4]);
            }
        }
    }
}
