draw_sprite_ext(sprite_index, -1, x, y, image_xscale, 1, 0, image_blend, 1);
if (global.debug == 1)
{
    draw_text(x, y, state);
    draw_point(x + ((-sprite_get_xoffset(sprite_idle) + sprite_get_width(sprite_idle) + 5) * image_xscale), (y - sprite_yoffset) + sprite_height + 3);
    draw_point(x - ((sprite_get_xoffset(sprite_idle) - 5) * image_xscale), (y - sprite_yoffset) + sprite_height + 3);
}
if (oHUD.boss == 1 && oHUD.boss_id != id)
{
    draw_hp_bar(1);
}
