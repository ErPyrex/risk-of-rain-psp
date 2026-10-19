draw_set_color(c_white);
draw_set_alpha(image_alpha);
if (global.graphics >= 2)
{
    for (i = 0; i < 10; i += 1)
    {
        draw_lightning(x + lengthdir_x(radius, i * 36), y + lengthdir_y(radius, i * 36), x + lengthdir_x(radius, (i * 36) + 36), y + lengthdir_y(radius, (i * 36) + 36), blend);
    }
}
else
{
    draw_circle(x, y, radius, 1);
}
