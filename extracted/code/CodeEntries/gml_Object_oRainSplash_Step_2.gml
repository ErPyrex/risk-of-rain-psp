exit;
if (raining && global.graphics >= 2)
{
    repeat ((ceil(width_box / 2) / 3) * global.graphics)
    {
        part_particles_create(global.above, x + 2 + random((width_box * 16) - 4), y + 16, global.pRainSplash, 1);
    }
}
