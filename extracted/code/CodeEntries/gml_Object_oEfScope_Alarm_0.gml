alarm[1] = 50;
if (instance_exists(target) == 1)
{
    caster_play(149, global.volume, 1 + random(0.1));
    oHUD.alarm[0] = 15;
    ydisp = -25;
    part_particles_create(global.above, x, y, global.pSpark, global.graphics * 5);
    s = instance_create(x, y, oEfDamage);
    s.team = "";
    s.textColor = 5277950;
    s.damage = irandom_range(1000000, 2000000);
    s.critical = 0;
    target.hp = 0;
}
