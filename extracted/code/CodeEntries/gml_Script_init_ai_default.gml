buff_count = 0;
pVspeed = 0;
armor = -1;
bunker = -1;
state = "idle";
reflecting = -1;
force_death = 0;
sync = 0;
ghost_x = x;
ghost_y = y;
pVspeed = 0;
m_id = -1;
force_knockback = 0;
state = "idle";
target = -5;
death_timer = 3600;
make_sound = 1;
elite = 0;
elite_tier = 0;
blast = -1;
can_jump = 0;
point_value = 0;
x_range = 0;
c_range = 0;
v_range = 0;
for (i = 0; i <= 3; i += 1)
{
    froze[i, 0] = -1;
    froze[i, 1] = -1;
    froze[i, 2] = -1;
}
deactivated = 0;
deactivated_time = 0;
hit_pitch = 1;
