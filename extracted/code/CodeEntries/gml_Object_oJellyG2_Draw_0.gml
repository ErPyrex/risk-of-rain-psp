if (image_blend == c_white)
{
    draw_self();
}
else
{
    pal_swap_set(0, sprite_palette, 0, 634, elite_tier);
    draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
    pal_swap_reset();
}
draw_hp_bar(0);
