if (oInit.coop != 2 || global.host)
{
    var t = random(100);
    if (t <= 5)
    {
        instance_create(x, y - 15, choose(oMissileTri, oRepulsion, oPlasma));
    }
    else if (t <= 30)
    {
        instance_create(x, y - 15, choose(oCell, oMissile));
    }
    else if (t <= 60)
    {
        instance_create(x, y - 15, choose(oGlasses, oMortar, oMissileBox, oMinefield));
    }
}
oP.opened_chests += 1;
part_particles_create_color(global.below, x, y, global.pHeal, 65535, 30);
