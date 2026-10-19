if (oHUD.boss == 1 && oHUD.boss_id != id)
{
    draw_hp_bar(1);
}
draw_self();
if (global.graphics >= 2)
{
    draw_set_blend_mode(bm_add);
}
draw_sprite_ext(sprite_index, -1, round(x), round(y), image_xscale + 0.1 + random(0.1), image_yscale + 0.1 + random(0.1), image_angle, #818EBE, image_alpha - 0.4);
if (global.graphics >= 2)
{
    draw_set_blend_mode(bm_normal);
}
draw_buff();
if (global.debug == 1)
{
    draw_text(ghost_x, ghost_y, state);
}
