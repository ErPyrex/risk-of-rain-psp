draw_set_color(#99D9EA);
repeat (3)
{
    draw_set_alpha(0.4);
}
draw_circle((x - (2 * image_yscale)) + random(4 * image_yscale), (y - (2 * image_yscale)) + random(4 * image_yscale), (20 * image_yscale) - random(2 * image_yscale), 0);
draw_set_alpha(0.9);
draw_set_color(c_white);
draw_circle(x, y, max(16 * image_yscale, 1) - random(2 * image_yscale), 0);
