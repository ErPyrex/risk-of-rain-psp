text1 = "Artifact of Distortion";
text2 = "ARTIFACT UNLOCKED. Enable in character select!";
sound_played = 0;
f = 0;
pGravity = 0;
pVspeed = 0;
image_speed = 0;
yo = 0;
yy = 0;
used = 0;
alarm[0] = 60;
time = 1800;
icount = 120;
item_dibs = -1;
force_pickup = -1;
owner = -1;
m_id = global.treasure_index;
global.treasure_index += 1;
s = instance_create(x, y, oEfBullet2);
s.sprite_index = sEfRecall;
s.image_yscale = 1;
caster_play(157, global.volume, 1);
tier = "p";
if (oInit.coop == 2)
{
    server_message_send(0, 12, object_index, m_id, x, y);
}
