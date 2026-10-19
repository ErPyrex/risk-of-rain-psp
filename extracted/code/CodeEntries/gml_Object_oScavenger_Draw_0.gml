if (elite == 0)
{
    draw_sprite_ext(sprite_index, -1, ghost_x, ghost_y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
}
else if (elite_tier > 9)
{
    if ((activity != 0 || alarm[7] != -1) || random(100) < 1)
    {
        gg = instance_create(xprevious, yprevious, oEfTrail);
        gg.sprite_index = sprite_index;
        gg.image_index = image_index;
        gg.image_xscale = image_xscale * random_range(1, 1.2);
        gg.image_yscale = image_yscale;
        gg.rate = 0.1;
        gg.image_blend = c_black;
    }
}
else
{
    draw_sprite_ext(sprite_index, -1, ghost_x, ghost_y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
if (elite_tier <= 9)
{
    if (oHUD.boss == 1 && oHUD.boss_id != id)
    {
        draw_hp_bar(1);
    }
    draw_buff();
}
if (attack_speed_buffed == 1)
{
    draw_sprite_ext(sprite_index, -1, (x - 1) + random(2), y, (image_xscale - 0.25) + random(0.7), (image_yscale - 0.25) + random(0.7), 0, c_yellow, 0.4);
}
if (global.debug == 1)
{
    draw_text(x, y - 20, state);
}
