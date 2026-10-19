if (launching == 1)
{
    for (i = 1; i <= instance_number(oPrePlayer); i += 1)
    {
        oInit.player[i, 0] = oSelectMult.player[i, 0] + 1;
        oInit.player[i, 4] = oSelectMult.player[i, 4];
        oInit.player[i, 5] = oSelectMult.player[i, 5];
        oInit.player[i, 6] = oSelectMult.player[i, 6];
    }
    oInit.coop = 2;
    oInit.player_max_chosen = instance_number(oPrePlayer);
    global.artifact_elite = oInit.artifact_active[0];
    global.artifact_crew = oInit.artifact_active[1];
    global.artifact_lock = oInit.artifact_active[2];
    global.artifact_death = oInit.artifact_active[3];
    global.artifact_glass = oInit.artifact_active[4];
    global.artifact_use = oInit.artifact_active[5];
    global.artifact_loot = oInit.artifact_active[6];
    global.artifact_command = oInit.artifact_active[7];
    global.artifact_speed = oInit.artifact_active[8];
    global.artifact_imp = oInit.artifact_active[9];
    with (objServer)
    {
        ds_list_clear(players);
    }
    oInit.player_class = player[player_id, 0] + 1;
    oInit.current_level = oInit.starting_level;
    var str = "r" + string(oInit.starting_level) + "_" + string(irandom_range(1, oInit.level[oInit.starting_level, 0])) + "_" + string(irandom_range(1, oInit.level[oInit.starting_level, 1]));
    instance_create(0, 0, oDirectorControl);
    yoyo_room_switching_start();
}
