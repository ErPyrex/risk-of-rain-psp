image_angle += 20;
if (place_meeting(x, y + vspeed, pBlock) == 1)
{
    var old_dir = direction;
    move_bounce_solid(1);
    if (abs(((((direction - old_dir) % 360) + 540) % 360) - 180) > 45)
    {
        instance_destroy();
    }
    bounces += 1;
    if (bounces >= 3)
    {
        instance_destroy();
    }
}
if (place_meeting(x + hspeed, y, pBlock) == 1)
{
    instance_destroy();
}
