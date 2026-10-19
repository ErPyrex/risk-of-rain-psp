var x_offset = -2;
var y_offset = 0;
var fat = 0;
draw_set_alpha(11);
draw_sprite(sSelect, 0, ((view_xview[0] + view_wview[0]) - 16) + xshake, view_yview[0] + 8 + yshake);
draw_set_font(global.fntSmall);
draw_set_valign(fa_bottom);
draw_set_halign(fa_center);
draw_set_color(#EFD27B);
draw_text(view_xview[0] + (view_wview[0] / 2), view_yview[0] + 20, "Player " + string(player_choosing) + ", select a character!");
if (temp_choice == -5)
{
    draw_set_color(c_white);
}
else
{
    draw_set_color(c_gray);
}
if (player_choosing == player_max)
{
    draw_text(view_xview[0] + (view_wview[0] / 2), (view_yview[0] + view_hview[0]) - 30, "Play");
}
else
{
    draw_text(view_xview[0] + (view_wview[0] / 2), (view_yview[0] + view_hview[0]) - 30, "Choose Character");
}
draw_set_font(global.fntTinyAlt);
var text;
if (keyboard == 0)
{
    text = "Gamepad " + string(gamepad_count + 1);
}
else
{
    text = "Keyboard";
}
var d;
if (mouse_y < (view_yview[0] + 8 + 80) && mouse_y > ((view_yview[0] + 8 + 80) - 15) && can_keyboard)
{
    if (keyboard_chosen == 0 && (mouse_check_button_pressed(mb_left) == 1 || global.mouse_emulate))
    {
        keyboard = !keyboard;
    }
    d = 16777215;
}
else
{
    d = oInit.player_color[player_choosing];
}
draw_set_color(d);
draw_text(((view_xview[0] + view_wview[0]) - 16 - 165) + 52 + xshake, view_yview[0] + 8 + 80, "Control: " + text);
d = 8114927;
if (mouse_y < (view_yview[0] + 8 + 65) && mouse_y > ((view_yview[0] + 8 + 65) - 15))
{
    if (mouse_check_button_pressed(mb_left) == 1 || global.mouse_emulate)
    {
        player_max_chosen += 1;
        if (player_max_chosen > min(4, gamepad_get_device_count()))
        {
            player_max_chosen = max(player_choosing, 2);
        }
    }
    d = 16777215;
}
draw_set_color(d);
draw_text(((view_xview[0] + view_wview[0]) - 16 - 165) + 52 + xshake, view_yview[0] + 8 + 65, "Players: " + string(player_max_chosen));
for (i = 0; i <= 2; i += 1)
{
    if (mouse_x > (((((view_xview[0] + view_wview[0]) - 24) + xshake) - 113 - 25) + (25 * i)) && mouse_x < (((((view_xview[0] + view_wview[0]) - 8) + xshake) - 113 - 25) + (25 * i)) && mouse_y >= (((view_yview[0] + 360) - 68) + yshake) && mouse_y <= (((view_yview[0] + 360) - 56) + yshake))
    {
        d = i + 3;
        if (mouse_check_button_pressed(mb_left) == 1 || global.mouse_emulate)
        {
            global.diff_level = i + 1;
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
    draw_sprite(sDifficultyButton, d, ((((view_xview[0] + view_wview[0]) - 16) + xshake) - 113 - 25) + (25 * i), ((view_yview[0] + 360) - 62) + yshake);
}
for (i = 0; i < global.artifact_number; i += 1)
{
    d = i;
    var tcolor;
    if (oInit.artifact_found[i] != 0)
    {
        tcolor = 5329247;
        if (mouse_x > (((((view_xview[0] + view_wview[0]) - 24) + xshake) - 113 - (16 * ((global.artifact_number / 2) - 0.5))) + (16 * i)) && mouse_x < (((((view_xview[0] + view_wview[0]) - 8) + xshake) - 113 - (16 * ((global.artifact_number / 2) - 0.5))) + (16 * i)) && mouse_y >= (((view_yview[0] + 360) - 40) + yshake) && mouse_y <= (((view_yview[0] + 360) - 28) + yshake))
        {
            tcolor = 7039851;
            if (mouse_check_button_pressed(mb_left) == 1 || global.mouse_emulate)
            {
                oInit.artifact_active[i] = !oInit.artifact_active[i];
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
    draw_sprite_ext(sSelectArtifact, d, ((((view_xview[0] + view_wview[0]) - 16) + xshake) - 113 - (16 * ((global.artifact_number / 2) - 0.5))) + (16 * i), ((view_yview[0] + 360) - 34) + yshake, 1, 1, 0, tcolor, 1);
}
draw_set_valign(fa_bottom);
draw_set_halign(fa_center);
for (i = 0; i < char_number; i += 1)
{
    fat = 0;
    d = 0;
    if (i == 4)
    {
        fat = 1;
    }
    if (i == 5)
    {
        y_offset = 1;
        x_offset = -7;
    }
    if (i == choice)
    {
        draw_set_color(#EFD27B);
        d = chosen_index;
        draw_text(((view_xview[0] + view_wview[0]) - 16 - 135) + (26 * (i + x_offset)) + xshake, view_yview[0] + 8 + 100 + yshake + (87 * y_offset), charac[i, 0]);
        if (i > 0)
        {
            draw_sprite_ext(sArrow, 1, (((view_xview[0] + view_wview[0]) - 16 - 135) + (26 * (i + x_offset)) + xshake) - (string_width(charac[i, 0]) / 2) - 8, ((view_yview[0] + 8 + 100) - 5) + yshake + (87 * y_offset), -1, 1, 0, c_white, 1);
        }
        if (i < (char_number - 1))
        {
            if (charac[i + 1, 12] == 1)
            {
                draw_sprite_ext(sArrow, 1, ((view_xview[0] + view_wview[0]) - 16 - 135) + (26 * (i + x_offset)) + xshake + (string_width(charac[i, 0]) / 2) + 8, ((view_yview[0] + 8 + 100) - 5) + yshake + (87 * y_offset), 1, 1, 0, c_white, 1);
            }
        }
    }
    else if (i == temp_choice && charac[i, 12] == 1)
    {
        d = 2;
    }
    else if (charac[i, 12] == 1)
    {
        d = 1;
    }
    else
    {
        d = 0;
    }
    draw_sprite(charac[i, 1], d, ((view_xview[0] + view_wview[0]) - 16 - 148) + (26 * (i + x_offset)) + xshake, view_yview[0] + 8 + yshake + 100 + (87 * y_offset));
}
draw_text((((view_xview[0] + view_wview[0]) - 16) + xshake) - 113, (view_yview[0] + 360 + yshake) - 73, "Difficulty");
draw_text((((view_xview[0] + view_wview[0]) - 16) + xshake) - 113, ((view_yview[0] + 360 + yshake) - 73) + 32, "Artifacts");
for (k = 1; k <= 4; k += 1)
{
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
    draw_set_color(oInit.class_color[choice + 1]);
    draw_sprite(charac[choice, 2], k - 1, view_xview[0] + 16, view_yview[0] + 80 + (41 * k));
    draw_text(view_xview[0] + 16 + 24, view_yview[0] + 80 + (41 * k), charac[choice, (k * 2) + 1] + ":");
    draw_set_color(c_white);
    draw_ctext(view_xview[0] + 16 + 24 + 6, view_yview[0] + 80 + (41 * k) + 10, charac[choice, (k * 2) + 2]);
}
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_ctext(view_xview[0] + 16, view_yview[0] + 40, charac[choice, 11]);
draw_set_alpha(0.5);
draw_rectangle_color((mouse_x + 16) - 1, mouse_y - 1, mouse_x + 16 + string_width("Player " + string(player_choosing)), mouse_y + 12, c_black, c_black, c_black, c_black, 0);
draw_text_color(mouse_x + 16, mouse_y, "Player " + string(player_choosing), oInit.player_color[player_choosing], oInit.player_color[player_choosing], oInit.player_color[player_choosing], oInit.player_color[player_choosing], 1);
draw_set_halign(fa_center);
y_offset = 0;
x_offset = -1;
for (i = 1; i < player_choosing; i += 1)
{
    y_offset = 0;
    x_offset = -2;
    if (player[i, 0] >= 5)
    {
        y_offset = 1;
        x_offset = -7;
    }
    d = 0;
    for (t = 1; t < i; t += 1)
    {
        if (player[t, 0] == player[i, 0])
        {
            d += 1;
        }
    }
    draw_rectangle_color((((view_xview[0] + view_wview[0]) - 16 - 135) + (26 * ((player[i, 0] - 1) + x_offset)) + xshake) - 5, ((view_yview[0] + (87 * y_offset) + 8 + 160 + yshake) - 1) + (d * 20), ((view_xview[0] + view_wview[0]) - 16 - 135) + (26 * ((player[i, 0] - 1) + x_offset)) + xshake + 5, view_yview[0] + (87 * y_offset) + 8 + 160 + yshake + 11 + (d * 20), c_black, c_black, c_black, c_black, 0);
    draw_text_color(((view_xview[0] + view_wview[0]) - 16 - 135) + (26 * ((player[i, 0] - 1) + x_offset)) + xshake, view_yview[0] + (87 * y_offset) + 8 + 160 + yshake + (d * 20), string(i), oInit.player_color[i], oInit.player_color[i], oInit.player_color[i], oInit.player_color[i], 1);
}
for (ttt = 0; ttt < 3; ttt += 1)
{
    if (mouse_x > (((((view_xview[0] + view_wview[0]) - 24) + xshake) - 113 - 25) + (25 * ttt)) && mouse_x < (((((view_xview[0] + view_wview[0]) - 8) + xshake) - 113 - 25) + (25 * ttt)) && mouse_y >= (((view_yview[0] + 360) - 68) + yshake) && mouse_y <= (((view_yview[0] + 360) - 56) + yshake))
    {
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_set_alpha(0.85);
        draw_set_color(c_black);
        var tcopy_string = diff[ttt];
        tcopy_string += "";
        draw_rectangle(mouse_x - string_width(tcopy_string) - 8, mouse_y - string_height(tcopy_string) - 8, mouse_x + 8, mouse_y + 8, false);
        draw_rectangle(mouse_x - string_width(tcopy_string) - 10, mouse_y - string_height(tcopy_string) - 10, mouse_x + 10, mouse_y + 10, true);
        draw_set_alpha(1);
        draw_set_color(c_white);
        draw_ctext(min(mouse_x - string_width(tcopy_string), (view_xview[0] + view_wview[0]) - 220), mouse_y - string_height(tcopy_string), diff[ttt]);
    }
}
for (ttt = 0; ttt < global.artifact_number; ttt += 1)
{
    if (mouse_x > (((((view_xview[0] + view_wview[0]) - 24) + xshake) - 113 - (16 * ((global.artifact_number / 2) - 0.5))) + (16 * ttt)) && mouse_x < (((((view_xview[0] + view_wview[0]) - 8) + xshake) - 113 - (16 * ((global.artifact_number / 2) - 0.5))) + (16 * ttt)) && mouse_y >= (((view_yview[0] + 360) - 40) + yshake) && mouse_y <= (((view_yview[0] + 360) - 28) + yshake))
    {
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_set_alpha(0.85);
        draw_set_color(c_black);
        var tstring;
        if (oInit.artifact_found[ttt] != 0)
        {
            tstring = artifact[ttt];
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
