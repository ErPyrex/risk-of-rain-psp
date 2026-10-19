if (!global.in_game || global.my_player == -1)
{
    exit;
}
var fat_index_left = 0;
var fat_index_right = 0;
draw_set_font(global.fntMedium);
draw_set_valign(fa_bottom);
draw_set_halign(fa_center);
draw_set_color(#EFD27B);
draw_text(view_xview[0] + (view_wview[0] / 2), view_yview[0] + 24, "SELECT A CHARACTER");
draw_set_font(global.fntTinyAlt);
draw_sprite(sSelectMult, 0, view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2));
for (i = -5; i <= 6; i += 1)
{
    if (i == -1)
    {
        fat_index_right += 1;
    }
    if (mouse_x > (view_xview[0] + (view_wview[0] / 2) + 4 + ((i + fat_index_left) * 24)) && mouse_x < (view_xview[0] + (view_wview[0] / 2) + 4 + ((i + fat_index_right) * 24) + 25) && mouse_y < (((view_yview[0] + (view_hview[0] / 2)) - 32) + 60) && char_sprite[i + 5, 1] == 1 && mouse_y > ((view_yview[0] + (view_hview[0] / 2)) - 32))
    {
        if (char_sprite[i + 5, 2] == 0)
        {
            char_sprite[i + 5, 3] = 2;
        }
        if ((mouse_check_button_pressed(mb_left) == 1 || global.mouse_emulate) && player[player_id, 3] == 0)
        {
            if (global.my_player.class != -1)
            {
                char_sprite[global.my_player.class, 2] -= 1;
            }
            global.my_player.class = i + 5;
            player[1, 0] = i + 5;
            player[1, 6] = global.my_player.user_name;
            char_sprite[i + 5, 2] += 1;
            char_sprite[i + 5, 3] = 2;
            client_message_send(5, global.my_player.class, global.my_player.x, global.my_player.y, global.my_player.user_name + "|" + global.my_player.login);
            server_message_send(0, 5, global.my_player.object_index, global.my_player.m_id, global.my_player.class, global.my_player.x, global.my_player.y, global.my_player.user_name + "|" + global.my_player.login);
            global.my_player.ready = 0;
        }
    }
    else if (char_sprite[i + 5, 2] == 0)
    {
        char_sprite[i + 5, 3] = char_sprite[i + 5, 1];
    }
    draw_sprite(char_sprite[i + 5, 0], char_sprite[i + 5, 3], view_xview[0] + (view_wview[0] / 2) + 4 + ((i + fat_index_left) * 24), (view_yview[0] + (view_hview[0] / 2)) - 32);
    if (i == -1)
    {
        fat_index_left += 1;
    }
}
var h = 0;
if (mouse_y > (view_yview[0] + (view_hview[0] / 2) + 76) && mouse_x > ((view_xview[0] + (view_wview[0] / 2)) - 60) && mouse_x < (view_xview[0] + (view_wview[0] / 2) + 60))
{
    h = 1;
    if (mouse_check_button(mb_left) == 1)
    {
        h = 2;
    }
    if ((mouse_check_button_released(mb_left) == 1 || global.mouse_emulate) && global.my_player.class != -1 && player[player_id, 3] == 0 && pressed == 1)
    {
        pressed = 0;
        caster_play(132, global.volume, 1);
        player[player_id, 3] = 1;
        players_locked += 1;
        with (global.my_player)
        {
            ready = 1;
            client_message_send(1, ready);
            server_message_send(0, 1, object_index, m_id, ready);
        }
    }
    else if ((mouse_check_button_released(mb_left) == 1 || global.mouse_emulate) && global.host == 1 && players_locked >= instance_number(oPrePlayer))
    {
        launching = 1;
    }
}
if (global.host == 1 && players_locked >= instance_number(oPrePlayer))
{
    draw_sprite(sLaunch, h, view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2) + 96);
}
else
{
    h = max(h, player[player_id, 3] * 3);
    draw_sprite(sReady, h, view_xview[0] + (view_wview[0] / 2), view_yview[0] + (view_hview[0] / 2) + 96);
}
fat_index_left = 0;
fat_index_right = 0;
for (i = -5; i <= 6; i += 1)
{
    if (i == -1)
    {
        fat_index_right += 1;
    }
    var g = 0;
    if (char_sprite[i + 5, 2] != 0)
    {
        char_sprite[i + 5, 3] = min(char_sprite[i + 5, 3] + 0.2, sprite_get_number(char_sprite[i + 5, 0]) - 1);
        for (t = 1; t <= instance_number(oPrePlayer); t += 1)
        {
            if (instance_find(oPrePlayer, t - 1).class == (i + 5))
            {
                draw_set_color(oInit.player_color[t]);
                draw_rectangle(view_xview[0] + (view_wview[0] / 2) + 4 + ((i + fat_index_left) * 24) + g, ((view_yview[0] + (view_hview[0] / 2)) - 32) + g, (view_xview[0] + (view_wview[0] / 2) + 4 + ((i + fat_index_right) * 24) + 24) - g, (((view_yview[0] + (view_hview[0] / 2)) - 32) + 74) - g, true);
                draw_sprite_ext(sLockedIn, 0, view_xview[0] + (view_wview[0] / 2) + 4 + ((i + ((fat_index_right + fat_index_left) / 2)) * 24) + 12, ((view_yview[0] + (view_hview[0] / 2)) - 32) + 79 + (g * 15) + 4, 1, 1, 0, draw_get_color(), 1);
                if (instance_find(oPrePlayer, t - 1).ready == 1)
                {
                    draw_sprite(sLockedIn, 1, view_xview[0] + (view_wview[0] / 2) + 4 + ((i + ((fat_index_right + fat_index_left) / 2)) * 24) + 12, ((view_yview[0] + (view_hview[0] / 2)) - 32) + 79 + (g * 15) + 4);
                }
                g += 1;
            }
        }
    }
    if (i == -1)
    {
        fat_index_left += 1;
    }
}
for (i = 0; i <= 2; i += 1)
{
    var d;
    if (mouse_x > (view_xview[0] + (view_wview[0] / 2) + 158 + (25 * i)) && mouse_x < (view_xview[0] + (view_wview[0] / 2) + 158 + (25 * (i + 1))) && mouse_y >= ((view_yview[0] + (view_hview[0] / 2) + 160) - 68) && mouse_y <= ((view_yview[0] + (view_hview[0] / 2) + 160) - 56))
    {
        d = i + 3;
        if ((mouse_check_button_pressed(mb_left) == 1 || global.mouse_emulate) && global.host)
        {
            global.diff_level = clamp(i + 1, 1, 3);
            server_message_send(0, 39, 0, 0, global.diff_level, global.fair_loot, oInit.artifact_active[0], oInit.artifact_active[1], oInit.artifact_active[2], oInit.artifact_active[3], oInit.artifact_active[4], oInit.artifact_active[5], oInit.artifact_active[6], oInit.artifact_active[7], oInit.artifact_active[8], oInit.artifact_active[9]);
        }
    }
    else
    {
        d = i;
    }
    if ((i + 1) == global.diff_level)
    {
        d = i + 6;
    }
    draw_sprite(sDifficultyButton, d, view_xview[0] + (view_wview[0] / 2) + 166 + (25 * i), (view_yview[0] + (view_hview[0] / 2) + 160) - 62);
}
for (i = 0; i < global.artifact_number; i += 1)
{
    var d = i;
    if (max(oInit.artifact_found[i], oInit.artifact_active[i]) != 0)
    {
        tcolor = 5329247;
        if (mouse_x > (((view_xview[0] + (view_wview[0] / 2) + 320) - 24 - 113 - (16 * ((global.artifact_number / 2) - 0.5))) + (16 * i)) && mouse_x < (((view_xview[0] + (view_wview[0] / 2) + 320) - 8 - 113 - (16 * ((global.artifact_number / 2) - 0.5))) + (16 * i)) && mouse_y >= ((view_yview[0] + (view_hview[0] / 2) + 160) - 40) && mouse_y <= ((view_yview[0] + (view_hview[0] / 2) + 160) - 28))
        {
            tcolor = 7039851;
            if ((mouse_check_button_pressed(mb_left) == 1 || global.mouse_emulate) && global.host)
            {
                oInit.artifact_active[i] = !oInit.artifact_active[i];
                server_message_send(0, 39, 0, 0, global.diff_level, global.fair_loot, oInit.artifact_active[0], oInit.artifact_active[1], oInit.artifact_active[2], oInit.artifact_active[3], oInit.artifact_active[4], oInit.artifact_active[5], oInit.artifact_active[6], oInit.artifact_active[7], oInit.artifact_active[8], oInit.artifact_active[9]);
            }
        }
        else
        {
            tcolor = 5329247;
        }
        if (oInit.artifact_active[i] == 1)
        {
            d = i + global.artifact_number;
            tcolor = 16777215;
        }
    }
    else
    {
        tcolor = 0;
    }
    draw_sprite_ext(sSelectArtifact, d, ((view_xview[0] + (view_wview[0] / 2) + 191) - (16 * ((global.artifact_number / 2) - 0.5))) + (16 * i), (view_yview[0] + (view_hview[0] / 2) + 160) - 34, 1, 1, 0, tcolor, 1);
}
draw_set_color(#EFD27B);
draw_set_valign(fa_bottom);
draw_set_halign(fa_center);
draw_text(view_xview[0] + (view_wview[0] / 2) + 191, (view_yview[0] + (view_hview[0] / 2) + 160) - 73, "Difficulty");
draw_text(view_xview[0] + (view_wview[0] / 2) + 191, ((view_yview[0] + (view_hview[0] / 2) + 160) - 73) + 32, "Artifacts");
for (t = 0; t < 3; t += 1)
{
    if (mouse_x > (view_xview[0] + (view_wview[0] / 2) + 158 + (25 * t)) && mouse_x < (view_xview[0] + (view_wview[0] / 2) + 158 + (25 * (t + 1))) && mouse_y >= ((view_yview[0] + (view_hview[0] / 2) + 160) - 68) && mouse_y <= ((view_yview[0] + (view_hview[0] / 2) + 160) - 56))
    {
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        var tstring_copy = diff[t];
        tstring_copy += "";
        draw_set_alpha(0.85);
        draw_set_color(c_black);
        draw_rectangle(mouse_x - string_width(tstring_copy) - 8, mouse_y - string_height(tstring_copy) - 8, mouse_x + 8, mouse_y + 8, false);
        draw_rectangle(mouse_x - string_width(tstring_copy) - 10, mouse_y - string_height(tstring_copy) - 10, mouse_x + 10, mouse_y + 10, true);
        draw_set_alpha(1);
        draw_set_color(c_white);
        draw_ctext(min(mouse_x - string_width(tstring_copy), (view_xview[0] + view_wview[0]) - 220), mouse_y - string_height(tstring_copy), diff[t]);
    }
}
for (t = 0; t < global.artifact_number; t += 1)
{
    if (mouse_x > (((view_xview[0] + (view_wview[0] / 2) + 320) - 24 - 113 - (16 * ((global.artifact_number / 2) - 0.5))) + (16 * t)) && mouse_x < (((view_xview[0] + (view_wview[0] / 2) + 320) - 8 - 113 - (16 * ((global.artifact_number / 2) - 0.5))) + (16 * t)) && mouse_y >= ((view_yview[0] + (view_hview[0] / 2) + 160) - 40) && mouse_y <= ((view_yview[0] + (view_hview[0] / 2) + 160) - 28))
    {
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_set_alpha(0.85);
        draw_set_color(c_black);
        var tstring;
        if (max(oInit.artifact_found[t], oInit.artifact_active[t]) != 0)
        {
            tstring = artifact[t];
        }
        else
        {
            tstring = "&p&Artifacts&!& can be found in #hidden locations on the planet, #enabling &y&alternate game options.&y&";
        }
        var tstring_copy = tstring;
        tstring_copy += "";
        draw_rectangle(mouse_x - string_width(tstring_copy) - 8, mouse_y - string_height(tstring_copy) - 8, mouse_x + 8, mouse_y + 8, false);
        draw_rectangle(mouse_x - string_width(tstring_copy) - 10, mouse_y - string_height(tstring_copy) - 10, mouse_x + 10, mouse_y + 10, true);
        draw_set_alpha(1);
        draw_set_color(c_white);
        draw_ctext(min(mouse_x - string_width(tstring_copy), (view_xview[0] + view_wview[0]) - 220), mouse_y - string_height(tstring_copy), tstring);
    }
}
