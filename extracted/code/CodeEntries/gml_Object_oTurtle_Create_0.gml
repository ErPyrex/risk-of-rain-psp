event_inherited();
force_death = 0;
init_boss();
elite = 0;
with (oLava)
{
    x += (width_b * 8);
}
lava_parent = instance_nearest(x, y, oLava);
if (global.host || oInit.coop != 2)
{
    x = lava_parent.x;
    y = lava_parent.y - 25;
}
with (oLava)
{
    x -= (width_b * 8);
}
image_speed = 0.2;
pHspeed = 2.5;
alarm[0] = 5;
with (instance_create(x, y, oTurtleShell))
{
    parent = other.id;
}
name = "Cremator";
name2 = "Shielded Artillery";
damage = 12 * power(global.enemy_buff, global.damage_co);
critical_chance = 0;
critical_chance_bonus = 0;
team = "enemy";
hp = 1150 * power(global.enemy_buff, global.hp_co);
maxhp = 1150 * power(global.enemy_buff, global.hp_co);
lastHp = 1150 * power(global.enemy_buff, global.hp_co);
dot_immune = 5;
weather_immune = 5;
exp_worth = 90 * global.enemy_buff;
invincible = 0;
sprite_idle = sprite_index;
sprite_index2 = 631;
image_index2 = 0;
image_speed2 = 0;
alarm[1] = 1;
alarm[2] = 1;
ghost = 0;
max_bullets = 12;
bullets_cooldown = 240;
if (global.host)
{
    m_id = set_m_id(id);
}
t = instance_create(x, y, oEfFlash);
t.parent = id;
t.image_blend = #F1E878;
