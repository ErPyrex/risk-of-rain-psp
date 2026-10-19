if (random(100) < 10)
{
    part_particles_create(global.below, (x - 20) + random(40), (y - 20) + random(40), global.pSmoke, 1);
}
if (random(100) < 5)
{
    part_particles_create(global.above, (x - 20) + random(40), (y - 20) + random(40), global.pSmoke2, 1);
}
