if (random(100) < 5 && alarm[0] != -1 && broken == 1)
{
    part_particles_create(global.below, x, y, global.pSpark, 1);
    part_particles_create(global.above, (x - 4) + random(8), (y - 4) + random(8), global.pSmoke, 1);
}
