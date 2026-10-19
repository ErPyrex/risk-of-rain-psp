image_speed = 0.2;
move_contact_solid(270, -1);
image_xscale = choose(1, -1);
repeat (4)
{
    part_particles_create(global.below, x, y, global.pSpark, 1);
}
