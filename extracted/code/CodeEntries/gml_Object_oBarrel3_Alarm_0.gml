part_particles_create_color(global.below, x, y, global.pHeal, 65535, 10);
if (global.director.keycard_dropped < 4 && (oInit.coop != 2 || global.host))
{
    instance_create(x, y - 15, oKeycard);
}
