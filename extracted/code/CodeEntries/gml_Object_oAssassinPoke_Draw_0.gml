if (hit == 2 && floor(image_index) == 8)
{
    draw_set_color(c_ltgray);
    draw_rectangle(view_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + view_hview[0], false);
    draw_sprite(sAssassinPlayer, 0, oP.x, oP.y);
}
draw_sprite_ext(sprite_index, -1, x, y, image_xscale, 1, 0, c_white, image_alpha);
