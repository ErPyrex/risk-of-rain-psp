if ((place_meeting(x, y, oExplosion) || place_meeting(x, y, oEngiGrenade) || place_meeting(x, y, oHuntressBolt1)) && activated == 0)
{
    active = 1;
}
if (active == 1)
{
    caster_play(132, global.volume * 0.8, 2);
    active = 0;
    activated = 1;
    image_index = 1;
    image_speed = 0;
    alarm[0] = timer_length;
}
if ((activated > last_activated || force_activated) && oInit.coop == 2)
{
    if (!force_activated)
    {
        client_message_send(47, x, y);
    }
    server_message_send(0, 47, x, y);
    force_activated = 0;
}
