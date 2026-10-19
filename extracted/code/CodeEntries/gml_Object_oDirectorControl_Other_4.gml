keycard_dropped = 0;
stages_passed += 1;
alarm[0] = 60;
alarm[11] = 3;
oInit.player_number = oInit.player_max_chosen;
if (init == 0)
{
    if (oInit.achievement[35, 0] == 2)
    {
        item_tier3[20, 1] = 1;
    }
    else
    {
        item_tier3[20, 1] = 0;
    }
    stages_passed = 0;
    instance_create(0, 0, oHUD);
    if (oInit.coop == 0)
    {
        with (instance_create(0, 0, oP))
        {
            init_class(oInit.player_class);
            coop = 0;
            player_id = 1;
            oInit.player[1, 2] = oP.id;
        }
    }
    else
    {
        for (i = 1; i <= oInit.player_max_chosen; i += 1)
        {
            s = instance_create(0, 0, oP);
            if (oInit.coop == 2)
            {
                s.sock = oInit.player[i, 4];
                s.m_id = oInit.player[i, 5];
                s.user_name = oInit.player[i, 6];
                if (i == 1)
                {
                    global.my_player = s;
                }
                else if (global.host)
                {
                    ds_list_add(objServer.players, s);
                }
            }
            with (s)
            {
                init_class(oInit.player[other.i, 0]);
                coop = 1;
                player_id = other.i;
            }
            oInit.player[i, 2] = s.id;
        }
    }
    init = 1;
}
if (oInit.coop != 0 && players_alive() != 0)
{
    with (oP)
    {
        dead = 0;
    }
}
if ((oP.dead == 1 && oInit.coop == 0) || (oInit.coop == 1 && players_alive() == 0))
{
    with (oP)
    {
        dead = 0;
    }
    stages_passed = 0;
    oInit.player_number = oInit.player_max_chosen;
    time_start = 0;
    with (pFriend)
    {
        instance_destroy();
    }
    if (oInit.coop == 0)
    {
        with (instance_create(0, 0, oP))
        {
            init_class(oInit.player_class);
            coop = 0;
            player_id = 1;
            oInit.player[1, 2] = id;
        }
    }
    else
    {
        for (i = 1; i <= oInit.player_max_chosen; i += 1)
        {
            s = instance_create(0, 0, oP);
            with (s)
            {
                init_class(oInit.player[other.i, 0]);
                coop = 1;
                player_id = other.i;
            }
            oInit.player[i, 2] = s.id;
        }
    }
    global.enemy_buff = 1;
    oHUD.minute = 0;
    oHUD.second = 0;
    oHUD.difficulty = "Very Easy";
}
pos_points = ((room_width * room_height) / 11448) * (1 + ((room == r6_1_1) * 1));
bonus_rate = 1;
boss_drop = 0;
ghost_count = 0;
deactivated_count = 0;
alarm[1] = 600 / bonus_rate;
switch (global.level_name)
{
    case "Desolate Forest":
        global.music_name = 9;
        if (global.enemy_buff != 1)
        {
            global.enemy_buff += 0.4;
        }
        initial_spawn = 1;
        monster_number = 8;
        boss_number = 3;
        chest_number = 6;
        spawn[0, 0] = 0;
        spawn[1, 0] = 1;
        spawn[2, 0] = 2;
        spawn[3, 0] = 3;
        spawn[4, 0] = 4;
        spawn[5, 0] = 23;
        spawn[6, 0] = 7;
        spawn[7, 0] = 5;
        spawn[8, 0] = 6;
        pos_spawn[0, 0] = 1;
        pos_spawn[1, 0] = 2;
        pos_spawn[2, 0] = 3;
        pos_spawn[3, 0] = 4;
        pos_spawn[3, 1] = 1.3;
        pos_spawn[4, 0] = 7;
        pos_spawn[4, 1] = 1.5;
        pos_spawn[5, 0] = 5;
        pos_spawn[5, 1] = 3;
        pos_spawn[6, 0] = 6;
        pos_spawn[6, 1] = 3;
        break;
    case "Dried Lake":
        global.music_name = 10;
        if (global.enemy_buff != 1)
        {
            global.enemy_buff += 0.4;
        }
        initial_spawn = 1;
        monster_number = 8;
        boss_number = 3;
        chest_number = 6;
        spawn[0, 0] = 0;
        spawn[1, 0] = 8;
        spawn[2, 0] = 2;
        spawn[3, 0] = 3;
        spawn[4, 0] = 4;
        spawn[5, 0] = 23;
        spawn[6, 0] = 7;
        spawn[7, 0] = 5;
        spawn[8, 0] = 6;
        pos_spawn[0, 0] = 1;
        pos_spawn[1, 0] = 2;
        pos_spawn[2, 0] = 3;
        pos_spawn[3, 0] = 4;
        pos_spawn[3, 1] = 1.3;
        pos_spawn[4, 0] = 7;
        pos_spawn[4, 1] = 1.5;
        pos_spawn[5, 0] = 8;
        pos_spawn[5, 1] = 3;
        pos_spawn[6, 0] = 6;
        pos_spawn[6, 1] = 3;
        break;
    case "Damp Caverns":
        fake_teleporter_index = 2;
        initial_spawn = 0;
        global.music_name = 11;
        if (global.enemy_buff != 1)
        {
            global.enemy_buff += 0.4;
        }
        monster_number = 7;
        boss_number = 2;
        chest_number = 8;
        spawn[0, 0] = 0;
        spawn[1, 0] = 10;
        spawn[2, 0] = 9;
        spawn[3, 0] = 28;
        spawn[4, 0] = 4;
        spawn[5, 0] = 23;
        spawn[6, 0] = 7;
        spawn[7, 0] = 11;
        pos_spawn[0, 0] = 1;
        pos_spawn[0, 1] = 1.3;
        pos_spawn[1, 0] = 2;
        pos_spawn[2, 0] = 3;
        pos_spawn[3, 0] = 4;
        pos_spawn[3, 1] = 1.3;
        pos_spawn[4, 0] = 7;
        pos_spawn[4, 1] = 1.5;
        pos_spawn[5, 0] = 5;
        pos_spawn[5, 1] = 3.5;
        pos_spawn[6, 0] = 9;
        pos_spawn[6, 1] = 2;
        pos_spawn[7, 0] = 10;
        pos_spawn[7, 1] = 5;
        pos_spawn[8, 0] = 11;
        pos_spawn[8, 1] = 5;
        break;
    case "Sky Meadow":
        global.music_name = 12;
        if (global.enemy_buff != 1)
        {
            global.enemy_buff += 0.4;
        }
        initial_spawn = 0;
        monster_number = 8;
        boss_number = 2;
        chest_number = 7;
        spawn[0, 0] = 19;
        spawn[1, 0] = 1;
        spawn[2, 0] = 2;
        spawn[3, 0] = 20;
        spawn[4, 0] = 4;
        spawn[5, 0] = 9;
        spawn[6, 0] = 23;
        spawn[7, 0] = 11;
        spawn[8, 0] = 7;
        pos_spawn[0, 0] = 1;
        pos_spawn[1, 0] = 2;
        pos_spawn[2, 0] = 3;
        pos_spawn[3, 0] = 4;
        pos_spawn[3, 1] = 1.3;
        pos_spawn[4, 0] = 7;
        pos_spawn[4, 1] = 1.5;
        pos_spawn[5, 0] = 8;
        pos_spawn[5, 1] = 3;
        pos_spawn[6, 0] = 7;
        pos_spawn[6, 1] = 3;
        pos_spawn[7, 0] = 11;
        pos_spawn[7, 1] = 3;
        break;
    case "Ancient Valley":
        fake_teleporter_index = 3;
        initial_spawn = 0;
        global.music_name = 13;
        if (global.enemy_buff != 1)
        {
            global.enemy_buff += 0.5;
        }
        monster_number = 7;
        boss_number = 3;
        chest_number = 7;
        spawn[0, 0] = 14;
        spawn[1, 0] = 13;
        spawn[2, 0] = 15;
        spawn[3, 0] = 12;
        spawn[4, 0] = 23;
        spawn[5, 0] = 33;
        spawn[6, 0] = 5;
        spawn[7, 0] = 25;
        pos_spawn[0, 0] = 1;
        pos_spawn[0, 1] = 2.3;
        pos_spawn[1, 0] = 2;
        pos_spawn[2, 0] = 3;
        pos_spawn[2, 1] = 6;
        pos_spawn[3, 0] = 4;
        pos_spawn[3, 1] = 1.3;
        pos_spawn[4, 0] = 14;
        pos_spawn[4, 1] = 1.5;
        pos_spawn[5, 0] = 10;
        pos_spawn[5, 1] = 3;
        pos_spawn[6, 0] = 12;
        pos_spawn[6, 1] = 3;
        pos_spawn[7, 0] = 13;
        pos_spawn[7, 1] = 6;
        break;
    case "Sunken Tombs":
        fake_teleporter_index = 3;
        initial_spawn = 0;
        global.music_name = 14;
        if (global.enemy_buff != 1)
        {
            global.enemy_buff += 0.5;
        }
        monster_number = 7;
        boss_number = 3;
        chest_number = 7;
        spawn[0, 0] = 14;
        spawn[1, 0] = 8;
        spawn[2, 0] = 9;
        spawn[3, 0] = 32;
        spawn[4, 0] = 23;
        spawn[5, 0] = 6;
        spawn[6, 0] = 5;
        spawn[7, 0] = 25;
        pos_spawn[0, 0] = 1;
        pos_spawn[1, 0] = 2;
        pos_spawn[2, 0] = 3;
        pos_spawn[2, 1] = 6;
        pos_spawn[3, 0] = 4;
        pos_spawn[4, 0] = 14;
        pos_spawn[5, 0] = 10;
        pos_spawn[6, 0] = 12;
        pos_spawn[7, 0] = 13;
        break;
    case "Magma Barracks":
        fake_teleporter_index = 4;
        global.music_name = 16;
        if (global.enemy_buff != 1)
        {
            global.enemy_buff += 0.45;
        }
        monster_number = 6;
        boss_number = 2;
        chest_number = 6;
        spawn[0, 0] = 3;
        spawn[1, 0] = 15;
        spawn[2, 0] = 16;
        spawn[3, 0] = 12;
        spawn[4, 0] = 23;
        spawn[5, 0] = 18;
        spawn[6, 0] = 17;
        pos_spawn[0, 0] = 1;
        pos_spawn[0, 1] = 2.5;
        pos_spawn[1, 0] = 2;
        pos_spawn[2, 0] = 13;
        pos_spawn[2, 1] = 2;
        pos_spawn[3, 0] = 15;
        pos_spawn[3, 1] = 1;
        pos_spawn[4, 0] = 14;
        pos_spawn[4, 1] = 1.5;
        pos_spawn[5, 0] = 16;
        pos_spawn[5, 1] = 2;
        pos_spawn[6, 0] = 12;
        pos_spawn[6, 1] = 2;
        break;
    case "Hive Cluster":
        fake_teleporter_index = 4;
        global.music_name = 15;
        if (global.enemy_buff != 1)
        {
            global.enemy_buff += 0.45;
        }
        monster_number = 7;
        boss_number = 2;
        chest_number = 6;
        spawn[0, 0] = 30;
        spawn[1, 0] = 20;
        spawn[2, 0] = 29;
        spawn[3, 0] = 16;
        spawn[4, 0] = 28;
        spawn[5, 0] = 23;
        spawn[6, 0] = 25;
        spawn[7, 0] = 17;
        pos_spawn[0, 0] = 4;
        pos_spawn[1, 0] = 2;
        pos_spawn[2, 0] = 13;
        pos_spawn[3, 0] = 9;
        pos_spawn[4, 0] = 14;
        pos_spawn[5, 0] = 19;
        pos_spawn[6, 0] = 5;
        break;
    case "Boar Beach":
        pos_points = 0;
        fake_teleporter_index = 3;
        initial_spawn = 1;
        global.music_name = 13;
        monster_number = 3;
        boss_number = 1;
        chest_number = 0;
        spawn[0, 0] = 17;
        spawn[1, 0] = 23;
        spawn[2, 0] = 17;
        spawn[3, 0] = 17;
        pos_spawn[0, 0] = 1;
        pos_spawn[0, 1] = 2.3;
        break;
    case "Temple of the Elders":
        fake_teleporter_index = 4;
        global.music_name = 17;
        if (global.enemy_buff != 1)
        {
            global.enemy_buff += 0.45;
        }
        monster_number = 6;
        boss_number = 2;
        chest_number = 6;
        spawn[0, 0] = 24;
        spawn[1, 0] = 14;
        spawn[2, 0] = 22;
        spawn[3, 0] = 27;
        spawn[4, 0] = 23;
        spawn[5, 0] = 25;
        spawn[6, 0] = 17;
        pos_spawn[0, 0] = 1;
        pos_spawn[0, 1] = 2.5;
        pos_spawn[1, 0] = 2;
        pos_spawn[2, 0] = 13;
        pos_spawn[2, 1] = 2;
        pos_spawn[3, 0] = 18;
        pos_spawn[4, 0] = 14;
        pos_spawn[4, 1] = 1.5;
        pos_spawn[5, 0] = 17;
        pos_spawn[5, 1] = 4;
        pos_spawn[6, 0] = 10;
        pos_spawn[6, 1] = 2;
        break;
    case "Risk of Rain":
        initial_spawn = 0;
        fake_teleporter_index = 4;
        global.music_name = 19;
        if (global.enemy_buff != 1)
        {
            global.enemy_buff += 0.45;
        }
        monster_number = 6;
        boss_number = 1;
        chest_number = 6;
        spawn[0, 0] = 24;
        spawn[1, 0] = 30;
        spawn[2, 0] = 27;
        spawn[3, 0] = 14;
        spawn[4, 0] = 31;
        spawn[5, 0] = 23;
        spawn[6, 0] = 25;
        pos_spawn[0, 0] = 1;
        pos_spawn[0, 1] = 1.5;
        pos_spawn[1, 0] = 2;
        pos_spawn[2, 0] = 13;
        pos_spawn[2, 1] = 2.5;
        pos_spawn[3, 0] = 7;
        pos_spawn[3, 1] = 1.5;
        pos_spawn[4, 0] = 14;
        pos_spawn[4, 1] = 1.5;
        pos_spawn[5, 0] = 17;
        pos_spawn[5, 1] = 4;
        pos_spawn[6, 0] = 10;
        pos_spawn[6, 1] = 2;
        break;
}
points = irandom_range(20, 40) * global.enemy_buff;
if (global.artifact_crew && (global.host || oInit.coop != 2))
{
    global.artifact_crew_choice = irandom_range(0, monster_number - boss_number - 1);
    server_message_send(0, 45, 0, 0, global.artifact_crew_choice);
}
if (oInit.coop == 2 && global.host == 0)
{
    with (oP)
    {
        x = other.player_x;
        y = other.player_y;
        ghost_x = x;
        ghost_y = y;
    }
    if (initial_spawn == 1)
    {
        instance_create(player_x - 64, player_y + 7, oBase);
        with (oP)
        {
            visible = true;
            activity = 0;
            activity_type = 0;
        }
    }
    else if (room != r6_1_1)
    {
        with (instance_create(player_x, player_y, oTeleporterFake))
        {
            image_index = other.fake_teleporter_index;
        }
    }
    instance_create(teleporter_x, teleporter_y, oTeleporter);
    if (epic_teleporter == 1)
    {
        oTeleporter.sprite_index = sTeleporterEpic;
        oTeleporter.epic = 1;
    }
    exit;
}
if (initial_spawn == 1)
{
    initial_spawn = 0;
    while (1)
    {
        xx = random(room_width);
        yy = random(room_height);
        block = instance_nearest(xx, yy, pBlockMain);
        if (instance_exists(oBase) == 0)
        {
            base = instance_create(block.x, block.y, oBase);
            with (base)
            {
                for (i = 0; i <= sprite_width; i += 10)
                {
                    if (collision_point(x + i, y + 8, pBlock, 1, 0) < 0 || place_meeting(x, y, pBlock) == 1)
                    {
                        instance_destroy();
                    }
                }
            }
        }
        else
        {
            base = 66;
        }
        if (instance_exists(base))
        {
            with (oP)
            {
                x = other.base.x + 64;
                y = (other.base.y - sprite_height) + sprite_yoffset;
                visible = true;
                activity = 0;
                activity_type = 0;
            }
            break;
        }
    }
}
else if (instance_exists(oTeleporterFake) == 0)
{
    while (1)
    {
        xx = random(room_width);
        yy = random(room_height);
        block = instance_nearest(xx, yy, oB);
        if (collision_point(block.x + 25, block.y + 8, pBlock, 1, 0) > 0 && collision_point(block.x - 25, block.y + 8, pBlock, 1, 0) > 0)
        {
            oP.y = block.y - 13;
            oP.x = block.x + 6;
            s = instance_create(oP.x, block.y, oTeleporterFake);
            s.image_index = fake_teleporter_index;
            break;
        }
    }
}
else
{
    var tfake = instance_find(oTeleporterFake, random_range(0, instance_number(oTeleporterFake) - 1));
    with (oP)
    {
        x = tfake.x + 6;
        y = ((tfake.y - sprite_height) + sprite_yoffset) - 10;
        ghost_x = x;
        ghost_y = y;
    }
}
if (instance_exists(oTeleporter) == 0)
{
    while (1)
    {
        block = instance_nearest(random(room_width), random(room_height), oB);
        s = instance_create(block.x + 8 + (random(block.width_box - 1) * 16), block.y, oTeleporter);
        if (stages_passed >= 4)
        {
            s.sprite_index = sTeleporterEpic;
            s.epic = 1;
        }
        if (point_distance(s.x, s.y, oP.x, oP.y) > ((room_height + room_width) / 6) && collision_point(s.x + 10, s.y + 8, pBlock, 1, 0) > 0 && collision_point(s.x - 10, s.y + 8, pBlock, 1, 0) > 0)
        {
            break;
        }
        else
        {
            with (s)
            {
                instance_destroy();
            }
        }
    }
}
if (oInit.coop == 2)
{
    server_message_send(0, 18, 0, objServer.m_id, room, global.my_player.x, global.my_player.y, oTeleporter.x, oTeleporter.y, oTeleporter.epic);
}
var passes = 0;
if (!global.artifact_loot)
{
    while (1)
    {
        var choice = irandom(chest_number);
        xx = random(room_width);
        yy = random(room_height);
        block = instance_nearest(xx, yy, oB);
        if (pos_card[pos_spawn[choice, 0], 2] <= pos_points)
        {
            if (random(pos_card[pos_spawn[choice, 0], 2] / (1 + (point_distance(block.x, block.y, oP.x, oP.y) / 200))) < (10 / pos_spawn[choice, 1]) && collision_rectangle(block.x - 16, block.y, block.x + 16, block.y - 16, pMapObjects, 0, 0) < 0)
            {
                with (instance_create(block.x + 8 + (random(block.width_box - 1) * 16), block.y, pos_card[pos_spawn[choice, 0], 3]))
                {
                    if (oInit.coop == 2 && global.host)
                    {
                        m_id = global.chest_index;
                        global.chest_index += 1;
                        preplaced = 0;
                        server_message_send(0, 12, object_index, m_id, x, y);
                    }
                }
                pos_points -= pos_card[pos_spawn[choice, 0], 2];
            }
        }
        else
        {
            passes += 1;
        }
        if (passes >= 20)
        {
            break;
        }
    }
}
with (oP)
{
    ghost_x = x;
    ghost_y = y;
}
