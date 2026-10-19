if (global.graphics >= 2)
{
    part_type_orientation(global.pHarpoonEnemy, direction, direction, 0, 0, 0);
    part_particles_create(global.above, x, y, global.pHarpoonEnemy, 1);
}
global.width = min(global.width + 0.1, 5);
if (global.graphics == 3)
{
    part_particles_create(global.above, (x + xprevious) / 2, (y + yprevious) / 2, global.pHarpoonEnemy, 1);
}
if (alarm[2] == -1)
{
    direction = point_direction(x, y, target_x, target_y);
    if (point_distance(x, y, target_x, target_y) < 10)
    {
        instance_destroy();
    }
}
image_angle = direction;
if (alarm[1] != -1)
{
    image_alpha -= 0.1;
}
