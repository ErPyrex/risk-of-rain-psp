event_inherited();
init_boss();
m_id = set_m_id(id);
force_death = 0;
force_speedup = 0;
invincible = 0;
image_speed = 0.2;
direction = random(360);
max_speed = 0.9;
bullets = 3;
max_bullets = 3;
alarm[3] = 300;
image_xscale = 0.7;
image_yscale = 0.7;
name = "Young Vagrant";
damage = 4 * power(global.enemy_buff, global.damage_co);
critical_chance = 0;
critical_chance_bonus = 0;
team = "enemy";
hp = 700 * power(global.enemy_buff, global.hp_co);
maxhp = 700 * power(global.enemy_buff, global.hp_co);
lastHp = 700 * power(global.enemy_buff, global.hp_co);
alarm[0] = 1;
dot_immune = 5;
weather_immune = 5;
exp_worth = 50 * global.enemy_buff;
sprite_idle = sprite_index;
target = instance_nearest(x, y, oPOI);
hit = 0;
xx = 0;
yy = 0;
sprite_palette = 520;
elite = 0;
attack_speed = 1;
lightning = 0;
ghost = 0;
if (global.graphics >= 2)
{
    has_leg = 1;
    leg[0, 0] = id;
    for (i = 1; i <= 2; i += 1)
    {
        leg[0, i] = instance_create(x, y + 15, oJellyLegs);
        leg[0, i].parent = leg[0, i - 1];
        if (i == 2)
        {
            leg[0, i].tip = 1;
        }
    }
    leg[0, 1].offset = 4;
    leg[0, 1].ff = 1;
    leg[1, 0] = id;
    for (i = 1; i <= 2; i += 1)
    {
        leg[1, i] = instance_create(x, y + 15, oJellyLegs);
        leg[1, i].parent = leg[1, i - 1];
        if (i == 2)
        {
            leg[1, i].tip = 1;
        }
    }
    leg[1, 1].offset = -4;
    leg[1, 1].ff = -1;
}
else
{
    has_leg = 0;
}
