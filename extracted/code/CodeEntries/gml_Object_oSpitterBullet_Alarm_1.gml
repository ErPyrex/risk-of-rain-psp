s = collision_line_advanced(xstart, ystart, x + lengthdir_x(400, direction), y + lengthdir_y(speed + 400, direction), 43, 0, 0);
if (s > 0)
{
    xx = global.collision_x;
    yy = global.collision_y;
}
else
{
    xx = x + lengthdir_x(400, direction);
    yy = y + lengthdir_y(400, direction);
}
