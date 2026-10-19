image_angle = direction;
if (global.graphics >= 2)
{
    if (room == r3_1_1 || room == r3_1_2)
    {
        part_particles_create(global.above, x, y, global.pFireIce, 1);
    }
    else
    {
        part_particles_create(global.above, x, y, global.pFire2, 1);
    }
}
if (place_meeting(x, y, pBlock) == 1)
{
    instance_destroy();
}
