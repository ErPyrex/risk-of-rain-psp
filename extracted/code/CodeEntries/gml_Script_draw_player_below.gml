i = 0;
while (i <= item_count)
{
    i += 1;
}
if (sp != 0)
{
    draw_sprite_ext(sprite_index, -1, ceil(x - (6 * image_xscale)), ceil(y), image_xscale, 1, 0, c_black, 0.6);
    draw_sprite_ext(sprite_index, -1, ceil(x - (6 * image_xscale)), ceil(y), image_xscale * random_range(1.1, 1.3), 1 * random_range(1.1, 1.3), 0, c_black, 0.3);
}
if (reflecting != 0)
{
    draw_sprite_ext(sEfReflector, (current_time / 20) + 10, x, y, 1, 1, current_time * 4, c_white, 0.9);
}
if (gauss != 0)
{
    draw_set_color(#CF6666);
    draw_set_alpha(0.2);
    draw_circle(ceil(x), ceil(y), ((24 + random(3)) * gauss_charge) / 100, 0);
    draw_circle(ceil(x), ceil(y), ((14 + random(2)) * gauss_charge) / 100, 0);
    draw_set_color(c_white);
    repeat (4)
    {
        draw_circle(ceil(x), ceil(y), ((6 + random(1)) * gauss_charge) / 100, 0);
    }
}
