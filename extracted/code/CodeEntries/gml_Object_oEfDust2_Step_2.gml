if (random(100) < 5 && inside_view(x, y) == 1 && global.graphics >= 3)
{
    part_particles_create(global.above, (x - 100) + random(200), y, global.pDust2, 1);
}
