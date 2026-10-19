elite_tier = -1;
blast = -1;
buff_count = 0;
team = "noteam";
pVspeed = 0;
armor = -1;
bunker = -1;
state = -1;
reflecting = -1;
last_hit = -1;
last_hit_name = -1;
last_hit_number = 0;
global.director.drone_count = max(global.director.drone_count, instance_number(pDrone));
yo = 0;
ff = 0;
dot_immune = 60;
weather_immune = 60;
team = "player";
target = instance_nearest(x, y, pEnemy);
value = 30;
master = instance_nearest(x, y, oP);
if (!argument0)
{
    if (oInit.coop != 2 || master == global.my_player)
    {
        achievement_progress(23, 1);
    }
}
damage = 1;
image_speed = 0.3;
state = "idle";
init_default();
hp_regen = 0.05;
critical_chance = 0;
critical_chance_bonus = 0;
name = "Drone";
missile = 0;
mortar = 0;
with (instance_create(x, y, oEfFlash))
{
    parent = other.id;
    rate = 0.1;
}
y_range = 80;
x_range = 200;
force_death = 0;
m_id = -1;
if (hosting() && !argument0)
{
    m_id = set_m_id(id);
    server_message_send(0, 31, object_index, m_id, x, y, master.m_id);
}
