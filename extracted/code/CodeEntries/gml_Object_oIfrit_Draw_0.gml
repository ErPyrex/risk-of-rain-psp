if (elite == 0)
{
    draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
}
else
{
    pal_swap_set(0, sprite_palette, 0, 634, elite_tier_from_blend(image_blend));
    draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
    pal_swap_reset();
}
draw_buff();
if (global.debug == 1)
{
    draw_text(x, y + 60, m_id);
    draw_text(x, y, activity);
}
if (oHUD.boss == 1 && oHUD.boss_id != id)
{
    draw_hp_bar(1);
}
