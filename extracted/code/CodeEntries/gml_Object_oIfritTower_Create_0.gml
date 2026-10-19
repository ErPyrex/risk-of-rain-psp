active = 0;
image_speed = 0.25;
oHUD.alarm[0] = 15;
move_contact_solid(270, -1);
alarm[0] = 420;
caster_play(170, global.volume, 1.2);
if (oInit.coop == 2)
{
    server_message_send(0, 12, object_index, 0, x, y);
}
alarm[1] = 1;
