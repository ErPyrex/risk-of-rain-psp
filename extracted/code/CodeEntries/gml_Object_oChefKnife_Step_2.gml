white_flash = max(0, white_flash - 0.1);
image_angle += 20;
if (rebound == 0)
{
    speed = max(0, speed - 0.2);
}
if ((speed == 0 || (get_collision(x, y) > 0 && !pass)) && rebound == 0)
{
    speed = 0;
    rebound = 1;
    white_flash = 1;
    id_count = -1;
    for (i = 0; i < 25; i += 1)
    {
        id_list[i] = -1;
    }
}
if (rebound == 1)
{
    direction = point_direction(x, y, parent.x, parent.y);
    speed = min(max_speed, speed + 0.2);
    if (place_meeting(x, y, parent) == 1)
    {
        parent.cleaver_count--;
        instance_destroy();
    }
}
