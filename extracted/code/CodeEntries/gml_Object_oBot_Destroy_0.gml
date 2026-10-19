if (global.graphics == 3)
{
    repeat (random_range(2, 4))
    {
        t = random(360);
        part_type_direction(global.pBlood1, t - 10, t + 10, 0.1, 0);
        part_particles_create_color(global.above, x, y, global.pBlood1, 6710991, 8);
    }
}
