var tepic = argument5;
var tio = 15;
if (argument0 == 40)
{
    with (objServer)
    {
        ds_list_clear(players);
    }
    oInit.current_level = 1;
    for (i = 0; i < instance_number(oP); i += 1)
    {
        var tpp = instance_create(0, 0, oPrePlayer);
        tpp.class = instance_find(oP, i).class - 1;
        tpp.sock = instance_find(oP, i).sock;
        tpp.m_id = instance_find(oP, i).m_id;
        tpp.user_name = instance_find(oP, i).user_name;
        if (instance_find(oP, i) == global.my_player)
        {
            global.my_player = tpp;
        }
        else if (global.host)
        {
            ds_list_add(objServer.players, tpp);
        }
    }
}
else
{
    var td;
    if (room == rSelectMult)
    {
        tio = 480;
        for (i = 1; i <= instance_number(oPrePlayer); i += 1)
        {
            oInit.player[i, 0] = oSelectMult.player[i, 0] + 1;
            oInit.player[i, 4] = oSelectMult.player[i, 4];
            oInit.player[i, 5] = oSelectMult.player[i, 5];
            oInit.player[i, 6] = oSelectMult.player[i, 6];
        }
        oInit.coop = 2;
        oInit.player_max_chosen = instance_number(oPrePlayer);
        oInit.player_class = oSelectMult.player[oSelectMult.player_id, 0] + 1;
        oInit.current_level = oInit.starting_level;
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
        td = instance_create(0, 0, oDirectorControl);
    }
    else
    {
        td = global.director;
    }
    td.player_x = argument1;
    td.player_y = argument2;
    td.teleporter_x = argument3;
    td.teleporter_y = argument4;
    td.epic_teleporter = tepic;
}
room_goto(argument0);
