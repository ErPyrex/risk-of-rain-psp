if ((use[0] != -1 && alarm[0] == -1 && dead == 0) || argument0 == 1)
{
    alarm[0] = 60 * use_cooldown;
    caster_play(132, global.volume, 1);
    var t = random(100) < (30 * embryo);
    if (t != 0)
    {
        s = instance_create(x, y, oEfFlash);
        s.parent = id;
        s.image_blend = #FFA3B1;
        caster_play(74, global.volume, 1);
        caster_play(63, global.volume, 1);
    }
    var tuse_index;
    if (argument1 == -1)
    {
        if (use[0] != 442)
        {
            tuse_index = use[0];
        }
        else
        {
            tuse_index = choose(choose(419, 423, 424, 425, 426, 427, 428, 429, 430, 431), choose(438, 439, 440, 441, 432, 433, 434, 435, 436, 437));
        }
    }
    else
    {
        tuse_index = argument1;
    }
    switch (tuse_index)
    {
        case 420:
            var tc = 30 * (t + 1);
            i = 0;
            while (i < 360)
            {
                with (instance_create(x, y, oEfSquib))
                {
                    team = other.team;
                    speed = 2 * random_range(0.8, 1);
                    direction = other.i * random_range(0.8, 1);
                    damage = other.damage * 2;
                    turn_dir = 90 - (90 * other.image_xscale);
                }
                with (instance_create(x, y, oEfSquib))
                {
                    team = other.team;
                    speed = 1 * random_range(0.8, 1);
                    direction = other.i * random_range(0.8, 1);
                    damage = other.damage * 2;
                    turn_dir = 90 - (90 * other.image_xscale);
                }
                with (instance_create(x, y, oEfSquib))
                {
                    team = other.team;
                    speed = 0.5 * random_range(0.8, 1);
                    direction = other.i * random_range(0.8, 1);
                    damage = other.damage * 2;
                    turn_dir = 90 - (90 * other.image_xscale);
                }
                i += (360 / (tc / 3));
            }
            break;
        case 421:
            with (oEfDyno)
            {
                alarm[1] = random_range(1, 8);
                parent = other.id;
            }
            dynamite_on_hit = 0;
            break;
        case 422:
            alarm[2] = 0;
            alarm[3] = 0;
            alarm[4] = 0;
            alarm[5] = 0;
            alarm[0] = 10 * use_cooldown;
            break;
        case 417:
            alarm[0] = 60;
            s = instance_create(x, y, oHome);
            with (s)
            {
                move_contact_solid(270, 1000);
            }
            s.parent = id;
            use[0] = 418;
            use[1] = 806;
            use[2] = "Teleport back to the marble gate.";
            break;
        case 418:
            if (activity != 30)
            {
                alarm[0] = 1;
                with (oHome)
                {
                    if (parent == other.id)
                    {
                        other.alarm[0] = 60 * other.use_cooldown;
                        caster_play(157, global.volume, 1.5);
                        s = instance_create(other.x, other.y, oEfBullet2);
                        s.sprite_index = sEfRecall;
                        s.image_yscale = 1;
                        other.x = x;
                        other.y = y - 7;
                        other.ghost_x = other.x;
                        other.ghost_y = other.y;
                        s = instance_create(other.x, other.y, oEfBullet2);
                        s.sprite_index = sEfRecall;
                        s.image_yscale = 1;
                        alarm[0] = 1;
                    }
                }
                use[0] = 417;
                use[1] = 805;
                use[2] = "Place a marble gate. Teleport back to the gate by activating again.";
            }
            else
            {
                alarm[0] = 120;
            }
            break;
        case 414:
            s = instance_create(x, y, oEfDecoy);
            s.alarm[1] = 480 * (t + 1);
            s.image_index = class - 1;
            break;
        case 423:
            repeat (t + 1)
            {
                with (instance_create(x, y - 3, oEfBrain))
                {
                    direction = (90 - (60 * other.image_xscale) - 6) + random(12);
                    speed = 2.5;
                    parent = other.id;
                    team = other.team;
                }
            }
            break;
        case 425:
            if (oInit.coop != 2 || global.host)
            {
                var tbomb = instance_create(x, y - 10, oEfBomb);
                tbomb.value = ceil(oHUD.gold / 2) * (t + 1);
                if (oInit.coop == 2)
                {
                    server_message_send(0, 29, 15, tbomb.x, tbomb.y, tbomb.value);
                }
            }
            oHUD.gold *= 0.5;
            break;
        case 419:
            caster_play(158, global.volume, 1);
            hp = min(maxhp, hp + (maxhp * 0.5 * (t + 1)));
            s = instance_create(x, y, oEfDamage);
            s.critical = 0;
            s.damage = ceil(maxhp * 0.5 * (t + 1));
            s.team = "heal";
            part_particles_create(global.below, x, y, global.pHeal, 35);
            break;
        case 426:
            alarm[0] = 60 * use_cooldown * 2;
            if (not_client())
            {
                var tcap = 0;
                var tcap_max = 10;
                with (pChest)
                {
                    if (point_distance(x, y, other.x, other.y) < 600 && active == 0)
                    {
                        if (other.firework != 0 && tcap < tcap_max)
                        {
                            tcap++;
                            repeat (3 + (other.firework * 3))
                            {
                                s = instance_create(x, y, oEfFirework);
                                s.parent = other.id;
                                s.team = "playerproc";
                                s.damage = s.parent.damage * 3;
                            }
                            caster_play(124, global.volume, 1.5);
                        }
                        active = 1;
                        if (object_index == oChest5 && (oInit.coop != 2 || global.my_player == other.id))
                        {
                            achievement_progress(39, 1);
                        }
                        server_message_send(0, 19, other.object_index, other.m_id, other.x, other.y, object_index, m_id, 1, 1);
                    }
                }
            }
            break;
        case 427:
            caster_play(69, global.volume, 1);
            s = instance_create(x, y, oEfDamage);
            s.damage = ceil(hp * 0.25);
            s.team = "enemy";
            hp *= 0.75;
            if (instance_exists(pEnemy))
            {
                with (instance_nearest(x, y, pEnemy))
                {
                    s = instance_create(x, y, oEfDamage);
                    s.damage = ceil((irandom_range(380, 400) * ((t * 0.5) + 1) * other.maxhp) / 100);
                    s.team = "playerproc";
                    lastHp = hp;
                    hp -= ((400 * ((t * 0.5) + 1) * other.maxhp) / 100);
                }
            }
            s = instance_create(x, y - 10, oEfBullet2);
            s.sprite_index = sEfDoll;
            s.image_speed = 0.2;
            s.image_yscale = 1;
            break;
        case 428:
            caster_play(55, global.volume, 1);
            with (instance_create(x, y, oBuff))
            {
                parent = other.id;
                gold_on_hit = 1 * (t + 1);
                sprite_index = sPBlank;
                alarm[0] = 840;
            }
            with (instance_create(x, y, oCustomBar))
            {
                parent = other.id;
                time = 840;
                maxtime = 840;
                image_index = 3;
                barColor = 9692906;
            }
            break;
        case 429:
            if (oInit.coop != 2 || global.host)
            {
                s = instance_create(x, y, oEfMissileBox);
                s.parent = id;
                s.co = 2;
                s.bullets = 12 * (t + 1);
                s.sync = 1;
            }
            break;
        case 430:
            caster_play(119, global.volume, 1);
            i = -3 * (t + 1);
            while (i <= (3 * (t + 1)))
            {
                s = instance_create(x + (i * 10), y, oEfMine);
                s.damage = damage * 4;
                i += 1;
            }
            break;
        case 431:
            with (instance_create(x, y, oBuff))
            {
                parent = other.id;
                lifesteal = 9 * (t + 1);
                image_index = 2;
                alarm[0] = 600;
            }
            with (instance_create(x, y, oCustomBar))
            {
                parent = other.id;
                time = 600;
                maxtime = 600;
                image_index = 0;
            }
            break;
        case 432:
            with (instance_create(x, y, oBuff))
            {
                parent = other.id;
                damage = 10;
                attack_speed = 0.4 * (t + 1);
                image_index = 3;
                alarm[0] = 480;
            }
            with (instance_create(x, y, oCustomBar))
            {
                parent = other.id;
                time = 480;
                maxtime = 480;
                image_index = 1;
                barColor = 16777215;
            }
            break;
        case 433:
            caster_play(35, global.volume, 1);
            s = instance_create(x, y, oEfBubbleShield);
            s.alarm[0] = 480 * (t + 1);
            s.parent = id;
            invincible = 15000;
            break;
        case 434:
            sp = 1 * (t + 1);
            sp_dur = 900;
            alarm[0] = 100 * use_cooldown;
            break;
        case 435:
            audio_play_sound(wWatch, 20, true);
            audio_pause_sound(global.music_id);
            global.time_stop += (420 * (t + 1));
            alarm[0] = 60 * use_cooldown * 1.5;
            break;
        case 436:
            s = instance_create(x, y, oEfLantern);
            s.alarm[1] = 600 * (t + 1);
            break;
        case 437:
            caster_play(105, global.volume, 1);
            if (not_client())
            {
                with (pEnemy)
                {
                    if (object_get_parent(object_index) != 323 && object_get_parent(object_index) != 324 && point_distance(x, y, other.x, other.y) < 600)
                    {
                        repeat (t + 1)
                        {
                            global.director.ghost_count += 1;
                            target = -5;
                            s = instance_create(x, y, object_index);
                            s.team = "player";
                            s.ghost = 1;
                            s.exp_worth = 0;
                            with (s)
                            {
                                damage *= 0.7;
                                hp *= 1;
                                death_timer = 900;
                                image_xscale = other.image_xscale;
                                image_yscale = other.image_yscale;
                            }
                            if (oInit.coop == 2 && global.host)
                            {
                                s.m_id = set_m_id(s.id);
                                server_message_send(0, 40, s.object_index, s.m_id, s.x, s.y, 0.7, 1);
                            }
                        }
                    }
                }
            }
            break;
        case 438:
            caster_play(71, global.volume, 0.7);
            if (not_client() == 1)
            {
                i = -1 * (t + 1);
                while (i <= (1 * (t + 1)))
                {
                    for (j = -1; j <= 1; j += 2)
                    {
                        with (instance_create(x, y - 800, oDroneDisp))
                        {
                            xx = other.i * 20;
                            yy = other.j * 20;
                            master = other.id;
                            m_id = set_m_id(id);
                            server_message_send(0, 31, object_index, m_id, x, y, master.m_id, xx, yy);
                        }
                    }
                    i += 2;
                }
            }
            break;
        case 439:
            with (pDrone)
            {
                hp = maxhp;
                with (instance_create(x, y, oEfCircle))
                {
                    image_blend = #7EB686;
                    radius = 5;
                }
            }
            s = instance_create(x, y - 10, oEfBullet2);
            s.sprite_index = sEfRepair;
            s.image_speed = 0.2;
            s.image_yscale = 1;
            caster_play(70, global.volume, 2);
            break;
        case 463:
            alarm[0] = 30 * use_cooldown;
            s = instance_create(x, y, oEfMissileBox);
            s.parent = id;
            s.co = 2;
            s.bullets = 6 * (t + 1);
            s.jelly = 1;
            break;
        case 440:
            alarm[0] = 180 * use_cooldown;
            repeat (t + 1)
            {
                instance_create(x, y, oEfChestRain);
            }
            break;
        case 424:
            for (i = 0; i < (t + 1); i += 1)
            {
                s = instance_create(x + (i * 10), y, oEfSawmerang);
                s.direction = (90 - (90 * image_xscale)) + (180 * i);
                s.damage = damage * 5;
                s.true_damage = damage * 5;
                s.parent = id;
            }
            break;
        case 441:
            s = instance_create(x, y, oEfBlizzard);
            s.alarm[0] = 480 * (t + 1);
            break;
        case 415:
            alarm[0] = 60 * use_cooldown * 1.5;
            s = instance_create(x, y, oEfMeteorShower);
            s.alarm[0] = 480 * (t + 1);
            break;
    }
    return tuse_index;
}
return 0;
