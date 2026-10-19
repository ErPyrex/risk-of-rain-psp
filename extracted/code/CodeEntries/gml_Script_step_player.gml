if (!point_in_rectangle(x, y, 0, 0, room_width, room_height))
{
    outside_screen += 1;
}
if (outside_screen >= 90)
{
    outside_screen = 0;
    instance_activate_all();
    caster_play(157, global.volume, 1);
    var tobb = instance_nearest(x, y, pRecover);
    x = tobb.x;
    y = tobb.y - 6;
    s = instance_create(x, y, oEfBullet2);
    s.sprite_index = sEfRecall;
    s.image_yscale = 1;
}
var tmove_change = 0;
tskill_change = 0;
var tused_item = 0;
if ((oInit.coop == 2 && id == global.my_player) || oInit.coop != 2)
{
    if (alarm[7] != -1 && stunned == 0)
    {
        stunned = 1;
        s = instance_create(x, y, oEfStun);
        s.parent = id;
    }
    if (control(global.left_key, 1, 0) == 1)
    {
        if (oInit.coop == 2 && moveLeft == 0)
        {
            tmove_change = 1;
        }
        moveLeft = 1;
    }
    else
    {
        if (oInit.coop == 2 && moveLeft == 1)
        {
            tmove_change = 1;
        }
        moveLeft = 0;
    }
    if (control(global.right_key, 2, 0) == 1)
    {
        if (oInit.coop == 2 && moveRight == 0)
        {
            tmove_change = 1;
        }
        moveRight = 1;
    }
    else
    {
        if (oInit.coop == 2 && moveRight == 1)
        {
            tmove_change = 1;
        }
        moveRight = 0;
    }
    if (control(global.up_key, 3, 0) == 1)
    {
        if (oInit.coop == 2 && ropeUp == 0 && activity == 30)
        {
            tmove_change = 1;
        }
        ropeUp = 1;
    }
    else
    {
        if (oInit.coop == 2 && ropeUp == 1 && activity == 30)
        {
            tmove_change = 1;
        }
        ropeUp = 0;
    }
    if (control(global.down_key, 4, 0) == 1)
    {
        if (oInit.coop == 2 && ropeDown == 0 && activity == 30)
        {
            tmove_change = 1;
        }
        ropeDown = 1;
    }
    else
    {
        if (oInit.coop == 2 && ropeDown == 1 && activity == 30)
        {
            tmove_change = 1;
        }
        ropeDown = 0;
    }
    if (control(global.jump_key, 5, 0) == 1)
    {
        if (oInit.coop == 2 && moveUpHold == 0)
        {
            tmove_change = 1;
        }
        moveUpHold = 1;
    }
    else
    {
        if (oInit.coop == 2 && moveUpHold == 1)
        {
            tmove_change = 1;
        }
        moveUpHold = 0;
    }
    if (control(global.jump_key, 5, 1) == 1)
    {
        moveUp = 1;
    }
    else
    {
        moveUp = 0;
    }
    if (control(global.use_key, 10, 0) == 1)
    {
        tused_item = use_item(0, -1);
    }
    if (control(global.z_key, 6, 0) == 1)
    {
        z_skill = 1;
    }
    else
    {
        z_skill = 0;
    }
    if (control(global.x_key, 7, 0) == 1)
    {
        x_skill = 1;
    }
    else
    {
        x_skill = 0;
    }
    if (control(global.c_key, 8, 0) == 1)
    {
        c_skill = 1;
    }
    else
    {
        c_skill = 0;
    }
    if (control(global.v_key, 9, 0) == 1)
    {
        v_skill = 1;
    }
    else
    {
        v_skill = 0;
    }
}
if (ropeUp == 1)
{
    if (activity == 30)
    {
        jump_count = 0;
        image_index += 0.1;
        if ((y - min(1 * pHmax, 3) - 5) < rope_parent.y)
        {
            if (instance_place(x, rope_parent.y - 8, pBlock) == -4)
            {
                if ((y - min(1 * pHmax, 3) - 5) < (rope_parent.y - 13))
                {
                    if (!get_collision_rec(x - 4, y - 5, x + 4, y + 4))
                    {
                        activity = 0;
                        activity_type = 0;
                        if (id == global.my_player && oInit.coop == 2)
                        {
                            tmove_change = 1;
                        }
                    }
                }
                else
                {
                    y -= min(1 * pHmax, 3);
                }
            }
            else
            {
                y = rope_parent.y + 5;
            }
        }
        else
        {
            y -= min(1 * pHmax, 3);
        }
    }
    else if (activity_type == 0)
    {
        var tu = collision_line_advanced(xprevious, yprevious - 5, x + ((pHmax + 3) * image_xscale), y - 5, 42, 0, 1);
        if (instance_exists(tu) && activity == 0)
        {
            if (oInit.coop == 2)
            {
                tmove_change = 1;
            }
            rope_parent = tu;
            image_speed = 0;
            sprite_index = sprite_climb;
            activity_type = 2;
            activity = 30;
            x = tu.x + 1;
            y = round(y + 1);
            pHspeed = 0;
            pVspeed = 0;
        }
    }
}
if (ropeDown == 1)
{
    if (activity == 30)
    {
        jump_count = 0;
        image_index += 0.1;
        if ((y + min(1 * pHmax, 3) + 6) > (rope_parent.y + (rope_parent.height_box * 16)))
        {
            y = (rope_parent.y + (rope_parent.height_box * 16)) - 6;
            for (i = -1; i <= 1; i += 1)
            {
                if (get_collision_rec((x + (i * 3)) - 4, y - 5, x + (i * 3) + 4, y + 5) == 0)
                {
                    x += (i * 3);
                    activity = 0;
                    activity_type = 0;
                    if (id == global.my_player && oInit.coop == 2)
                    {
                        tmove_change = 1;
                    }
                    break;
                }
            }
        }
        else
        {
            y += min(1 * pHmax, 3);
        }
    }
    else if (activity_type == 0)
    {
        var tu = collision_line_advanced(xprevious, yprevious + 7, x + (pHmax * image_xscale), y + 7, 42, 0, 1);
        if (instance_exists(tu) && activity == 0)
        {
            if ((y + 6) < (tu.y + (tu.height_box * 16)))
            {
                if (oInit.coop == 2)
                {
                    tmove_change = 1;
                }
                rope_parent = tu;
                image_speed = 0;
                sprite_index = sprite_climb;
                activity_type = 2;
                activity = 30;
                x = tu.x + 1;
                y = round(y + 1);
                pHspeed = 0;
                pVspeed = 0;
            }
        }
    }
}
if (oInit.coop == 2 && global.my_player == id)
{
    var tru = ropeUp;
    var trd = ropeDown;
    if (tmove_change)
    {
        client_message_send(0, x, y, moveLeft, moveRight, moveUp, moveUpHold, tru, trd);
        server_message_send(0, 0, object_index, m_id, x, y, moveLeft, moveRight, moveUp, moveUpHold, tru, trd);
    }
}
if (activity == 30 && moveUp == 1)
{
    moveUp = 0;
    var tt;
    if (moveLeft == 1)
    {
        tt = -6;
    }
    else if (moveRight == 1)
    {
        tt = 4;
    }
    else
    {
        tt = 0;
    }
    if (get_collision_rec((x - 4) + tt, y - 5, x + 4 + tt, y + 5) == 0)
    {
        activity = 0;
        activity_type = 0;
        x += tt;
        pVspeed = -pVmax;
    }
}
maxhp = min(ceil(maxhp_base * percent_hp), 9999);
if (maxhp == 9999 && oInit.coop != 2)
{
    global.director.item_tier1[12, 1] = 0;
    global.director.item_tier2[10, 1] = 0;
}
if (maxhp >= 650 && (oInit.coop != 2 || global.my_player == id))
{
    achievement_progress(38, 1);
}
if (scarf != 0 && random(100) < min(10 + ((scarf - 1) * 3), 25))
{
    invincible = max(1, invincible);
    scarfed = 1;
}
else
{
    scarfed = 0;
}
if (hourglass != 0 && dead == 0)
{
    if (hourglass_cd == 1)
    {
        for (i = 0; i <= item_count; i += 1)
        {
            if (item[i, 0] == 752)
            {
                item[i, 0] = 751;
                item[i, 2] = "Falling to low health stops time.";
                break;
            }
        }
    }
    hourglass_cd = max(hourglass_cd - 1, 0);
    if (hp < (maxhp * 0.2) && hourglass_cd == 0 && (oInit.coop != 2 || id == global.my_player))
    {
        if (!audio_is_playing(wWatch))
        {
            audio_play_sound(wWatch, 20, true);
        }
        audio_pause_sound(global.music_id);
        hourglass_cd = 25200;
        global.time_stop = max(min(180 + (60 * (hourglass - 1)), 600), global.time_stop);
        for (i = 0; i <= item_count; i += 1)
        {
            if (item[i, 0] == 751)
            {
                item[i, 0] = 752;
                item[i, 2] = "This item is recharging.";
                break;
            }
        }
        if (oInit.coop == 2 && id == global.my_player)
        {
            server_message_send(0, 41, object_index, m_id, global.time_stop);
            client_message_send(41, global.time_stop);
        }
    }
}
if (cell != 0)
{
    attack_speed -= cell_bonus_last;
    attack_speed += (min(0.9, 0.4 + ((cell - 1) * 0.2)) * (1 - (hp / maxhp)));
    cell_bonus_last = min(0.9, 0.4 + ((cell - 1) * 0.2)) * (1 - (hp / maxhp));
}
if (tentacle != 0)
{
    if (instance_exists(tentacle_id) == 0 && tentacle_cd == 0 && free == 0 && activity != 30)
    {
        tentacle_id = instance_create(0, 0, oImpFriend);
        with (tentacle_id)
        {
            parent = other.id;
        }
    }
}
if (gauss != 0 && !dead)
{
    if (activity != 0 && activity != 30 && activity != 95)
    {
        gauss_charge = min(100, gauss_charge + (0.13 * gauss));
        if (gauss_charge == 100)
        {
            gauss_charge = 0;
            oHUD.alarm[0] = 12;
            var tw = 1600;
            var th = 64;
            fire_explosion(2, x, y + 8, 20, 304, 2, -1, tw / 39, th / 9);
            caster_play(87, global.volume, random_range(0.7, 0.8));
            bullet.team = "playerproc";
            with (instance_create(x, y, oEfGauss))
            {
                width_x = tw * other.image_xscale;
            }
        }
    }
}
gold_cooldown = max(0, gold_cooldown - 1);
sp_dur = max(0, sp_dur - 1);
if (sp_dur == 0)
{
    sp = 0;
}
if (oTeleporter.active < 4)
{
    oHUD.gold += gp5;
    oHUD.total_gold += gp5;
}
hp = max(0, min(hp + hp_regen, maxhp));
if (hp < lastHp && shield > 0)
{
    shield -= min(shield, maxhp - hp);
    hp = lastHp;
    shield_cooldown = 420;
}
if (lastHp > hp)
{
    var hh = round((oInit.image_index - last_hit_time) * 0.01667);
    if (hh > oInit.trophy_stats[12] && last_hit_time != 0)
    {
        oInit.trophy_stats[12] = hh;
        oInit.trophy_stats_new[12] = 1;
        oInit.trophy_unlocked = 1;
        last_hit_time = oInit.image_index;
    }
    still_timer = 0;
    with (oEfMushroom)
    {
        if (x == other.x)
        {
            dead = 1;
        }
    }
    shield_cooldown = 420;
    if (medkit != 0)
    {
        medkit_timer = 0;
    }
    if (spikestrip != 0)
    {
        caster_play(132, global.volume, 2);
        with (instance_create(x, y, oEfSpikestrip))
        {
            alarm[0] = 120 + ((other.spikestrip - 1) * 60);
            move_contact_solid(270, -1);
            spikestrip = other.spikestrip;
        }
    }
    if (reflector != 0)
    {
        if (reflecting == 0)
        {
            reflector_charge += 1;
            if (reflector_charge == 6)
            {
                armor += 1000;
                reflecting = min(240 + (60 * (reflector - 1)), 480);
                caster_play(35, global.volume, 2);
            }
        }
    }
}
if (reflecting != 0)
{
    reflecting = max(0, reflecting - 1);
    if (reflecting_hit == 1 && instance_exists(pEnemy))
    {
        if (distance_to_object(instance_nearest(x, y, pEnemy)) < 200)
        {
            caster_play(137, global.volume, random_range(0.9, 1.15));
            fire_bullet(0, x, y, 0, 4, 300, 528, point_direction(x, y, instance_nearest(x, y, pEnemy).x, instance_nearest(x, y, pEnemy).y), 1, 1, -1);
            bullet.laser = 3;
            reflecting_hit = 0;
        }
    }
    if (reflecting == 0)
    {
        armor -= 1000;
        reflector_charge = 0;
    }
}
if (tesla != 0 && random(100) < 3 && dead == 0)
{
    t = instance_create((x - 10) + random(20), (y - 10) + random(20), oChainLightning);
    t.team = "playerproc";
    t.damage = ceil(damage * 1.2 * (1 + ((tesla - 1) * 0.5)));
    t.blend = 14378680;
}
shield_cooldown = max(0, shield_cooldown - 1);
medkit_timer = min(14, medkit_timer + 0.15);
medkit_cd = max(0, medkit_cd - 1);
jetpack_cd = max(0, jetpack_cd - 1);
tentacle_cd = max(0, tentacle_cd - 1);
if (jetpack_cd == 0 && jetpack > 0)
{
    jetpack_fuel = min(100 + (50 * (jetpack - 1)), jetpack_fuel + ((100 + (50 * (jetpack - 1))) * 0.01));
}
if (floor(medkit_timer) == 10 && medkit_cd == 0)
{
    caster_play(158, global.volume, 0.7);
    hp = min(hp + (medkit * 10), maxhp);
    f = instance_create(x + 5, y - 10, oEfDamage);
    f.damage = medkit * 10;
    f.team = "heal";
    medkit_cd = 30;
}
if (random(100) < 0.5 && instance_number(oEfMark) < mark && instance_number(pEnemy) >= 1)
{
    with (instance_create(x, y, oEfMark))
    {
        parent = instance_find(pEnemy, floor(random(instance_number(pEnemy))));
        parent_2 = other.id;
    }
}
if (shield_cooldown == 0)
{
    if (shield != maxshield)
    {
        shield = maxshield;
        caster_play(145, global.volume, 1);
    }
    hp = max(0, min(hp + egg_regen, maxhp));
}
if (true_invincible == 1)
{
    hp = max(hp, lastHp);
}
if (dead == 0 && ((hp <= 0 && (oInit.coop != 2 || id == global.my_player)) || force_death))
{
    event_user(6);
    force_death = 0;
}
if (dead == 1)
{
    hp = 0;
}
if (lastHp != hp && (lastHp - hp) > 1)
{
    if (mine != 0 && (random(100) * (hp / maxhp)) < 15 && (oInit.coop != 2 || global.host))
    {
        caster_play(119, global.volume, 1);
        for (i = 0; i < mine; i += 1)
        {
            s = instance_create(x + (i * 8), y, oEfMine);
            s.damage = damage * 4;
            if (oInit.coop == 2)
            {
                server_message_send(0, 29, 11, x, y, oEfMine.object_index, s.damage, 0);
            }
        }
    }
    if (poison_mine != 0 && (random(100) * (hp / maxhp)) < 15 && (oInit.coop != 2 || global.host))
    {
        s = instance_create(x + (i * 8), y, oEfPoisonMine);
        s.damage = damage * 1.5;
        s.poison = poison_mine;
        if (oInit.coop == 2)
        {
            server_message_send(0, 29, 11, x, y, oEfPoisonMine.object_index, s.damage, poison_mine);
        }
    }
    if (jackbox != 0 && (random(100) * (hp / maxhp)) < 10)
    {
        s = instance_create(x, (y - sprite_yoffset) + sprite_height, oEfSparks);
        s.image_yscale = 1;
        s.sprite_index = sEfJackBox;
        fire_explosion(0, s.x, s.y - 20, 0.1, 292, 2, -1, 4, 3);
        bullet.fear = jackbox;
    }
    if (fireshield >= 1 && abs(lastHp - hp) > (maxhp * 0.1))
    {
        oHUD.alarm[0] = 8;
        caster_play(123, global.volume, 2);
        fire_explosion(0, x, y, 4 + ((fireshield - 1) * 2), 292, 2, 908, 3, 1);
        bullet.knockback = 5 + ((fireshield - 1) * 1);
        bullet.image_yscale = 1;
    }
}
if (xprevious == x && yprevious == y && activity == 0 && lastHp <= hp)
{
    still_timer += 1;
}
else
{
    still_timer = 0;
}
if (still_timer >= 120 && instance_place(x, y, oEfMushroom) == -4 && mushroom != 0)
{
    caster_play(73, global.volume, random_range(0.8, 1.2));
    with (instance_create(x, y + 5, oEfMushroom))
    {
        value = ceil(other.maxhp * 0.045) * other.mushroom;
        parent = other.id;
    }
}
lastHp = hp;
if (expyy >= maxexp && (oInit.coop != 2 || global.my_player == id))
{
    event_user(5);
    if (oInit.coop == 2)
    {
        client_message_send(24);
        server_message_send(0, 24, object_index, m_id);
    }
}
return tused_item;
