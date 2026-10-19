alarm[1] = 5;
if (used == 0)
{
    if (instance_exists(target) == 0)
    {
        target = instance_find(oP, irandom(instance_number(oP) - 1));
    }
    if (instance_exists(target))
    {
        if (alarm[0] == -1)
        {
            var td = point_direction(x, y, target.x, target.y);
            var tdis = point_distance(x, y, target.x, target.y);
            speed = min(speed + 0.5, 8);
            direction = turn_towards_advanced(direction, td, 5);
            if (tdis < 40)
            {
                direction = td;
            }
        }
        else
        {
            speed = max(0, speed - 1);
        }
    }
}
else
{
    speed = 0;
}
