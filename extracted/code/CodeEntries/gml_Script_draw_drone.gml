if (missile != 0)
{
    draw_sprite_ext(sEfArmsrace, 0, x, y, image_xscale, 1, 0, c_white, 1);
}
draw_sprite_ext(sprite_index, -1, x, y, image_xscale, 1, 0, c_white, 1);
if (hp < (maxhp * 0.2))
{
    draw_sprite(sWarning, oHUD.second, round(x), y - 15);
}
