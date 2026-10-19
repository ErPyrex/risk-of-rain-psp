if (scepter == 0)
{
    if (global.graphics == 3)
    {
        part_particles_create(global.middle, (x + xprevious) / 2, (y + yprevious) / 2, global.pSmoke4, 1);
    }
    part_particles_create(global.middle, x, y, global.pSmoke4, 1);
}
else
{
    if (global.graphics == 3)
    {
        part_particles_create(global.middle, (x + xprevious) / 2, (y + yprevious) / 2, global.pSmoke5, 1);
    }
    part_particles_create(global.middle, x, y, global.pSmoke5, 1);
}
angle = direction;
if (place_meeting(x, y + vspeed, pBlock) == 1)
{
    var old_dir = direction;
    move_bounce_solid(1);
    if (abs(((((direction - old_dir) % 360) + 540) % 360) - 180) > 25)
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
