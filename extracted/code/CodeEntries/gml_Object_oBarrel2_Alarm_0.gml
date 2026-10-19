drop_item(0.3);
repeat (value)
{
    s = instance_create(x, y, oEfExp);
    s.speed = random(4);
    s.direction = random(360);
    s.sprite_index = sEfExp2;
    s.value = 5;
    s = instance_create(x, y - 10, oEfGold);
    s.direction = 180 - random(180);
    s.vsspeed = lengthdir_y(random_range(1, 3), direction);
    s.hsspeed = lengthdir_x(random_range(1, 3), direction);
    s.sprite_index = sEfGold2;
    s.value = 3;
}
if (oP.hp != oP.maxhp)
{
    s = instance_create(x, y, oEfHeal2);
    s.value = ceil(oP.maxhp * 0.07);
}
part_particles_create_color(global.below, x, y, global.pHeal, 65535, 10);
