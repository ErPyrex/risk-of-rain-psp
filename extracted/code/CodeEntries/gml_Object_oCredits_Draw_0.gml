var yy = 0;
draw_sprite_part(sBoxshot, 0, (191 - (view_wview[0] / 4)) + 16, 0, (view_wview[0] / 2) - 16, view_hview[0], 2, 2);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);
for (i = 0; i <= text_count; i += 1)
{
    if (credits[i, 2] == 0)
    {
        draw_set_font(global.fntTiny);
        draw_set_color(c_white);
    }
    else
    {
        draw_set_font(global.fntSmall);
        draw_set_color(#EFD27B);
    }
    if (credits[i, 1] != -1)
    {
        draw_sprite_part_ext(credits[i, 1], 0, max(sprite_get_xoffset(credits[i, 1]) - 16, 0), 0, min(32, sprite_get_width(credits[i, 1])), min(32, sprite_get_height(credits[i, 1])), ((view_xview[0] + (view_wview[0] / 2)) - 8) + (16 - min(sprite_get_xoffset(credits[i, 1]), 16)), view_yview[0] + yoff + yy + (16 - min(sprite_get_yoffset(credits[i, 1]), 16)), 1, 1, c_white, 1);
        yy += 16;
    }
    draw_text_ext(view_xview[0] + (view_wview[0] / 2) + 32, view_yview[0] + yoff + yy, credits[i, 0], 16, (view_wview[0] / 2) - 32);
    yy += (string_height_ext(credits[i, 0], 16, (view_wview[0] / 2) - 32) + 3);
    if (credits[i, 1] != -1)
    {
        yy += 16;
    }
}
if ((view_yview[0] + yoff + yy) <= -30)
{
    done = 1;
}
draw_set_alpha(black_alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, view_wview[0], view_hview[0], false);
