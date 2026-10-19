draw_item();
if (item_switch == 1)
{
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_bottom);
    draw_set_font(global.fntTiny);
    draw_set_color(c_white);
    if (global.joystick_on == 0)
    {
        draw_ctext(x - 70, round(y) + 40, "Press &r&'" + string_key(global.swap_key) + "'&!& to switch use items");
    }
    else
    {
        draw_ctext(x - 70, round(y) + 40, "Press '" + string_key(global.swap_key_gp) + "' to switch use items");
    }
}
