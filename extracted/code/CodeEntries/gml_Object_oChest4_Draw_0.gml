draw_sprite(sprite_index, -1, x, y);
if (active != 3)
{
    draw_sprite_ext(sprite_id, 4, x, y - 18 - yo, 1, 1, 0, c_white, 0.7);
}
if (can_activate == 1 && active == 0)
{
    draw_set_halign(fa_left);
    draw_set_valign(fa_bottom);
    draw_set_font(global.fntTinyAlt);
    draw_set_color(c_white);
    if (global.joystick_on == 0)
    {
        draw_ctext(x - 80, round(y) - 32, "Press &y&'" + string_key(global.yes_key) + "'&!& to start selection&y&($" + string(cost) + ")&!&");
    }
    else
    {
        draw_ctext(x - 80, round(y) - 32, "Press '" + string_key(global.yes_key_gp) + "' to start selection&y&($" + string(cost) + ")&!&");
    }
}
else if (can_activate == 1 && active == 1)
{
    draw_set_halign(fa_left);
    draw_set_valign(fa_bottom);
    draw_set_font(global.fntTinyAlt);
    draw_set_color(c_white);
    if (global.joystick_on == 0)
    {
        draw_ctext(x - 80, round(y) - 32, "Press &y&'" + string_key(global.yes_key) + "'&!& to &y&choose item&!&");
    }
    else
    {
        draw_ctext(x - 80, round(y) - 32, "Press '" + string_key(global.yes_key_gp) + "' to &y&choose item&!&");
    }
}
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
else if (active == 1)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_font(global.fntTinyAlt);
    draw_set_color(#EFD27B);
    draw_set_alpha(0.7 + random(0.15));
    draw_text(x, y + 15, "Choose an item!");
    draw_set_alpha(1);
}
