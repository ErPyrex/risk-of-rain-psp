if (parent > 0 && instance_exists(parent))
{
    x = parent.x + x_off;
    y = (parent.y + y_off + parent.fall_speed + sprite_yoffset) - sprite_height;
}
