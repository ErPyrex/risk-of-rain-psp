s = instance_create(x, y, oEfExp);
s.speed = random(4);
s.direction = random(360);
s.value = value;
s = instance_create(x, y, oEfGold);
s.direction = 180 - random(180);
s.speed = random_range(1, 3);
s.value = value;
if (oP.hp != oP.maxhp)
{
    s = instance_create(x, y, oEfHeal2);
    s.value = ceil(oP.maxhp * 0.07);
}
part_particles_create_color(global.below, x, y, global.pHeal, 65535, 10);
