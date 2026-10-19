if (global.debug)
{
    draw_set_alpha(1);
    draw_set_font(global.fntTiny);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
    for (i = 0; i < 12; i++)
    {
        draw_text(view_xview[0] + 8, view_yview[0] + 8 + (16 * i), string(global.yoyocontrol[i]));
    }
}
