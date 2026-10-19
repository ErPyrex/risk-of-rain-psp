if (active == 1)
{
    cost = 0;
    if (alarm[1] == -1 && not_client())
    {
        alarm[1] = 240;
    }
    if (alarm[0] == -1)
    {
        alarm[0] = countdown;
        countdown = max(countdown - 3, 15);
    }
    if (item_id == -1)
    {
        alarm[0] = 1;
    }
}
if (active == 2)
{
    if (hosting())
    {
        server_message_send(0, 19, 0, -1, 0, 0, object_index, m_id, active, 1);
    }
    active = 3;
    sprite_index = sChest4Open;
    image_index = 0;
    image_speed = 0.2;
    alarm[0] = -1;
    alarm[1] = -1;
    caster_play(44, global.volume, 1);
}
ff += 0.05;
yo = sin(ff);
