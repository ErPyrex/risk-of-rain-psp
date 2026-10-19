draw_set_font(global.fntTiny);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
var tx = view_xview[0] + 8;
var ty = (view_yview[0] + view_hview[0]) - 17 - (70 * (room != rSelectMult));
var ta = min(alpha, 5);
var tt = min(ta, ds_list_size(chat));
for (c = 0; c < tt; c += 1)
{
    draw_set_color(ds_list_find_value(color, c));
    draw_ctext(tx, ty - (12 * c), ds_list_find_value(chat, c));
}
if (global.chatting)
{
    draw_set_color(c_white);
    draw_text(tx, (view_yview[0] + view_hview[0]) - 5, keyboard_string + "_");
}
