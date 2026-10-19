if (elite == 0)
{
    draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, image_blend, 1);
}
else
{
    pal_swap_set(0, sprite_palette, 0, 634, elite_tier);
    draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
    pal_swap_reset();
}
if (white_alpha != 0)
{
    draw_set_color(c_white);
    draw_set_alpha(white_alpha);
    draw_rectangle(view_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + view_hview[0], false);
}
if (oHUD.boss == 1 && oHUD.boss_id != id)
{
    draw_hp_bar(1);
}
