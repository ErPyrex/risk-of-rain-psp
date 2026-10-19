if (global.graphics >= 2)
{
    part_particles_create_color(global.above, (x - 1) + random(2), (y - 1) + random(2), global.pPoison, 8388736, 1);
}
global.width = min(global.width + 0.1, 5);
if (instance_exists(target) && target != -1)
{
    if (global.graphics == 3)
    {
        part_particles_create_color(global.above, (((x + xprevious) / 2) - 1) + random(2), (((y + yprevious) / 2) - 1) + random(2), global.pPoison, 8388736, 1);
    }
    speed = min(4, speed + 0.5);
    turn_towards(direction, point_direction(x, y, target.x, target.y));
    if (distance_to_object(target) < 40)
    {
        direction = point_direction(x, y, target.x, target.y);
    }
}
else
{
    if (alarm[2] == -1 && alarm[1] == -1)
    {
        alarm[2] = 1;
    }
    turn_towards(direction, direction + 5);
    f += 0.2;
    yy = cos(f) * 3;
    direction += yy;
}
image_angle = direction;
if (alarm[1] != -1)
{
    image_alpha -= 0.1;
}
