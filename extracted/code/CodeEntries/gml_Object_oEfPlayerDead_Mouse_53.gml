if ((oInit.coop == 2 && !global.host) || post_game != 1)
{
    exit;
}
if (choice == 1)
{
    global.enemy_buff = 1;
    oInit.current_level = 1;
    if (oInit.coop == 2 && global.host)
    {
        transport(40, 0, 0, 0, 0, 0);
        server_message_send(0, 18, 0, objServer.m_id, 40, 0, 0, 0, 0, 0);
    }
    else
    {
        str = "r" + string(oInit.starting_level) + "_" + string(irandom_range(1, oInit.level[oInit.starting_level, 0])) + "_" + string(irandom_range(1, oInit.level[oInit.starting_level, 1]));
        yoyo_room_switching_start();
        oHUD.health_color[0] = 6804360;
        oHUD.health_color[1] = 6804360;
        oHUD.health_color[2] = 6804360;
        oHUD.health_color[3] = 6804360;
    }
}
if (choice == 2)
{
    global.enemy_buff = 1;
    oInit.current_level = 0;
    oInit.player_number = oInit.player_max_chosen;
    room_goto(rStart);
    oInit.init = 0;
}
