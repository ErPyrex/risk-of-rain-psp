draw_buff();
var tcol1 = 12696206;
var tcol2 = 14344898;
var tgx = round(ghost_x);
var tgy = round(ghost_y);
if (ghost == 0)
{
    if (elite == 0)
    {
        draw_sprite_ext(sprite_index, -1, tgx, tgy, image_xscale, image_yscale, image_angle, c_white, image_alpha);
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
        pal_swap_set(0, sprite_palette, 0, 634, elite_tier);
        draw_sprite_ext(sprite_index, -1, tgx, tgy, image_xscale, image_yscale, image_angle, c_white, image_alpha);
        pal_swap_reset();
    }
    if (frozen != 0)
    {
        d3d_set_fog(true, tcol1, 0, 0);
        draw_sprite_ext(sprite_index, -1, tgx, tgy, image_xscale, image_yscale, image_angle, c_white, 0.7);
        d3d_set_fog(false, tcol1, 0, 0);
    }
}
else if (global.graphics == 3)
{
    draw_set_blend_mode(bm_add);
    draw_sprite_ext(sprite_index, -1, tgx, tgy, image_xscale, image_yscale, image_angle, #818EBE, 0.8);
    draw_set_blend_mode(bm_normal);
}
else
{
    draw_sprite_ext(sprite_index, -1, tgx, tgy, image_xscale, image_yscale, image_angle, tcol2, 0.6);
    d3d_set_fog(true, tcol2, 0, 0);
    draw_sprite_ext(sprite_index, image_index, tgx, tgy, image_xscale, image_yscale, image_angle, c_white, 0.3);
    d3d_set_fog(false, tcol2, 0, 0);
}
if (global.debug == 1)
{
    draw_text(ghost_x, ghost_y, state);
}
