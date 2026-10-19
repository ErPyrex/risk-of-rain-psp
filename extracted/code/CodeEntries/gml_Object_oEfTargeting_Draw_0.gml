for (i = 0; i <= 3; i += 1)
{
    draw_set_alpha(max(image_alpha - 0.3, 0.3));
    draw_line_color(x + lengthdir_x(10, direction + (90 * i)), y + lengthdir_y(10, direction + (90 * i)), x + lengthdir_x(25, direction + (90 * i)), y + lengthdir_y(25, direction + (90 * i)), image_blend, image_blend);
    if (global.graphics == 3)
    {
        draw_line_color(x + lengthdir_x(15, (direction + (90 * i)) - 8), y + lengthdir_y(15, (direction + (90 * i)) - 8), x + lengthdir_x(15, direction + (90 * i) + 8), y + lengthdir_y(15, direction + (90 * i) + 8), image_blend, image_blend);
    }
}
draw_set_alpha(1);
