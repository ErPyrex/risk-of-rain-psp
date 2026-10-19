if (!ghost)
{
    image_xscale = sign(image_xscale) * size_s;
    image_yscale = size_s;
}
draw_ai_default();
draw_hp_bar(0);
if (global.debug == 1)
{
    draw_text(x, y - 20, state);
    draw_text(x, y, size_s);
}
