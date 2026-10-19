var mcount = 0;
while (!ds_queue_empty(global.yyNetQueue) && mcount < global.client_throttle)
{
    var newSock = ds_queue_dequeue(global.yyNetQueue);
    var newBuf = ds_queue_dequeue(global.yyNetQueue);
    yybuffer_copy(newBuf);
    buffer_delete(newBuf);
    mcount += 1;
    var sid = readbyte();
    var oid;
    if (sid == 29)
    {
        c_item_proc();
        exit;
    }
    else
    {
        oid = readdouble();
        mid = readdouble();
    }
    last_message += ("_" + string(sid));
    switch (sid)
    {
        case 48:
            var icx = readshort();
            var icy = readshort();
            var icd = readshort();
            var icc = readshort();
            repeat (icc)
            {
                s = instance_create(icx, icy, oEfFirework);
                s.team = "playerproc";
                s.damage = icd;
            }
            break;
        case 47:
            var icx = readshort();
            var icy = readshort();
            with (collision_point(icx, icy, oArtifactButton, 0, 0))
            {
                force_activated = 1;
            }
            break;
        case 45:
            global.artifact_crew_choice = readshort();
            break;
        case 44:
            var icx = readshort();
            var icy = readshort();
            with (instance_create(icx, icy, oSlime))
            {
                m_id = other.mid;
                size_s = readfloat();
                maxhp = readshort();
                damage = readshort();
                exp_worth = readshort();
                elite = readbyte();
                elite_tier = readshort();
                image_blend = readdouble();
            }
            break;
        case 43:
            var t = find_object(oid, mid);
            if (instance_exists(t))
            {
                with (t)
                {
                    instance_destroy();
                }
            }
            break;
        case 42:
            var t = find_object(oid, mid);
            if (instance_exists(t))
            {
                with (t)
                {
                    intended_speed = 4;
                    image_speed = 0.4;
                    landing = 1;
                    targetx = readshort();
                    targety = readshort();
                }
            }
            break;
        case 41:
            global.time_stop = readshort();
            if (!audio_is_playing(wWatch))
            {
                audio_play_sound(wWatch, 20, true);
            }
            audio_pause_sound(global.music_id);
            break;
        case 40:
            var icx = readshort();
            var icy = readshort();
            with (instance_create(icx, icy, oid))
            {
                global.director.ghost_count += 1;
                m_id = other.mid;
                ghost = 1;
                team = "player";
                exp_worth = 0;
                damage *= readfloat();
                hp *= readfloat();
                death_timer = 900;
            }
            break;
        case 39:
            global.diff_level = clamp(readbyte(), 1, 3);
            global.fair_loot = readbyte();
            oInit.artifact_active[0] = readbyte();
            oInit.artifact_active[1] = readbyte();
            oInit.artifact_active[2] = readbyte();
            oInit.artifact_active[3] = readbyte();
            oInit.artifact_active[4] = readbyte();
            oInit.artifact_active[5] = readbyte();
            oInit.artifact_active[6] = readbyte();
            oInit.artifact_active[7] = readbyte();
            oInit.artifact_active[8] = readbyte();
            oInit.artifact_active[9] = readbyte();
            break;
        case 38:
            with (find_object(oid, mid))
            {
                hp = readshort();
            }
            break;
        case 37:
            with (find_object(oid, mid))
            {
                x = readshort();
                y = readshort();
                ghost_x = x;
                ghost_y = y;
                if (elite_tier <= 9)
                {
                    with (instance_create(x, y, oEfFlash))
                    {
                        parent = other.id;
                        image_blend = #EFD27B;
                    }
                }
            }
            break;
        case 36:
            with (find_object(oid, mid))
            {
                item_id = readshort();
                sprite_id = object_get_sprite(item_id);
                caster_play(54, global.volume, 0.5);
            }
            break;
        case 35:
            var icx = readshort();
            var icy = readshort();
            var timp = instance_create(icx, icy, oImpM);
            timp.parent = find_object(88, readshort());
            timp.m_id = mid;
            timp.moveLeft = readbyte();
            timp.moveRight = readbyte();
            break;
        case 34:
            global.enemy_buff = readdouble();
            oHUD.minute = readshort();
            oHUD.second = readshort();
            break;
        case 32:
            with (find_object(oid, mid))
            {
                cost = readshort();
            }
            break;
        case 31:
            var icx = readshort();
            var icy = readshort();
            var tdrone = instance_create(icx, icy, oid);
            tdrone.m_id = mid;
            tdrone.master = find_object(167, readshort());
            var txx = readshort();
            var tyy = readshort();
            if (txx != 0 || tyy != 0)
            {
                tdrone.xx = txx;
                tdrone.yy = tyy;
            }
            break;
        case 30:
            var t = readbyte();
            var tshrine = find_object(oid, mid);
            oP.opened_chests += 1;
            with (tshrine)
            {
                if (t == 0)
                {
                    charges -= 1;
                    oInit.achievement[5, 1] = 0;
                    with (oP)
                    {
                        if (dice != 0)
                        {
                            apply_buff(id, 11, 2);
                        }
                    }
                    achievement_progress(45, 1);
                    oInit.win_shrine += 1;
                    oInit.loss_shrine = 0;
                    oInit.win_shrine_max = max(oInit.win_shrine, oInit.win_shrine_max);
                    oInit.loss_shrine_max = max(oInit.loss_shrine, oInit.loss_shrine_max);
                }
                else
                {
                    oInit.achievements[45, 1] = 0;
                    with (oP)
                    {
                        if (dice != 0)
                        {
                            apply_buff(id, 11, 72000);
                        }
                    }
                    achievement_progress(5, 1);
                    oInit.win_shrine = 0;
                    oInit.loss_shrine += 1;
                    oInit.win_shrine_max = max(oInit.win_shrine, oInit.win_shrine_max);
                    oInit.loss_shrine_max = max(oInit.loss_shrine, oInit.loss_shrine_max);
                }
                if (charges == 0)
                {
                    image_index = 0;
                    image_speed = 0.2;
                    charges = -1;
                    sprite_index = sprite_death;
                    oHUD.alarm[0] = 10;
                    caster_play(170, global.volume, 1.2);
                }
            }
            break;
        case 16:
            var tping = readstring(bytesleft());
            with (oid)
            {
                if (m_id == other.mid)
                {
                    if (id == global.my_player)
                    {
                        ping = string(round((get_timer() / 1000) - objClient.ping_start)) + "ms";
                    }
                    else
                    {
                        ping = tping;
                    }
                }
            }
            break;
        case 26:
            var ttype = readbyte();
            var tstring = readstring(bytesleft());
            if (ttype == 0 || (ttype == 1 && !global.no_item_message))
            {
                ds_list_insert(objClient.chat, 0, tstring);
                ds_list_insert(objClient.color, 0, 12632256);
                objClient.alpha = 60;
            }
            break;
        case 25:
            var tp_mid = readdouble();
            var tswap = readdouble();
            with (oid)
            {
                if (m_id == other.mid)
                {
                    var titem_id = id;
                    force_pickup = tp_mid;
                    with (oP)
                    {
                        if (tp_mid == m_id)
                        {
                            show_debug_message(titem_id);
                            titem_id.x = x;
                            titem_id.y = y;
                            force_swap = tswap;
                        }
                    }
                }
            }
            break;
        case 24:
            with (oid)
            {
                if (m_id == other.mid)
                {
                    event_user(5);
                }
            }
            break;
        case 4:
            caster_play(41, global.volume, 1);
            ds_list_insert(objClient.chat, 0, readstring(bytesleft()));
            ds_list_insert(objClient.color, 0, get_chat_color(mid));
            objClient.alpha = 60;
            break;
        case 23:
            var icx = readdouble();
            var icy = readdouble();
            var tsc = instance_create(icx, icy, oSpawn);
            tsc.m_id = mid;
            tsc.sprite_index = readint();
            tsc.child = readint();
            tsc.sound_spawn = readdouble();
            tsc.elite = readbyte();
            tsc.elite_tier = readshort();
            tsc.point_value = readshort();
            tsc.image_xscale = readshort();
            if (tsc.image_xscale == 0)
            {
                tsc.image_xscale = 1;
            }
            tsc.image_blend = readdouble();
            break;
        case 22:
            var icx = readdouble();
            var icy = readdouble();
            var tb = instance_create(icx, icy, oid);
            with (tb)
            {
                m_id = other.mid;
                elite = max(readbyte(), elite);
                image_blend = readdouble();
            }
            break;
        case 21:
            var tv = readdouble();
            if (oid == 85)
            {
                with (oChest3)
                {
                    if (m_id == other.mid)
                    {
                        sprite_id = tv;
                    }
                }
            }
            else if (oid == -1)
            {
                with (oChest3)
                {
                    if (m_id == other.mid)
                    {
                        sprite_id = -1;
                        item_id = -1;
                        active = 1;
                    }
                }
            }
            break;
        case 19:
            var tx = readdouble();
            var ty = readdouble();
            var tob = readshort();
            var tmi = readshort();
            var tactive = readbyte();
            var success = readbyte();
            with (oid)
            {
                if (m_id == other.mid && id != global.my_player)
                {
                    x = tx;
                    y = ty;
                }
            }
            with (find_object(tob, tmi))
            {
                if (object_index == oArtifact8Box1 || object_index == oArtifact8Box2 || object_index == oArtifact8Box3 || 461)
                {
                    owner = find_object(oid, other.mid);
                }
                if (global.my_player.m_id == other.mid && success == 1)
                {
                    if (object_index == oShrine2)
                    {
                        global.my_player.hp -= cost;
                        global.my_player.shield = 0;
                        s = instance_create(global.my_player.x, global.my_player.y, oEfDamage);
                        s.team = "enemy";
                        s.damage = cost;
                        if (global.my_player.hp <= (global.my_player.maxhp * 0.05))
                        {
                            achievement_progress(44, 1);
                        }
                    }
                    else if (object_index == oShrine5)
                    {
                        global.my_player.hp -= cost * global.my_player.maxhp;
                        global.my_player.shield = 0;
                        s = instance_create(global.my_player.x, global.my_player.y, oEfDamage);
                        s.team = "enemy";
                        s.damage = ceil((cost / 100) * global.my_player.maxhp);
                        if (global.my_player.hp <= (global.my_player.maxhp * 0.05))
                        {
                            achievement_progress(44, 1);
                        }
                    }
                    else if (object_index == oDoor)
                    {
                        global.my_player.keycard -= 1;
                        var tlast = 0;
                        for (i = 0; i <= global.my_player.item_count; i += 1)
                        {
                            if (tlast == 1)
                            {
                                global.my_player.item[i - 1, 0] = global.my_player.item[i, 0];
                                global.my_player.item[i - 1, 1] = global.my_player.item[i, 1];
                                global.my_player.item[i - 1, 2] = global.my_player.item[i, 2];
                            }
                            if (global.my_player.item[i, 0] == 851)
                            {
                                global.my_player.item[i, 1] -= 1;
                                if (global.my_player.item[i, 1] == 0)
                                {
                                    tlast = 1;
                                }
                                else
                                {
                                    tlast = 0;
                                    break;
                                }
                            }
                        }
                        if (tlast == 1)
                        {
                            global.my_player.item[global.my_player.item_count, 0] = -1;
                            global.my_player.item[global.my_player.item_count, 1] = -1;
                            global.my_player.item[global.my_player.item_count, 2] = -1;
                            global.my_player.item_count -= 1;
                        }
                    }
                    else
                    {
                        oHUD.gold -= cost;
                    }
                }
                if (object_index == oTeleporter && tactive == 1 && success == 1)
                {
                    if (oInit.current_level < 3)
                    {
                        global.music_name = choose(2, 3, 4);
                    }
                    else
                    {
                        global.music_name = choose(5, 6, 7);
                    }
                    value = (value * power(global.enemy_buff, 0.4)) + ((global.diff_level - 1) * 50);
                    global.director.bonus_rate += 5;
                    global.director.points += value;
                }
                if (object_index == oShrine3)
                {
                    charges -= 1;
                }
                active = tactive;
            }
            break;
        case 20:
            var tx = readdouble();
            var ty = readdouble();
            var tnum = readint();
            for (i = 0; i < tnum; i += 1)
            {
                var to = instance_create(x, y, oid);
                to.m_id = mid;
            }
            break;
        case 8:
            with (oid)
            {
                if (m_id == other.mid)
                {
                    hp = readdouble();
                    x = readdouble();
                    y = readdouble();
                    image_xscale = readshort();
                    if (image_xscale == 0)
                    {
                        image_xscale = 1;
                    }
                    knockback_value = readshort();
                    force_knockback = 1;
                    alarm[7] = readshort();
                }
            }
            break;
        case 10:
            var found_target = 0;
            var tx = readdouble();
            var ty = readdouble();
            var tt = readint();
            var td = readshort();
            var tfs = readbyte();
            with (oPOI)
            {
                if (parent.m_id == tt)
                {
                    tt = id;
                    found_target = 1;
                }
            }
            if (found_target == 0)
            {
                tt = -10;
            }
            with (oid)
            {
                if (m_id == other.mid)
                {
                    if (object_index == oWorm)
                    {
                        f = tx;
                        hp = ty;
                        target = tt;
                        alarm[0] = 1;
                        client_mid = td;
                    }
                    else if (object_index == oWurmHead)
                    {
                        hp = ty;
                        target = tt;
                    }
                    else
                    {
                        x = tx;
                        y = ty;
                        target = tt;
                        direction = td;
                        force_speedup = tfs;
                    }
                }
            }
            break;
        case 12:
            var icx = readdouble();
            var icy = readdouble();
            var to = instance_create(icx, icy, oid);
            to.m_id = mid;
            break;
        case 9:
            with (oid)
            {
                if (m_id == other.mid)
                {
                    force_death = 1;
                }
            }
            break;
        case 11:
            with (oid)
            {
                if (m_id == other.mid)
                {
                    var v1 = readdouble();
                    var v2 = readdouble();
                    var v3 = readbyte();
                    var v4 = readbyte();
                    var v5 = readbyte();
                    var v6 = readbyte();
                    var v7 = readshort();
                    key_monster(v1, v2, v3, v4, v5, v6, v7);
                }
            }
            break;
        case 6:
            with (oid)
            {
                if (m_id == other.mid)
                {
                    var v1 = readshort();
                    var v2 = readshort();
                    var v3 = readbyte();
                    var v4 = readbyte();
                    var v5 = readbyte();
                    var v6 = readbyte();
                    var v7 = readshort();
                    var v8 = readbyte();
                    key_player(v1, v2, v3, v4, v5, v6, v7, v8);
                }
            }
            break;
        case 15:
            var tcard = readshort();
            var tx = readdouble();
            var ty = readdouble();
            var tos = instance_create(tx, ty, oSpawn);
            tos.m_id = mid;
            tos.sprite_index = global.director.card[global.director.spawn[tcard, 0], 3];
            tos.child = global.director.card[global.director.spawn[tcard, 0], 4];
            tos.sound_spawn = global.director.card[global.director.spawn[tcard, 0], 5];
            tos.elite = readbyte();
            tos.elite_tier = readshort();
            tos.point_value = readshort();
            tos.image_xscale = readshort();
            break;
        case 0:
            with (oid)
            {
                if (m_id == other.mid)
                {
                    set_position(id);
                }
            }
            break;
        case 18:
            var v1 = readdouble();
            var v2 = readdouble();
            var v3 = readdouble();
            var v4 = readdouble();
            var v5 = readdouble();
            var v6 = readbyte();
            transport(v1, v2, v3, v4, v5, v6);
            mcount = global.client_throttle;
            break;
        case 17:
            with (oid)
            {
                if (m_id == other.mid)
                {
                    if (id == global.my_player)
                    {
                        with (objClient)
                        {
                            alarm[4] = 1;
                        }
                    }
                    else
                    {
                        instance_destroy();
                    }
                    with (oPrePlayer)
                    {
                        ready = 0;
                    }
                    if (room != rSelectMult)
                    {
                        refresh_players();
                    }
                    else
                    {
                        refresh_classes();
                    }
                }
            }
            break;
        case 1:
            with (oid)
            {
                if (m_id == other.mid)
                {
                    ready = readbyte();
                }
            }
            break;
        case 2:
            with (oid)
            {
                if (m_id == other.mid)
                {
                    var icx = readdouble();
                    var icy = readdouble();
                    if (!set_player(icx, icy, readstring(bytesleft())))
                    {
                        closesocket(other.sock);
                        room_goto(rStart);
                        return 0;
                    }
                }
            }
            break;
        case 3:
            var v1 = readdouble();
            var v2 = readdouble();
            var v3 = readdouble();
            var v4 = readint();
            var v5 = readint();
            var v6 = readstring(bytesleft());
            add_player(v1, v2, v3, v4, v5, v6);
            break;
        case 5:
            with (oid)
            {
                if (m_id == other.mid)
                {
                    var v1 = readint();
                    var v2 = readdouble();
                    var v3 = readdouble();
                    var v4 = readstring(bytesleft());
                    update_player(v1, v2, v3, v4);
                }
            }
            break;
        case 7:
            with (oid)
            {
                if (m_id == other.mid)
                {
                    var v1 = readdouble();
                    var v2 = readdouble();
                    var v3 = readdouble();
                    var v4 = readdouble();
                }
            }
            break;
        case 14:
            with (oid)
            {
                if (m_id == other.mid)
                {
                    var v1 = readdouble();
                    alarm[v1] = readdouble();
                }
            }
            break;
        case 13:
            with (oid)
            {
                if (m_id == other.mid)
                {
                    var v1 = readdouble();
                    var v2 = readdouble();
                    var v3 = readdouble();
                    var v4 = readdouble();
                    var v5 = readint();
                    create_level_object(id, v1, v2, v3, v4, v5);
                }
            }
            break;
        default:
            break;
    }
}
