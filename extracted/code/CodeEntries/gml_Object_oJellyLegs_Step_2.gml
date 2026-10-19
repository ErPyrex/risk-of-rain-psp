if (offset != 0 && global.time_stop == 0)
{
    yo += 0.05;
}
if (ff == 0 && global.time_stop == 0)
{
    turn_towards(direction, parent.direction);
}
else
{
    direction = point_direction(x, y, parent.x, parent.y);
}
image_angle = direction;
x = parent.x - lengthdir_x(31, image_angle) - lengthdir_x(offset * sin(yo), parent.image_angle + 180);
y = parent.y - lengthdir_y(31, image_angle) - lengthdir_y(offset * sin(yo), parent.image_angle + 180);
if (image_blend == c_red && tip == 1 && global.graphics == 3)
{
    part_particles_create(global.above, x + random_range(-2, 2), y + random_range(-2, 2), global.pSmoke, 1);
}
