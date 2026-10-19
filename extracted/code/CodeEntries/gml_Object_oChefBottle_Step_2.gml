image_angle += 8;
if (place_meeting(x, y, pBlock) == 1)
{
    move_bounce_solid(1);
    vspeed = min(vspeed * 0.3, -1);
    x = xprevious;
    y = yprevious;
    bounces += 1;
    if (bounces > 3)
    {
        instance_destroy();
    }
}
