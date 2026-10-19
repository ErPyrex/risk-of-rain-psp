if (choice == 1)
{
    global.enemy_buff = 1;
    oInit.current_level = 0;
    oInit.player_number = oInit.player_max_chosen;
    room_goto(rStart);
    oInit.init = 0;
}
