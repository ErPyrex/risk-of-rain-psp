part_type_direction(global.pOil, direction, direction, 0, 0);
part_particles_create(global.above, x, y, global.pOil, 1);
if (get_collision(x, y) > 0)
{
    instance_destroy();
}
