draw_sprite(sElevatorFloor, 1, x, y);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_font(global.fntTiny);
draw_set_color(c_white);
if (can_activate == 1 && active == 0)
{
    draw_ctext(x - 60, round(y) - 8, "Press &y&'" + string_key(global.yes_key) + "'&!& to activate.");
}
