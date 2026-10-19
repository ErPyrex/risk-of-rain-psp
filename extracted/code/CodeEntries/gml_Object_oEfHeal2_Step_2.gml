if (random(100) < 20 && global.graphics == 3)
{
    part_particles_create(global.below, x, y, global.pHeal, 1);
}
if (used == 0)
{
    if (instance_exists(target))
    {
        if (alarm[0] == -1)
        {
            speed = min(speed + 0.1, 8);
            turn_towards(direction, point_direction(x, y, target.x, target.y));
            if (distance_to_object(target) < 40)
            {
                direction = point_direction(x, y, target.x, target.y);
            }
        }
        else
        {
            speed = max(speed - 0.1, 0);
        }
    }
}
else
{
    speed = 0;
}
