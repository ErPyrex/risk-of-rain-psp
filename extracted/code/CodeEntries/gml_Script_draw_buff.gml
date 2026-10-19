for (i = 0; i < buff_count; i += 1)
{
    draw_sprite(sBuffs, buff[i, 0], ceil(x), ceil(y) - sprite_get_yoffset(sprite_idle) - (13 * i) - 16);
}
