event_inherited();
init_boss();
name = "Magma Worm";
name2 = "Ancient Lava Swimmer";
alarm[2] = 1;
m_id = set_m_id(id);
client_mid = -1;
f = 0;
invincible = 1;
head = -10;
s = -1;
if (oInit.coop != 2 || global.host)
{
    alarm[0] = 45;
}
hp = 1400 * power(global.enemy_buff, global.hp_co);
maxhp = 1400 * power(global.enemy_buff, global.hp_co);
wormCount = 22 + irandom(4);
target = instance_find(oPOI, irandom(instance_number(oPOI) - 1));
team = "enemy";
max_speed = 1;
damage = 23 * power(global.enemy_buff, global.damage_co);
alarm[1] = 1;
elite = 0;
ghost = 0;
worm_speed = 8;
worm_gravity = 0.1;
force_death = 0;
armor = 0;
sprite_idle = 492;
