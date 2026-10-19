if (damaging == 1 || (damaging == 0 && alarm[0] == -1))
{
    draw_sprite_ext(sprite_index, -1, x, y, 1, 1, direction, c_white, 1);
}
draw_set_alpha(1);
