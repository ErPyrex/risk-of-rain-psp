draw_self();
d3d_set_fog(true, other.image_blend, 0, 0);
draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha - 5);
with (oBoss1)
{
    draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, c_white, other.image_alpha - 5);
}
d3d_set_fog(false, other.image_blend, 0, 0);
