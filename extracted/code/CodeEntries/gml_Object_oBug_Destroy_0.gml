npc_death(1, 0);
caster_play(62, global.volume, 1.5);
if (global.graphics == 3)
{
    repeat (3)
    {
        instance_create((x - 2) + random(4), y, oBugGuts);
    }
    repeat (random_range(2, 4))
    {
        t = random(360);
        part_type_direction(global.pBlood1, t - 10, t + 10, 0.1, 0);
        part_particles_create_color(global.above, x, y, global.pBlood1, 8828542, 8);
    }
}
