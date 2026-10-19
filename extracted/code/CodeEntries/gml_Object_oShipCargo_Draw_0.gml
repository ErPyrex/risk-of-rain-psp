var tt;
if (trashed)
{
    tt = 2;
}
else
{
    tt = 0;
}
draw_sprite_ext(sShipCargo, tt, x, y + (40 * cos(degtorad(y2))), 1, 1, 0, merge_color(c_gray, c_white, (y2 - 270) / 180), 1);
draw_sprite_ext(sShipCargoLine, 0, x + 47, y, 1, 40 * cos(degtorad(y2)), 0, merge_color(c_gray, c_white, (y2 - 270) / 180), 1);
draw_sprite_ext(sShipCargoLine, 0, x - 47, y, 1, 40 * cos(degtorad(y2)), 0, merge_color(c_gray, c_white, (y2 - 270) / 180), 1);
draw_sprite_ext(sShipCargo, tt, x, y + (40 * cos(degtorad(y4))), 1, 1, 0, merge_color(c_white, c_gray, y4 / 270), 1);
draw_sprite_ext(sShipCargoLine, 0, x + 47, y, 1, 40 * cos(degtorad(y4)), 0, merge_color(c_white, c_gray, y4 / 270), 1);
draw_sprite_ext(sShipCargoLine, 0, x - 47, y, 1, 40 * cos(degtorad(y4)), 0, merge_color(c_white, c_gray, y4 / 270), 1);
draw_sprite_ext(sShipCargo, tt, x, y + (40 * cos(degtorad(y1))), 1, 1, 0, merge_color(c_gray, c_white, (y1 + 90) / 180), 1);
draw_sprite_ext(sShipCargoLine, 0, x + 47, y, 1, 40 * cos(degtorad(y1)), 0, merge_color(c_gray, c_white, (y1 + 90) / 180), 1);
draw_sprite_ext(sShipCargoLine, 0, x - 47, y, 1, 40 * cos(degtorad(y1)), 0, merge_color(c_gray, c_white, (y1 + 90) / 180), 1);
draw_sprite_ext(sShipRod, 0, x + 47, y, 1, 1, 0, merge_color(c_gray, c_white, 0.5), 1);
draw_sprite_ext(sShipCargoLine, 0, x + 47, y, 1, 40 * cos(degtorad(y3)), 0, merge_color(c_white, c_gray, (y3 - 90) / 180), 1);
draw_sprite_ext(sShipCargoLine, 0, x - 47, y, 1, 40 * cos(degtorad(y3)), 0, merge_color(c_white, c_gray, (y3 - 90) / 180), 1);
draw_sprite_ext(sShipCargo, tt, x, y + (40 * cos(degtorad(y3))), 1, 1, 0, merge_color(c_white, c_gray, (y3 - 90) / 180), 1);
