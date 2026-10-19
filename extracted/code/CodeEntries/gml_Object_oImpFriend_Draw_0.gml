draw_self();
if (alarm[8] != -1)
{
    draw_set_valign(fa_bottom);
    draw_set_halign(fa_center);
    draw_set_font(global.fntTinyAlt);
    draw_set_color(c_white);
    draw_text(round(x), y - 20, quote[spawn_quote]);
}
draw_buff();
if (global.debug == 1)
{
    draw_set_font(global.fntTinyAlt);
    draw_text(x, y - 20, state);
    draw_text(x, y - 40, target);
}
