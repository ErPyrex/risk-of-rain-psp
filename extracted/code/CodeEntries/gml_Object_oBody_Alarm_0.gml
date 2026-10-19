parent = collision_point(x, (y - sprite_yoffset) + sprite_height + 4, oBMove, 0, 1);
if (parent > 0)
{
    x_off = x - parent.x;
    y_off = y - parent.y;
}
