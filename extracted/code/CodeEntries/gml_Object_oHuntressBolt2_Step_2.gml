part_particles_create(global.below, x, y, global.pHuntressBolt1, 1);
if (instance_exists(parent) == 0 || place_meeting(x, y, pBlock) == 1)
{
    target = id;
    instance_destroy();
}
image_angle = direction;
