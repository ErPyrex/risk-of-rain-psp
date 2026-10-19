if (random(100) < 30 && broken == 0)
{
    part_particles_create(global.below, x, y, global.pSpark, 5);
    broken = 1;
    alarm[0] = random_range(30, 120);
    image_index = random_range(10, 12);
    oHUD.alarm[0] = 2;
}
