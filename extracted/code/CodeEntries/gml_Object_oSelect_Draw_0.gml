var fat = 0;
draw_sprite(sSelect, 0, ((view_xview[0] + view_wview[0]) - 16) + xshake, view_yview[0] + 8 + yshake);
draw_set_font(global.fntMedium);
draw_set_valign(fa_bottom);
draw_set_halign(fa_center);
draw_set_color(#EFD27B);
draw_text(view_xview[0] + (view_wview[0] / 2), view_yview[0] + 20, "SELECT A SURVIVOR");
if (temp_choice == -5)
{
    draw_set_color(c_white);
}
else
{
    draw_set_color(c_gray);
}
draw_text(view_xview[0] + (view_wview[0] / 2), (view_yview[0] + view_hview[0]) - 30, "Play");
draw_set_font(global.fntTinyAlt);
for (i = 0; i <= 2; i += 1)
{
    var d;
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
    var d = i;
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
var x_offset = -2;
var y_offset = 0;
for (i = 0; i < char_number; i += 1)
{
    fat = 0;
    var d = 0;
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
