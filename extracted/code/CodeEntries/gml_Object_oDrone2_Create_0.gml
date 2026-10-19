init_drone(0);
with (instance_create(x, y, oEfFlash))
{
    parent = other.id;
    rate = 0.1;
}
caster_play(71, global.volume, 1.2);
hp = 250 * power(global.enemy_buff, global.hp_co);
maxhp = 250 * power(global.enemy_buff, global.hp_co);
xx = random(30) * choose(1, -1);
yy = -random(20);
sprite_idle = 315;
sprite_idle_broken = 316;
sprite_shoot1 = 317;
sprite_shoot1_broken = 318;
knockback = -1;
