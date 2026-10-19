draw_self();
if (head_active == 1)
{
    draw_sprite_ext(sprite_index2, image_index2, x, y, image_xscale2, 1, image_angle2, c_white, image_alpha);
}
if (global.debug == 1)
{
    draw_text(x, y, state);
}
