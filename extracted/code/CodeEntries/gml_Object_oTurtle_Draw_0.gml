draw_self();
if (image_speed2 != 0)
{
    draw_sprite_ext(sprite_index2, image_index2, x, y, image_xscale, 1, 0, c_white, 1);
}
if (oHUD.boss == 1 && oHUD.boss_id != id)
{
    draw_hp_bar(1);
}
