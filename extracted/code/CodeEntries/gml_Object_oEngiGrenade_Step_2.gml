image_angle += 3;
if (place_meeting(x, y, pBlock) == 1)
{
    move_bounce_solid(1);
    vspeed *= 0.5;
    bounces += 1;
    if (bounces > 3)
    {
        instance_destroy();
    }
}
