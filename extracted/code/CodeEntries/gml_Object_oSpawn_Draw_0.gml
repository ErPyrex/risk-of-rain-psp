if (elite > 0 && sprite_palette != -4)
{
    pal_swap_set(0, sprite_palette, 0, 634, elite_tier);
    draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
    pal_swap_reset();
}
else
{
    draw_self();
}
