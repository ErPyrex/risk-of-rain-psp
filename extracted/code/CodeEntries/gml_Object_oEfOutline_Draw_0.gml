with (parent)
{
    d3d_set_fog(true, other.image_blend, 0, 0);
    draw_sprite_ext(sprite_index, -1, round(x) + 1, round(y) + 1, image_xscale, image_yscale, image_angle, c_white, other.image_alpha);
    draw_sprite_ext(sprite_index, -1, round(x) + 1, round(y), image_xscale, image_yscale, image_angle, c_white, other.image_alpha);
    draw_sprite_ext(sprite_index, -1, round(x) + 1, round(y) - 1, image_xscale, image_yscale, image_angle, c_white, other.image_alpha);
    draw_sprite_ext(sprite_index, -1, round(x), round(y) - 1, image_xscale, image_yscale, image_angle, c_white, other.image_alpha);
    draw_sprite_ext(sprite_index, -1, round(x) - 1, round(y) - 1, image_xscale, image_yscale, image_angle, c_white, other.image_alpha);
    draw_sprite_ext(sprite_index, -1, round(x) - 1, round(y), image_xscale, image_yscale, image_angle, c_white, other.image_alpha);
    d3d_set_fog(false, other.image_blend, 0, 0);
}
