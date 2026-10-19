image_angle += image_angle_rate;
speed = min(speed + 0.001, 0);
image_angle_rate = max(0, abs(image_angle_rate) - 0.02) * sign(image_angle_rate);
with (instance_create(x, y, oMotionBlur))
{
    image_index = other.image_index;
    sprite_index = other.sprite_index;
    image_angle = other.image_angle;
    image_blend = other.image_blend;
}
