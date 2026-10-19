if (alarm[0] != -1)
{
    repeat (3)
    {
        v = random(point_distance(x, y, xx, yy));
        d = point_direction(x, y, xx, yy);
        part_particles_create(global.above, ((x + lengthdir_x(v, d)) - 2) + random(3), ((y + lengthdir_y(v, d)) - 2) + random(3), global.pPoison, 1);
    }
    draw_set_alpha(0.1);
    draw_line_color(x, y, xx, yy, c_white, c_yellow);
    draw_set_alpha(1);
    if (random(100) < 10)
    {
        part_particles_create(global.above, (xx - 2) + random(3), (yy - 2) + random(3), global.pPoison, 1);
    }
}
else
{
    draw_sprite(sprite_index, -1, x, y);
}
