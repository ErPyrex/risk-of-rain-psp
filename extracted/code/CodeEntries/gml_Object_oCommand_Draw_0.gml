draw_set_alpha(1);
draw_sprite(sprite_index, -1, x, y);
if (can_activate == 1 && active == 0)
{
    draw_set_halign(fa_left);
    draw_set_valign(fa_bottom);
    draw_set_font(global.fntTinyAlt);
    draw_set_color(c_white);
    if (global.joystick_on == 0)
    {
        draw_ctext(x - 80, round(y) - 32, "Press &y&'" + string_key(global.yes_key) + "'&!& to &b&leave the planet.&!&");
    }
    else
    {
        draw_ctext(x - 80, round(y) - 32, "Press '" + string_key(global.yes_key_gp) + "' to &b&leave the planet.&!&");
    }
}
if (alarm[1] != -1)
{
    draw_set_alpha(random_range(0.2, 0.3));
    draw_set_color(c_maroon);
    draw_rectangle(view_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + view_hview[0], false);
}
