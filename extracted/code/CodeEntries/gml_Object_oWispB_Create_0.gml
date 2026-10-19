event_inherited();
init_wispB();
init_boss();
elite = 0;
alarm[1] = 2;
max_bullets = 4;
with (oP)
{
    if (class == 4)
    {
        last_hit_number = 0;
    }
}
init_ai_default();
z_range = 260;
if (oInit.coop != 2 || global.host)
{
    s = instance_nearest(x, y, oBossSpawn);
    x = s.x + 100;
    y = (s.y + sprite_yoffset) - sprite_height;
}
m_id = set_m_id(id);
