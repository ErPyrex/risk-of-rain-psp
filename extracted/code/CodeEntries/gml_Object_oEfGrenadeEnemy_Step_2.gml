image_angle += 3;
if (place_meeting(x, y, pBlock) == 1)
{
    move_bounce_solid(1);
    vspeed *= 0.7;
    hspeed *= 0.9;
    bounces += 1;
    if (bounces > 2)
    {
        instance_destroy();
    }
}
