if (global.graphics > 1)
{
    part_particles_create(global.below, x, y, global.pHuntressBolt1, 1);
}
if (instance_exists(parent) == 0 || get_collision(x, y) > 0)
{
    instance_destroy();
}
image_angle = direction;
