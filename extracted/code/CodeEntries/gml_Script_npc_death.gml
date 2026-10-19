if (!(oInit.coop == 2 && !global.host && argument1 == 0))
{
    if (hp <= 0 || argument0 == 1 || argument1 == 1)
    {
        if (global.artifact_death)
        {
            repeat ((sprite_get_width(other.sprite_idle) * sprite_get_height(other.sprite_idle)) / 100)
            {
                with (instance_create(x, y, oEfGrenadeEnemy))
                {
                    team = other.team;
                    damage = other.damage * 0.5;
                }
            }
        }
        if ((global.artifact_loot && random(100) <= (3 * logn(3, point_value + 1))) && (oInit.coop != 2 || global.host))
        {
            drop_item(1);
        }
        global.director.multikill += 1;
        if (ghost == 0)
        {
            if (room == r6_1_1 && random(100) <= 1 && (oInit.coop != 2 || global.host) && global.director.keycard_dropped < 4)
            {
                instance_create(x, y, oKeycard);
            }
            if (object_to_monster(object_index) != 99)
            {
                if (object_get_parent(object_index) != 323)
                {
                    if (random(100) <= 1)
                    {
                        if (global.diff_level >= 2 && oInit.mons_found[object_to_monster(object_index)] == 0 && oInit.mons_found_temp[object_to_monster(object_index)] == 0)
                        {
                            with (instance_create(x, y - 10, oBookDrop))
                            {
                                text1 = "Monster Log: " + other.name;
                                unlock_id = object_to_monster(other.object_index);
                            }
                        }
                    }
                }
                else if (random(100) <= 3)
                {
                    if (global.diff_level >= 2 && oInit.mons_found[object_to_monster(object_index)] == 0 && oInit.mons_found_temp[object_to_monster(object_index)] == 0)
                    {
                        with (instance_create(x, y - 10, oBookDrop))
                        {
                            image_index = 1;
                            text1 = "Monster Log: " + other.name;
                            unlock_id = object_to_monster(other.object_index);
                        }
                    }
                }
            }
            with (oP)
            {
                if (dead == 0)
                {
                    kill_count += 1;
                    kill_points += (other.exp_worth * (1 + (other.elite * 0.9)));
                }
            }
        }
        with (oEfMark)
        {
            if (parent == other.id)
            {
                if (parent_2.mark_tally < 40)
                {
                    parent_2.mark_tally += 1;
                    parent_2.damage += 0.5;
                }
                caster_play(91, global.volume, 1);
                with (instance_create(x, y, oEfSparks))
                {
                    sprite_index = sEfMarkSuccess;
                    image_yscale = 1;
                    image_xscale = 1;
                    image_speed = 0.2;
                }
                instance_destroy();
            }
        }
        if (!global.artifact_elite)
        {
            f = exp_worth * (1 + (elite * 0.9)) * 0.5;
        }
        else
        {
            f = exp_worth * 0.5;
        }
        if (!elite_tier == -1)
        {
            if (elite_tier > 9)
            {
                f *= 20;
                drop_item(1);
            }
        }
        var b;
        if (!blast == -1)
        {
            b = blast;
        }
        else
        {
            b = 0;
        }
        if (f > 0)
        {
            while (f > 0)
            {
                var ccc = 1;
                if (global.graphics == 3)
                {
                    ccc = 0.75;
                }
                s = instance_create(x, y, oEfExp);
                s.direction = random(360);
                s.speed = random_range(1, 3);
                g = instance_create(x, y, oEfGold);
                g.direction = 180 - random(180);
                g.vsspeed = lengthdir_y(random_range(1, 3) + ((b != 0) * random_range(1, 2)), direction);
                g.hsspeed = lengthdir_x(random_range(1, 3) + ((b != 0) * random_range(1, 2)), direction);
                switch (min(floor(logn(5, f * ccc)), 5))
                {
                    case 0:
                        g.value = 1;
                        break;
                    case 1:
                        g.value = 5;
                        g.sprite_index = sEfGold2;
                        s.sprite_index = sEfExp2;
                        break;
                    case 2:
                        g.value = 25;
                        g.sprite_index = sEfGold3;
                        s.sprite_index = sEfExp3;
                        break;
                    case 3:
                        g.value = 125;
                        g.sprite_index = sEfGold5;
                        s.sprite_index = sEfExp4;
                        break;
                    case 4:
                        g.value = 625;
                        g.sprite_index = sEfGold6;
                        s.sprite_index = sEfExp4;
                        break;
                    case 5:
                        g.value = 3125;
                        g.sprite_index = sEfGold7;
                        s.sprite_index = sEfExp4;
                        break;
                }
                s.value = g.value * 2;
                f -= g.value;
            }
        }
        if (ghost == 0)
        {
            with (oP)
            {
                if (dead == 0)
                {
                    with (other)
                    {
                        if (other.class == 8 && abs(max(0, lastHp) - maxhp) < (maxhp * 0.01))
                        {
                            other.consecutive_kills += 1;
                        }
                        else
                        {
                            other.consecutive_kills = 0;
                        }
                        if (other.icy != 0)
                        {
                            var tp_id = other.id;
                            var ticy_count = 0;
                            with (oEfIce)
                            {
                                if (parent == tp_id)
                                {
                                    ticy_count++;
                                }
                            }
                            show_debug_message(string(ticy_count) + "/" + string((other.icy + 2) * 3));
                            if (ticy_count < ((other.icy + 2) * 3))
                            {
                                var toff = 360 / (other.icy + 2);
                                for (i = 0; i < (other.icy + 2); i++)
                                {
                                    var tk = instance_create(x, y, oEfIce);
                                    tk.parent = other.id;
                                    tk.angle = 90 + (toff * i);
                                    tk.angle_offset = tk.angle;
                                }
                            }
                            else
                            {
                                with (oEfIce)
                                {
                                    if (parent == tp_id)
                                    {
                                        image_alpha = 1;
                                        alarm[1] = ef_duration;
                                    }
                                }
                            }
                        }
                        if (other.clover != 0 && elite == 2 && random(100) < (4 + ((other.clover - 1) * 1.5)))
                        {
                            drop_item(1);
                        }
                        if (other.class == 10 && other.activity == 4)
                        {
                            achievement_progress(48, 1);
                        }
                        if (other.purse != 0)
                        {
                            f = exp_worth * (1 + (elite * 0.9));
                            if (f < 1000)
                            {
                                repeat (floor(max((f * other.purse) / 40, 1)))
                                {
                                    g = instance_create(x, y, oEfGold);
                                    g.direction = 180 - random(180);
                                    g.speed = random_range(1, 3);
                                    g.sprite_index = sEfGold4;
                                    g.value = 10;
                                }
                            }
                            else
                            {
                                repeat (25)
                                {
                                    g = instance_create(x, y, oEfGold);
                                    g.direction = 180 - random(180);
                                    g.speed = random_range(1, 3);
                                    g.sprite_index = sEfGold4;
                                    g.value = floor(f / 25) * other.purse;
                                }
                            }
                        }
                        if (other.lava_pillar >= 1 && random(100) < 33 && (oInit.coop != 2 || global.host))
                        {
                            with (other)
                            {
                                oHUD.alarm[0] = 2;
                                caster_play(167, global.volume * 0.7, 1.3);
                                fire_explosion(2, other.x, (other.y + other.sprite_height) - other.sprite_yoffset - 50, 2.5 + (1 * lava_pillar), 528, 3, -1, 1.4, 12);
                                bullet.knockup = 6;
                                bullet.stun = 1;
                                var ff = instance_create(other.x, (other.y + other.sprite_height) - other.sprite_yoffset, oEfSparks);
                                ff.image_yscale = 1;
                                ff.sprite_index = sEfPillar;
                                ff.image_speed = 0.3;
                                if (oInit.coop == 2)
                                {
                                    server_message_send(0, 29, 16, other.x, (other.y + other.sprite_height) - other.sprite_yoffset, bullet.damage, bullet.critical);
                                }
                            }
                        }
                        if (other.lightning_ring != 0)
                        {
                            var check = 0;
                            var tplayer = other.id;
                            with (oEfLightningRing)
                            {
                                if (parent == tplayer)
                                {
                                    check = id;
                                }
                            }
                            if (check != 0)
                            {
                                caster_play(40, global.volume, 0.8);
                                check.alarm[0] = 360;
                                check.radius += 10;
                                check.image_alpha = 1;
                            }
                            else
                            {
                                caster_play(40, global.volume, 0.7);
                                s = instance_create(x, y, oEfLightningRing);
                                s.parent = tplayer;
                                s.team = other.team + "proc";
                                s.coeff = 0.4 + (other.lightning_ring * 0.1);
                                s.alarm[0] = 360;
                            }
                        }
                        if (other.dagger >= 1)
                        {
                            repeat (4 + ((other.dagger - 1) * 2))
                            {
                                s = instance_create(x, y, oEfMissileMagic);
                                s.parent = 167;
                                s.damage = other.damage * 1;
                                s.team = "playerproc";
                            }
                        }
                        if (other.tree_on_kill)
                        {
                            s = instance_create(x, y, oEfTree);
                            s.value = 5 + (other.tree_on_kill * 3);
                            var ti = instance_nearest(x, y, oB);
                            if (ti != -4)
                            {
                                s.x = clamp(s.x, ti.x + 8, (ti.x + (16 * ti.width_box)) - 8);
                                s.y = ti.y;
                            }
                        }
                        if (other.heal_after_kill >= 1)
                        {
                            s = instance_create(x, y, oEfHeal2);
                            s.value = 10 + ((other.heal_after_kill - 1) * 5);
                        }
                        if (other.hp_after_kill >= 1)
                        {
                            s = instance_create(x, y, oEfHeal);
                            s.value = 1 + ((other.hp_after_kill - 1) * 0.5);
                            s.target = other.id;
                        }
                        if (other.worm_eye >= 1)
                        {
                            apply_buff(other.id, 0, 60 * (4 + (2 * other.worm_eye)));
                        }
                        if (other.mask >= 1 && argument0 == 0 && object_get_parent(object_index) != 323 && team != "player" && not_client())
                        {
                            var tt = other.id;
                            global.director.ghost_count += 1;
                            s = instance_create(x, y, object_index);
                            s.team = "player";
                            s.ghost = 1;
                            s.exp_worth = 0;
                            with (s)
                            {
                                damage = (damage * 0.7) + ((tt.mask - 1) * 0.3);
                                hp = (hp * 1) + ((tt.mask - 1) * 0.2);
                                death_timer = 900;
                                image_xscale = other.image_xscale;
                                image_yscale = other.image_yscale;
                            }
                            if (oInit.coop == 2 && global.host)
                            {
                                s.m_id = set_m_id(s.id);
                                server_message_send(0, 40, s.object_index, s.m_id, s.x, s.y, 0.7 + ((tt.mask - 1) * 0.3), 1 + ((tt.mask - 1) * 0.2));
                            }
                        }
                        if (other.gas >= 1)
                        {
                            for (i = -2; i < 2; i += 1)
                            {
                                s = instance_create(x + (i * 12), (y - sprite_yoffset) + sprite_height, oFireTrail);
                                s.team = "player";
                                s.sprite_index = sEfFireTrail3;
                                s.alarm[1] = 60 * random_range(2, 2.5);
                                damage_default(s, 0.6 + (0.4 * (other.gas - 1)));
                            }
                        }
                        if (other.class == 5)
                        {
                            if (other.x_stack < 10 && point_distance(x, y, other.x, other.y) < 600)
                            {
                                s = instance_create(x, y, oJanitorBaby);
                                s.parent = other.id;
                            }
                        }
                    }
                }
            }
        }
        if (argument0 == 0)
        {
            if (ghost == 0)
            {
                if (object_index != oSlime)
                {
                    s = instance_create(x, y, oBody);
                    s.image_speed = 0.2;
                    s.sprite_index = sprite_death;
                    s.image_xscale = image_xscale;
                    s.shake_frame = shake_frame;
                    s.image_blend = image_blend;
                    s.sprite_palette = sprite_palette;
                    s.elite_tier = elite_tier;
                    with (s)
                    {
                        move_contact_solid(270, 480);
                    }
                }
                caster_play(sound_death, global.volume, 1);
                instance_destroy();
            }
            else
            {
                global.director.ghost_count -= 1;
                s = instance_create(x, y, oEfTrail);
                s.ghost = 1;
                s.image_index = image_index;
                s.sprite_index = sprite_index;
                s.image_xscale = image_xscale;
                s.image_yscale = image_yscale;
                instance_destroy();
            }
        }
        if (oInit.coop == 2)
        {
            if (object_index == oWormHead)
            {
                server_message_send(0, 9, controller.object_index, controller.m_id);
            }
            else
            {
                server_message_send(0, 9, object_index, m_id);
            }
        }
    }
}
