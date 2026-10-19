draw_set_alpha(1);
draw_sprite(sprite_index, -1, x, y);
if (active == 0)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_font(global.fntDamage);
    draw_set_color(#EFD27B);
    draw_set_alpha(0.7 + random(0.15));
    draw_text(x, y + 15, string(cost));
    draw_sprite_ext(sDamage, 11, x - (string_width(string(cost)) / 2) - 7, y + 6, 1, 1, 0, #EFD27B, draw_get_alpha());
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
            draw_ctext(other.x - 80, round(other.y) - 32, "Press &y&'" + string_key(global.yes_key) + "'&!& to purchase chest &y&($" + string(other.cost) + ")&!&");
        }
    }
    else
    {
        with (oHUD)
        {
            draw_ctext(other.x - 80, round(other.y) - 32, "Press '" + string_key(global.yes_key_gp) + "' to purchase chest &y&($" + string(other.cost) + ")&!&");
        }
    }
}
