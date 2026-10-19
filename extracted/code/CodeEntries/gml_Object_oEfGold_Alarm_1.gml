if (instance_exists(target))
{
    direction = point_direction(x, y, target.x, target.y + yo);
    sspeed = min(sspeed + 0.5, 10);
    vsspeed = lengthdir_y(sspeed, direction);
    hsspeed = lengthdir_x(sspeed, direction);
    alarm[1] = 5;
}
