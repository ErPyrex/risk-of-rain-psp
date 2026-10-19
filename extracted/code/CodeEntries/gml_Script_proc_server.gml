while (!ds_queue_empty(global.yyNetQueue))
{
    var newSock = ds_queue_dequeue(global.yyNetQueue);
    var newBuf = ds_queue_dequeue(global.yyNetQueue);
    yybuffer_copy(newBuf);
    buffer_delete(newBuf);
    var tp = find_player(newSock);
    if (tp == -1)
    {
        continue;
    }
    var sid = readbyte();
    show_debug_message(string(sid));
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
        case 46:
            var icx = readshort();
            var icy = readshort();
            instance_create(icx, icy, readshort());
            break;
        case 41:
            global.time_stop = readshort();
            if (!audio_is_playing(wWatch))
            {
                audio_play_sound(wWatch, 20, true);
            }
            audio_pause_sound(global.music_id);
            break;
        case 28:
            with (tp)
            {
                force_swap = 1;
            }
            break;
        case 16:
            var ts = readstring(bytesleft());
            with (tp)
            {
                ping = ts;
                lag = 0;
            }
            server_message_send(0, 16, tp.object_index, tp.m_id, ts);
            break;
        case 26:
            var ttype = readbyte();
            var tstring = readstring(bytesleft());
            if (ttype == 0 || (ttype == 1 && !global.no_item_message))
            {
                ds_list_insert(objServer.chat, 0, tstring);
                ds_list_insert(objServer.color, 0, 12632256);
                objServer.alpha = 60;
            }
            server_message_send(tp.sock, 26, 0, 0, ttype, tstring);
            break;
        case 24:
            with (tp)
            {
                event_user(5);
            }
            server_message_send(tp.sock, 24, tp.object_index, tp.m_id);
            break;
        case 4:
            caster_play(41, global.volume, 1);
            var mstring = readstring(bytesleft());
            ds_list_insert(objServer.chat, 0, mstring);
            ds_list_insert(objServer.color, 0, get_chat_color(tp.m_id));
            objServer.alpha = 60;
            server_message_send(tp.sock, 4, tp.object_index, tp.m_id, mstring);
            break;
        case 19:
            var tx = readdouble();
            var ty = readdouble();
            var tob = readshort();
            var tmi = readshort();
            var tactive = readbyte();
            var tab = find_object(tob, tmi);
            with (tp)
            {
                x = tx;
                y = ty;
            }
            with (tab)
            {
                if (object_index == oArtifact8Box1 || object_index == oArtifact8Box2 || object_index == oArtifact8Box3 || 461)
                {
                    owner = tp;
                }
                if (object_index == oTeleporter && active <= 1)
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
                    global.director.spawn_boss = 1;
                }
                if (object_index == oShrine3)
                {
                    charges -= 1;
                }
                if (object_index == oBlastdoorPanel)
                {
                    value = (value * power(global.enemy_buff, 0.4)) + ((global.diff_level - 1) * 20);
                    global.director.bonus_rate += 5;
                    global.director.points += value;
                }
                if (active < tactive)
                {
                    active = tactive;
                    var success = 1;
                    server_message_send(0, 19, tp.object_index, tp.m_id, tx, ty, tob, tmi, tab.active, success);
                }
                else
                {
                    var success = 0;
                    server_message_send_direct(tp.sock, 19, tp.object_index, tp.m_id, tx, ty, tob, tmi, tab.active, success);
                }
            }
            objServer.item_dibs = tp;
            break;
        case 12:
            var to = readdouble();
            var tx = readdouble();
            var ty = readdouble();
            instance_create(tx, ty, to);
            server_message_send(tp.sock, 12, to, tp.m_id, tx, ty);
            break;
        case 9:
            with (tp)
            {
                force_death = 1;
            }
            server_message_send(tp.sock, 9, tp.object_index, tp.m_id);
            break;
        case 6:
            var v1 = readshort();
            var v2 = readshort();
            var v3 = readbyte();
            var v4 = readbyte();
            var v5 = readbyte();
            var v6 = readbyte();
            var v7 = readshort();
            var v8 = readbyte();
            with (tp)
            {
                key_player(v1, v2, v3, v4, v5, v6, v7, v8);
            }
            break;
        case 0:
            set_position(tp);
            break;
        case 14:
            var oid = readdouble();
            var mid = readdouble();
            var alm = readdouble();
            var tme = readdouble();
            var syn = readint();
            with (oid)
            {
                if (m_id == mid)
                {
                    if (alm <= 0 && tme <= 0)
                    {
                        event_perform(ev_keypress, vk_enter);
                    }
                    else
                    {
                        alarm[alm] = tme;
                        if (syn == 0)
                        {
                            server_message_send(0, 14, oid, mid, alm, tme);
                        }
                    }
                }
            }
            break;
        case 13:
            var v1 = readdouble();
            var v2 = readdouble();
            var v3 = readdouble();
            var v4 = readdouble();
            var v5 = readint();
            create_level_object(tp, v1, v2, v3, v4, v5);
            break;
        case 5:
            with (tp)
            {
                var treturn = 1;
                var v1 = readint();
                var v2 = readdouble();
                var v3 = readdouble();
                var v4 = readstring(bytesleft());
                treturn = update_player(v1, v2, v3, v4);
                if (treturn == 0)
                {
                    return 0;
                }
            }
            break;
        case 1:
            with (tp)
            {
                ready = readbyte();
                server_message_send(sock, 1, object_index, m_id, ready);
            }
            break;
        case 17:
            disconnect_player(tp, 0, 0);
            return 1;
            break;
        case 7:
            var v1 = readdouble();
            var v2 = readdouble();
            var v3 = readdouble();
            var v4 = readdouble();
            break;
        default:
            break;
    }
}
return 0;
