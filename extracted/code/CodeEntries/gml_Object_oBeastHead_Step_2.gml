if (head == 0)
{
    if (true_parent.chase == 1)
    {
        if (parent != true_parent)
        {
            parent.image_angle = turn_towards_advanced(parent.image_angle, image_angle, 0.9);
        }
    }
    else
    {
        image_angle = turn_towards_advanced(image_angle, parent.image_angle, 0.3);
    }
}
else
{
    image_angle = true_parent.image_angle;
    parent.image_angle = turn_towards_advanced(parent.image_angle, image_angle, 0.9);
}
x = parent.x + lengthdir_x(offset, parent.image_angle);
y = parent.y + lengthdir_y(offset, parent.image_angle);
