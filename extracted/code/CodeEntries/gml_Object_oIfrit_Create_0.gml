event_inherited();
image_speed = 0.3;
init_ifrit();
init_boss();
if (oInit.coop != 2 || global.host)
{
    s = instance_nearest(x, y, oBossSpawn2);
    x = s.x + 150;
    y = (s.y + sprite_yoffset) - sprite_height;
}
elite = 0;
alarm[0] = 30;
alarm[1] = 2;
foot = 1;
name = "Ifrit";
name2 = "Scion of the Infernal King";
init_ai_default();
state = "chase";
z_range = 70;
z_skill = 0;
x_range = 500;
x_skill = 0;
t = instance_create(x, y, oEfFlash);
t.parent = id;
t.image_blend = c_white;
t.rate = 0.1;
m_id = set_m_id(id);
