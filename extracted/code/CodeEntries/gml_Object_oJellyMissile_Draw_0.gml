if (image_blend != c_white)
{
    color = image_blend;
}
draw_circle_color(x, y, 5 + random(1), color, color, 0);
draw_circle_color(x, y, 4, c_white, c_white, 1);
if (global.diff_level != 3)
{
    draw_circle_color(targetx, targety, 2, c_white, c_white, 1);
}
