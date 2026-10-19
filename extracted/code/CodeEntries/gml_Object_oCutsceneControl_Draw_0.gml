if (room == rCutscene4)
{
    draw_set_alpha(random_range(0.2, 0.3));
    draw_set_color(c_maroon);
    draw_rectangle(view_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + view_hview[0], false);
}
if (room == rCutscene3)
{
    draw_set_alpha(white_alpha);
    draw_set_color(c_white);
    draw_rectangle(view_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + view_hview[0], false);
}
if (room == rCutscene6)
{
    draw_sprite(sSelect, 1, x + (view_wview[0] / 2) + 113, (y + (view_hview[0] / 2)) - 217);
    draw_set_alpha(1 - max(0, alarm[1] / 180));
    draw_set_color(c_white);
    if (alarm[0] == -1)
    {
        draw_rectangle(view_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + view_hview[0], false);
        oBlackbars.coeff = max(0, oBlackbars.coeff - 0.01);
    }
}
if (room == r2Cutscene3 || room == r2Cutscene2)
{
    draw_set_alpha(1 - white_alpha);
    draw_set_color(c_black);
    draw_rectangle(view_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + view_hview[0], false);
}
