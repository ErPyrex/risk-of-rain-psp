if (global.graphics >= 2)
{
    part_type_orientation(global.pEngiHarpoon, direction, direction, 0, 0, 0);
    part_particles_create(global.above, x, y, global.pEngiHarpoon, 1);
}
global.width = min(global.width + 0.1, 5);
if (instance_exists(target) == 1)
{
    if (global.graphics == 3)
    {
        part_particles_create(global.above, (x + xprevious) / 2, (y + yprevious) / 2, global.pEngiHarpoon, 1);
    }
    turn_towards(direction, point_direction(x, y, target.x, target.y));
    if (distance_to_object(target) < 40)
    {
        direction = point_direction(x, y, target.x, target.y);
    }
}
else if (alarm[2] == -1)
{
    alarm[2] = 1;
}
image_angle = direction;
if (alarm[1] != -1)
{
    image_alpha -= 0.1;
}
