repeat (14)
{
    part_particles_create(global.above, (x - 3) + random(6), (y - 3) + random(6), global.pSmoke2, 1);
}
image_angle = 215 + random(20);
speed = 0.3;
alarm[0] = 8;
alarm[1] = 60;
beep_count = 3;
beep = 0;
