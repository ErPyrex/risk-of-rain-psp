draw_set_font(global.fntTiny);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(#EFD27B);
if (!global.in_game || global.my_player == -1)
{
    draw_text(x + 10, y, "Connecting...");
    exit;
}
draw_sprite(sprite_index, hover + (global.fair_loot * 2), x, y);
draw_text(x + 10, y, "Force item sharing");
