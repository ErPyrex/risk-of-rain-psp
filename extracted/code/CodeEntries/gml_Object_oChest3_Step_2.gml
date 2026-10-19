if (active == 1)
{
    sprite_index = sChest3Open;
    image_index = 0;
    if (sprite_id != -1)
    {
        caster_play(43, global.volume, 1);
    }
    active = 2;
    image_speed = 0.2;
    oHUD.alarm[0] = 1;
    alarm[0] = 20;
    if (item_id != -1)
    {
        if (oInit.coop == 2)
        {
            server_message_send(0, 21, -1, m_id, item_id);
        }
        for (i = 0; i <= 1; i += 1)
        {
            spawn[i].active = 1;
            spawn[i].item_id = -1;
            spawn[i].sprite_id = -1;
            if (oInit.coop == 2)
            {
                with (spawn[i])
                {
                    server_message_send(0, 21, -1, m_id, item_id);
                }
            }
        }
    }
}
ff += 0.05;
yo = sin(ff);
