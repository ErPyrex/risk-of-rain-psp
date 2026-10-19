draw_set_color(c_ltgray);
draw_set_font(global.fntTiny);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
if (global.frame_skip == 0)
{
    draw_text((view_xview[0] + view_wview[0]) - 6, (view_yview[0] + view_hview[0]) - 6, string(fps));
}
else
{
    draw_text((view_xview[0] + view_wview[0]) - 6, (view_yview[0] + view_hview[0]) - 6, string(fps) + " F");
}
if (last_mouse_timer <= 240 && instance_number(oBlackbars) == 0)
{
    global.mouse_on = 1;
    draw_sprite_ext(sMouse, 0, ceil(mouse_x), ceil(mouse_y), 1, 1, 0, c_white, 1);
}
else
{
    global.mouse_on = 0;
}
