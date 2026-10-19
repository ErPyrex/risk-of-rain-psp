repeat (4 * max(logn(2, value + 1), 1))
{
    s = instance_create(x, y, oEfGold);
    s.direction = 180 - random(180);
    s.speed = random_range(2, 6);
}
oHUD.alarm[0] = 5;
caster_play(123, global.volume, 2);
caster_play(56, global.volume, 2);
damage = value;
critical = 0;
critical_chance = 0;
fire_explosion(3, x, y, 1, 292, 1, 877, 2.5, 3);
