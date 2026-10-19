if (instance_exists(target) == 1)
{
    turn_towards(direction, point_direction(x, y, target.x, target.y));
}
else
{
    target = instance_nearest(x, y, pEnemy);
}
part_particles_create_color(global.below, x, y, global.pSpark, 15650222, 2);
