init_default();
armor = 20;
state = "set up";
m_id = global.helper_index;
global.helper_index -= 1;
image_speed = 0.2;
move_contact_solid(270, -1);
alarm[2] = 1800;
image_xscale2 = 1;
image_speed2 = 0;
image_index2 = 0;
image_angle2 = 0;
head_active = 0;
head_rotate = 0;
free = 0;
activity = 0;
with (instance_create(x, y, oPOI))
{
    parent = other.id;
}
target = 0;
bullets = 2;
bullets_max = 3;
dot_immune = 60;
weather_immune = 60;
team = "player";
alarm[0] = 15;
invincible = 0;
caster_play(99, global.volume, 1.2);
scepter = 0;
knockback = -1;
