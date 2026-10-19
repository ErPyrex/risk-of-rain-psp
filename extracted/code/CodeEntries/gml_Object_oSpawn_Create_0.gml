image_xscale = choose(1, -1);
image_speed = 0;
alarm[0] = 1;
point_value = 0;
sprite_palette = -4;
parent = collision_point(x, (y - sprite_yoffset) + sprite_height + 4, oBMove, 0, 1);
if (parent > 0)
{
    x_off = x - parent.x;
    y_off = y - parent.y;
}
elite_tier = -1;
m_id = set_m_id(id);
