s = instance_create(x, y, oEfHeal2);
s.value = ceil(oP.maxhp * 0.2);
if (random(100) <= 13 && (oInit.coop != 2 || global.host))
{
    instance_create(x, y, choose(oMedkit, oBattery, oSyringe, oPills));
}
part_particles_create_color(global.below, x, y, global.pHeal, 65535, 10);
