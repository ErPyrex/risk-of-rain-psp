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
        draw_ctext(x - 105, round(y) - 16, "Press &y&'" + string_key(global.yes_key) + "'&!& to open door &b&(1 KEYCARD)&!&");
    }
    else
    {
        draw_ctext(x - 105, round(y) - 16, "Press '" + string_key(global.yes_key_gp) + "' to open door &b&(1 KEYCARD)&!&");
    }
}
if (active == 0)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_font(global.fntTinyAlt);
    draw_set_alpha(0.7 + random(0.15));
    draw_text_outline("1 KEYCARD", x + 15, y + 48, 12093564, 4210752);
    draw_set_alpha(1);
}
