if (ghost == -1)
{
    draw_self();
}
else
{
    if (global.graphics >= 2)
    {
        draw_set_blend_mode(bm_add);
    }
    if (ghost == 1)
    {
        draw_sprite_ext(sprite_index, -1, round(x), round(y), image_xscale, image_yscale, image_angle, #818EBE, image_alpha - 0.1);
    }
    if (ghost == 2)
    {
        draw_sprite_ext(sprite_index, -1, round(x), round(y), image_xscale, image_yscale, image_angle, #FFC20E, image_alpha - 0.1);
    }
    if (global.graphics >= 2)
    {
        draw_set_blend_mode(bm_normal);
    }
}
draw_set_alpha(1);
