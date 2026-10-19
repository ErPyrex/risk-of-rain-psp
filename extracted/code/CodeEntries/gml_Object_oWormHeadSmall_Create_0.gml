event_inherited();
buff_count = 0;
pVspeed = 0;
armor = -1;
bunker = -1;
state = -1;
reflecting = -1;
invincible = 0;
image_speed = 0.3;
speed = 8;
direction = 60 + random(10);
gravity = 0;
body[0] = id;
name = "Baby Magma Worm";
for (i = 1; i <= 12; i += 1)
{
    s = instance_create(x - lengthdir_x(i * 20, direction), y - lengthdir_y(i * 20, direction), oWormBody);
    s.head = id;
    body[i] = s;
    s.parent = body[i - 1];
    s.image_yscale = (1 - (i / 17)) * choose(1, -1) * 0.7;
    s.image_index = random(3);
}
exp_worth = 40;
elite = 0;
dead = 0;
angle_rate = 0;
hp = 400;
team = "enemy";
critical_chance = 0;
critical_chance_bonus = 0;
sprite_idle = sprite_index;
dot_immune = 50;
weather_immune = 0;
f = 0;
yy = 0;
speedx = 0;
speedy = 0;
burn_loop = caster_loop(168, global.volume, 1);
