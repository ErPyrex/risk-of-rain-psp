draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(view_xview[0] + 8, ((view_yview[0] + view_hview[0]) - (view_hview[0] * 0.15)) + 4, string_copy(text1, 0, text1_pos));
draw_set_font(global.fntTiny);
draw_set_valign(fa_bottom);
draw_text(view_xview[0] + 8, (view_yview[0] + view_hview[0]) - 4, string_copy(text2, 0, text2_pos));
