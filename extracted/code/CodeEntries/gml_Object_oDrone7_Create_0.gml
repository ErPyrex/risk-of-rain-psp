init_drone(0);
hp = 410 * power(global.enemy_buff, global.hp_co);
maxhp = 410 * power(global.enemy_buff, global.hp_co);
sprite_idle = 366;
sprite_idle_broken = 369;
sprite_shoot1 = 368;
sprite_shoot1_broken = 368;
with (instance_create(x, y, oEfFlash))
{
    parent = other.id;
    rate = 0.1;
}
caster_play(71, global.volume, 2);
xx = random_range(10, 40) * choose(1, -1);
yy = random(10) * choose(1, -1);
charge = 8;
alarm[0] = 20;
