caster_play(149, global.volume, 1 + random(0.1));
oHUD.alarm[0] = 15;
with (oBoss1)
{
    part_particles_create(global.above, x, y, global.pSpark, global.graphics * 5);
    s = instance_create(x, y, oEfDamage);
    s.team = "";
    s.textColor = 5277950;
    s.damage = ceil(maxhp * 0.12);
    s.critical = 1;
    hp -= (maxhp * 0.12);
}
with (oBoss2Clone)
{
    part_particles_create(global.above, x, y, global.pSpark, global.graphics * 5);
    s = instance_create(x, y, oEfDamage);
    s.team = "";
    s.textColor = 5277950;
    s.damage = ceil(maxhp * 0.12);
    s.critical = 1;
    hp -= (maxhp * 0.12);
}
with (oWurmHead)
{
    part_particles_create(global.above, x, y, global.pSpark, global.graphics * 5);
    s = instance_create(x, y, oEfDamage);
    s.team = "";
    s.textColor = 5277950;
    s.damage = ceil(maxhp * 0.06);
    s.critical = 1;
    hp -= (maxhp * 0.06);
}
with (oBoss3)
{
    part_particles_create(global.above, x, y, global.pSpark, global.graphics * 5);
    s = instance_create(x, y, oEfDamage);
    s.team = "";
    s.textColor = 5277950;
    s.damage = ceil(maxhp * 0.06);
    s.critical = 1;
    hp -= (maxhp * 0.06);
}
caster_play(39, global.volume, random_range(1, 1.4));
