event_inherited();
dead = 0;
type = 2;
image_speed = 0.2;
body_distance = 33;
body_count = 16;
body[0] = id;
if (type == 1)
{
    sprite_index = sWurm1Head;
}
else
{
    sprite_index = sWurm2Head;
}
ff = 0;
dashing = 0;
shooting = 0;
elite = 0;
shooting_variable = 0;
targetx = x;
targety = y;
target = -10;
drawx = -1;
drawy = -1;
cooldown = 90;
hp = 3000 * power(global.enemy_buff, global.hp_co);
maxhp = 3000 * power(global.enemy_buff, global.hp_co);
lastHp = 0;
for (i = 1; i <= body_count; i += 1)
{
    s = instance_create(x - lengthdir_x(i * body_distance, direction), y - lengthdir_y(i * body_distance, direction), oWurmBody);
    s.head = id;
    s.hp = hp;
    s.maxHp = hp;
    body[i] = s;
    s.parent = body[i - 1];
    s.image_yscale = 1;
    if (i == 1)
    {
        s.image_index = 1;
    }
    else if (i == (body_count - 1))
    {
        s.image_index = 3;
    }
    else
    {
        s.image_index = irandom_range(0, 2);
    }
    if (type == 1)
    {
        s.m_id = 9501 + i;
    }
    else
    {
        s.m_id = 9301;
    }
}
alarm[0] = 60;
init_boss();
damage = 12 * power(global.enemy_buff, global.damage_co);
critical_chance = 0;
critical_chance_bonus = 0;
invincible = 0;
team = "enemy";
sprite_idle = sprite_index;
speedx = 0;
speedy = 0;
f = 0;
dot_immune = 50;
weather_immune = 0;
dead = 0;
ghost = 0;
exp_worth = 2;
armor = 0;
sprite_idle = sprite_index;
if (type == 1)
{
    name = "Gilded Wurm";
    name2 = "Right Hand of Providence";
}
else
{
    name = "Ornate Wurm";
    name2 = "Left Hand of Providence";
}
last_target = -5;
force_death = 0;
knockback = -1;
