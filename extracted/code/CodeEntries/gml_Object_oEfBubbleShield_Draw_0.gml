draw_self();
if (global.graphics >= 2)
{
    draw_sprite_ext(sprite_index, -1, x, y, 1.1, 1.1, random(360), c_white, 0.2);
}
draw_sprite(sprite_index, image_index + 0.3, x, y);
draw_sprite(sprite_index, image_index + 0.6, x, y);
