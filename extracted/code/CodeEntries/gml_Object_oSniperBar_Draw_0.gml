if (oInit.coop != 2 || parent == global.my_player)
{
    draw_sprite(sprite_index, 0, x, y);
    draw_sprite(sprite_index, 1, (x + position) - 17, y);
}
