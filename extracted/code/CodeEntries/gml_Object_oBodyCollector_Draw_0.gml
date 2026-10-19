for (i = 0; i != bodyCount; i += 1)
{
    if (body[i, 5] == 16777215)
    {
        draw_sprite_ext(body[i, 0], body[i, 1], body[i, 2], body[i, 3], body[i, 4], 1, 0, body[i, 5], 1);
    }
    else
    {
        pal_swap_set(0, body[i, 6], 0, 634, elite_tier_from_blend(body[i, 5]));
        draw_sprite_ext(body[i, 0], body[i, 1], body[i, 2], body[i, 3], body[i, 4], 1, 0, c_white, 1);
        pal_swap_reset();
    }
}
