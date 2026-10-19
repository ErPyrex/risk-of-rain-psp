image_angle += 2;
if (particle_color != -1)
{
    part_particles_create_color(global.above, x, y, particle_type, particle_color, particle_number);
}
else
{
    part_particles_create(global.above, x, y, particle_type, particle_number);
}
if (place_meeting(x, y, pBlock) == 1)
{
    if (bounce == 1)
    {
        move_bounce_solid(1);
        vspeed *= 0.7;
        hspeed *= 0.9;
        bounces += 1;
        if (bounces > bounce_max)
        {
            instance_destroy();
        }
    }
    else
    {
        instance_destroy();
    }
}
