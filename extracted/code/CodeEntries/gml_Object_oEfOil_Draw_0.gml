var tc = make_color_rgb(23, 21, 21);
with (parent)
{
    d3d_set_fog(true, tc, 0, 0);
    draw_sprite_ext(sprite_index, -1, round(x), round(y), image_xscale, image_yscale, image_angle, c_white, 1 * other.image_alpha);
    d3d_set_fog(false, tc, 0, 0);
}
