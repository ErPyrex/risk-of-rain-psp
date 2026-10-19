draw_set_alpha(1);
draw_sprite(sprite_index, -1, x, y);
if (active == 0)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_font(global.fntDamage);
    draw_set_color(#EFD27B);
    draw_set_alpha(0.7 + random(0.15));
    draw_set_alpha(1);
}
if (can_activate == 1 && active == 0)
{
    draw_set_halign(fa_left);
    draw_set_font(global.fntTinyAlt);
    draw_set_color(c_white);
    if (global.joystick_on == 0)
    {
        with (oHUD)
        {
            draw_ctext(other.x - 110, round(other.y) - 6, "Press &y&'" + string_key(global.yes_key) + "'&!& to inspect..&!&");
        }
    }
    else
    {
        with (oHUD)
        {
            draw_ctext(other.x - 110, round(other.y) - 6, "Press '" + string_key(global.yes_key_gp) + "' to inspect..&!&");
        }
    }
}
