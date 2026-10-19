if (instance_exists(parent) == 1)
{
    image_angle = turn_towards_advanced(image_angle, parent.image_angle, 1);
    x = parent.x + lengthdir_x(offset, parent.image_angle);
    y = parent.y + lengthdir_y(offset, parent.image_angle);
}
else
{
    instance_destroy();
}
