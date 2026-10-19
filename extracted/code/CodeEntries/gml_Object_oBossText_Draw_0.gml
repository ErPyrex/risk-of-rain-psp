draw_set_font(global.fntTiny);
draw_set_alpha(0.8 * image_alpha);
draw_set_color(c_teal);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text((x - 2) + random(4), (y - 2) + random(4), text1);
draw_set_alpha(1 * image_alpha);
draw_set_color(c_white);
draw_text(x, y, text1);
