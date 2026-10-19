if (!instance_exists(parent))
{
    instance_destroy();
}
else
{
    radius = cos(degtorad(angle - angle_offset)) * max_radius;
    angle += 3;
    image_angle = angle + 90;
    if (random(100) < (20 * (global.graphics - 1)))
    {
        part_type_orientation(global.pIce2, image_angle, image_angle, 0, 0, 0);
        part_particles_create(global.middle, x, y, global.pIce2, 1);
    }
    x = parent.x + lengthdir_x(radius, angle);
    y = parent.y + lengthdir_y(radius, angle);
}
