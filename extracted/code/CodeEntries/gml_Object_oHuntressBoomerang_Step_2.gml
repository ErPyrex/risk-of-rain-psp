if (global.graphics >= 2)
{
    part_type_orientation(global.pHuntressBolt2, direction, direction, 0, 0, 0);
    part_particles_create(global.above, x, y, global.pHuntressBolt2, 1);
}
image_angle += 30;
if (instance_exists(target) && hit_count != 0 && alarm[0] == -1)
{
    direction = point_direction(x, y, target.x, target.y + yoff);
}
ff += 0.2;
if (hit_count >= 4)
{
    instance_destroy();
}
