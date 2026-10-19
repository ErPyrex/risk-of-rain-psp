for (s = 0; s <= height_b; s += 16)
{
    draw_sprite_ext(sWaterfall, -1, x, y + s, 1, 1, 0, image_blend, 0.6);
    for (i = 0; i < width_b; i += 10)
    {
        draw_sprite_ext(sWaterfallMid, -1, x + 10 + i, y + s, 1, 1, 0, image_blend, 0.6);
        if (s == height_b)
        {
            draw_sprite_ext(sWaterfallSplash, -1, x + 10 + i, y + s + 16, 1, 1, 0, image_blend, 0.6);
        }
    }
    draw_sprite_ext(sWaterfall, -1, x + 20 + i, y + s, -1, 1, 0, image_blend, 0.6);
    if (s == height_b)
    {
        draw_sprite_ext(sWaterfallSplash, -1, x + 10 + i, y + s + 16, 1, 1, 0, image_blend, 0.6);
        draw_sprite_ext(sWaterfallSplash, -1, x + 20 + i, y + s + 16, 1, 1, 0, image_blend, 0.6);
        draw_sprite_ext(sWaterfallSplash, -1, x, y + s + 16, 1, 1, 0, image_blend, 0.6);
        draw_sprite_ext(sWaterfallSplash, -1, x - 10, y + s + 16, 1, 1, 0, image_blend, 0.6);
    }
}
