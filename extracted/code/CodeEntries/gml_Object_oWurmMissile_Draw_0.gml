draw_set_alpha(0.5 * image_alpha);
draw_circle_color((x - 1) + random(1), (y - 1) + random(1), 10, #AECDEE, #AECDEE, 0);
repeat (2)
{
    draw_circle_color((x - 1) + random(1), (y - 1) + random(1), 4 + random(2), c_white, #AECDEE, 0);
}
