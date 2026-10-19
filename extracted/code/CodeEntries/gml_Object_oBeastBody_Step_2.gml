ff += 0.05;
turn_towards_2(image_angle, target_angle, 1);
direction = image_angle;
if (speed != intended_speed)
{
    speed += (sign(intended_speed - speed) * 0.04);
}
