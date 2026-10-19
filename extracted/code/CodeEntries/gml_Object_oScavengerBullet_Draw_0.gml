draw_set_alpha(0.4);
draw_circle_color((x - 1) + random(1), (y - 1) + random(1), 15, #AECDEE, #AECDEE, 0);
repeat (5)
{
    draw_circle_color((x - 1) + random(1), (y - 1) + random(1), 6 + random(2), c_white, #AECDEE, 0);
}
draw_set_alpha(1);
