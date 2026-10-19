if (rebound == 0)
{
    speed = max(0, speed - 0.1);
}
if (speed == 0 && rebound == 0)
{
    damage = true_damage;
    rebound = 1;
    id_count = -1;
    for (i = 0; i < 25; i += 1)
    {
        id_list[i] = -1;
    }
}
if (rebound == 1)
{
    direction = point_direction(x, y, parent.x, parent.y);
    speed = min(8, speed + 0.1);
    if (place_meeting(x, y, parent) == 1)
    {
        instance_destroy();
    }
}
