draw_rectangle_color(ceil(x), ceil(y) + (40 * charge), x + 29, y + 4 + (40 * charge), c_black, c_black, c_black, c_black, 0);
draw_rectangle_color(ceil(x), ceil(y) + (40 * charge), x + (29 * (abs(time - (charge * maxtime)) / maxtime)), y + 4 + (40 * charge), barColor, barColor, barColor, barColor, 0);
draw_sprite(sprite_index, image_index, ceil(x), ceil(y) + (40 * charge));
