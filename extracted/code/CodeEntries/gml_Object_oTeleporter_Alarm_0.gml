with (oEfPlayerDead)
{
    instance_destroy();
}
var last_level;
if (oInit.coop == 2)
{
    last_level = oInit.last_level_online;
}
else
{
    last_level = oInit.last_level;
}
if (active == 5)
{
    oInit.current_level += 1;
    if (oInit.current_level > last_level)
    {
        oInit.current_level = oInit.starting_level;
    }
    oInit.player_number = oInit.player_max_chosen;
    var str = "r" + string(oInit.starting_level) + "_" + string(irandom_range(1, oInit.level[oInit.starting_level, 0])) + "_" + string(irandom_range(1, oInit.level[oInit.starting_level, 1]));
    if (room != rPigbeach)
    {
        yoyo_room_switching_teleporter();
    }
    else
    {
        room_goto(r3_1_1);
    }
}
else
{
    oInit.player_number = oInit.player_max_chosen;
    room_goto(r6_1_1);
}
