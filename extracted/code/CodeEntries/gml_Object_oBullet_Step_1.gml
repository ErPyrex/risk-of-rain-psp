image_angle = direction;
x += lengthdir_x(bullet_speed, direction);
y += lengthdir_y(bullet_speed, direction);
if (precise == 1)
{
    while (1)
    {
        s = collision_line_advanced(xprevious, yprevious, x, y, 21, 0, 0);
        if (s < 0)
        {
            if (laser == 1)
            {
                with (instance_create(xstart, ystart, oEfLaserLine))
                {
                    xend = other.x;
                    yend = other.y;
                }
            }
            else if (laser == 2)
            {
                with (instance_create(xprevious, yprevious, oEfLaserLine))
                {
                    xend = global.collision_x;
                    yend = global.collision_y;
                    rate = 0.1;
                    image_blend = c_yellow;
                }
            }
            else if (laser == 3)
            {
                with (instance_create(xprevious, yprevious, oEfLaserLine))
                {
                    xend = global.collision_x;
                    yend = global.collision_y;
                    rate = 0.1;
                    image_blend = c_teal;
                }
            }
            break;
        }
        else if (s.solid == 1)
        {
            if (specific_target == -10)
            {
                if (hit == 0)
                {
                    hit = 1.5;
                }
                if (laser == 1)
                {
                    with (instance_create(xprevious, yprevious, oEfLaserLine))
                    {
                        xend = global.collision_x;
                        yend = global.collision_y;
                    }
                }
                else if (laser == 2)
                {
                    with (instance_create(xprevious, yprevious, oEfLaserLine))
                    {
                        xend = global.collision_x;
                        yend = global.collision_y;
                        rate = 0.1;
                        image_blend = c_yellow;
                    }
                }
                else if (laser == 3)
                {
                    with (instance_create(xprevious, yprevious, oEfLaserLine))
                    {
                        xend = global.collision_x;
                        yend = global.collision_y;
                        rate = 0.1;
                        image_blend = c_teal;
                    }
                }
                x = global.collision_x;
                y = global.collision_y;
                d = instance_create(x, y, oEfSparks);
                d.sprite_index = damage_index;
                d.image_xscale = -sign(direction - 90);
                s.active += 1;
                if (explosive_shot != 0)
                {
                    fire_explosion(3, global.collision_x, global.collision_y, explosive_shot / 5, 292, 2, 883, 1.5, 1);
                    bullet.team += "proc";
                    caster_play(76, global.volume, 1);
                }
                if (explosion_2 != 0)
                {
                    fire_explosion(3, global.collision_x, global.collision_y, explosion_2 / 5, 292, 2, 38, 1, 1);
                    bullet.team += "proc";
                }
                if (aoe == 0)
                {
                    instance_destroy();
                }
                break;
            }
            else
            {
                instance_deactivate_object(s);
            }
        }
        else
        {
            if (s.team != team && (s.team + "proc") != team && s.invincible == 0 && (specific_target == -10 || s == specific_target))
            {
                if (laser == 3)
                {
                    with (instance_create(xprevious, yprevious, oEfLaserLine))
                    {
                        xend = global.collision_x;
                        yend = global.collision_y;
                        rate = 0.03;
                        image_blend = c_teal;
                    }
                }
                with (s)
                {
                    if (armor >= 0)
                    {
                        other.damage = ceil((other.damage * 100) / (100 + armor));
                        other.damage_fake = ceil((other.damage_fake * 100) / (100 + armor));
                    }
                    else
                    {
                        other.damage = ceil(other.damage * (2 - (100 / (100 - armor))));
                        other.damage_fake = ceil(other.damage_fake * (2 - (100 / (100 - armor))));
                    }
                }
                with (s)
                {
                    if (bunker > 0 && sign(other.xprevious - x) == image_xscale)
                    {
                        if ((oInit.coop == 2 && global.my_player) || oInit.coop != 2)
                        {
                            achievement_progress(15, damage);
                        }
                        other.damage = 0;
                        other.damage_fake = 0;
                        other.blocked = 1;
                        d = instance_create(global.collision_x, global.collision_y - 15, oEfDodge);
                        d.text = 4;
                    }
                }
                hit_number += 1;
                with (s)
                {
                    if (!reflecting == -1)
                    {
                        if (reflecting != 0)
                        {
                            reflecting_hit = 1;
                        }
                    }
                }
                with (oSniperDrone)
                {
                    if (tt == other.s && !other.critical && other.parent == master)
                    {
                        other.critical = 1;
                        other.damage *= 2;
                        other.damage_fake *= 2;
                    }
                }
                if (snare)
                {
                    apply_buff(s.id, 17, 30 + (30 * snare));
                    var t = instance_create(x, y, oEfFlash);
                    t.parent = s;
                    t.image_blend = c_white;
                    t.rate = 0.05;
                }
                if (sticky != 0)
                {
                    var t = instance_create(x, y, oEfSticky);
                    t.damage = damage * (1 + (sticky * 0.4));
                    t.parent = s;
                    t.xx = random_range(-5, 5);
                    t.yy = random_range(-5, 5);
                    if (oInit.coop == 2 && global.host)
                    {
                        server_message_send(0, 29, 13, t.parent.object_index, t.parent.m_id, t.damage);
                    }
                    sticky = 0;
                }
                if (scope != 0 && (oInit.coop != 2 || global.host))
                {
                    if (object_get_parent(s.object_index) != 323)
                    {
                        scope = 0;
                        var t = instance_create(x, y, oEfScope);
                        t.target = s;
                        if (oInit.coop == 2)
                        {
                            server_message_send(0, 29, 5, x, y, s.object_index, s.m_id);
                        }
                    }
                }
                if (crowbar != 0 && s.hp >= (s.maxhp * 0.8))
                {
                    if (crowbar_hit == 0)
                    {
                        damage = ceil(damage * (1.5 + ((crowbar - 1) * 0.3)));
                        damage_fake = ceil(damage_fake * (1.5 + ((crowbar - 1) * 0.3)));
                        crowbar_hit = 1;
                    }
                    with (instance_create(s.x, s.y, oEfSparks))
                    {
                        sprite_index = sEfCrowbar;
                    }
                }
                if (nugget != 0)
                {
                    repeat (2)
                    {
                        var t = instance_create(s.x, s.y, oEfNugget);
                        t.value = nugget * 6;
                    }
                    nugget = 0;
                }
                if (spark != 0)
                {
                    if (oInit.coop != 2 || global.host)
                    {
                        for (i = 0; i < (spark + 1); i += 1)
                        {
                            var t = instance_create(s.x + (i * 26 * -image_xscale), s.y, oWispBMine);
                            t.alarm[0] = 50 + (i * 5);
                            t.damage = damage * 2;
                            t.team = team + "proc";
                            t.parent = id;
                            if (oInit.coop == 2)
                            {
                                server_message_send(0, 29, 1, t.x, t.y, t.damage, i, t.team);
                            }
                        }
                    }
                    spark = 0;
                }
                if (explosive_shot != 0)
                {
                    fire_explosion(3, global.collision_x, global.collision_y, explosive_shot / 5, 292, 2, 883, 1.5, 1);
                    bullet.team += "proc";
                    caster_play(76, global.volume, 1);
                }
                if (explosion_2 != 0)
                {
                    fire_explosion(3, global.collision_x, global.collision_y, explosion_2 / 5, 292, 2, 38, 1, 1);
                    bullet.team += "proc";
                    bullet.climb = climb;
                }
                if (thallium != 0)
                {
                    if (oInit.coop != 2 || global.host)
                    {
                        apply_buff(s.id, 9, 180);
                        if (oInit.coop == 2)
                        {
                            server_message_send(0, 29, 3, s.object_index, s.m_id, 9, 180);
                        }
                    }
                }
                if (knockback != 0 || knockback_variable != 0)
                {
                    if (oInit.coop != 2 || global.host)
                    {
                        s.knockback_value = max(knockback, max(knockback_variable - (abs(s.x - xstart) * 0.05), 1));
                    }
                    if (knockback_glove == 1)
                    {
                        with (instance_create(s.x, s.y, oEfBullet2))
                        {
                            sprite_index = sEfPunch;
                            image_yscale = 1;
                        }
                    }
                }
                if (plasma > 0 && (oInit.coop != 2 || global.host))
                {
                    var t = instance_create(x, y, oEfChain);
                    t.parent = parent;
                    t.target = s;
                    t.coeff = 0.6;
                    plasma = -5;
                    if (oInit.coop == 2)
                    {
                        server_message_send(0, 29, 6, parent_m_id, s.object_index, s.m_id, t.coeff);
                    }
                }
                if (axe != 0 && s.hp <= (s.maxhp * min(0.1 + (0.04 * axe), 0.35)) && !critical)
                {
                    critical = 1;
                    damage *= 2;
                    damage_fake *= 2;
                }
                if (freeze != 0)
                {
                    if (oInit.coop != 2 || global.host)
                    {
                        apply_buff(s, 7, 180 + ((30 * freeze) - 1));
                        if (oInit.coop == 2)
                        {
                            server_message_send(0, 29, 3, s.object_index, s.m_id, 7, 180 + ((30 * freeze) - 1));
                        }
                    }
                }
                if (blaze != 0)
                {
                    with (instance_create(x, y, oEfBlaze))
                    {
                        parent = other.s;
                        damage = other.damage * 0.3 * other.blaze;
                        team = other.team;
                    }
                }
                if (bleed != 0 && (oInit.coop != 2 || global.host))
                {
                    g = instance_create(x, y, oDot);
                    g.parent = s;
                    g.damage = ceil(damage * (0.35 + ((bleed - 1) * 0.12)));
                    g.ticks = 4;
                    with (instance_create(s.x, s.y, oEfBullet2))
                    {
                        sprite_index = sEfSlash;
                        image_yscale = 1;
                    }
                    if (oInit.coop == 2)
                    {
                        server_message_send(0, 29, 8, g.parent.object_index, g.parent.m_id, g.damage);
                    }
                }
                if (stun != 0)
                {
                    if (oInit.coop != 2 || global.host)
                    {
                        s.alarm[7] = 90 * stun;
                    }
                    if (stun_ef)
                    {
                        with (instance_create(global.collision_x, global.collision_y, oEfSparks))
                        {
                            sprite_index = sSparks11;
                        }
                    }
                }
                if (fear != 0)
                {
                    with (s)
                    {
                        if (is_string(state))
                        {
                            if (state != "feared")
                            {
                                state = "feared";
                                var t = instance_create(x, y, oEfFear);
                                t.parent = id;
                                t.alarm[0] = (1 + other.fear) * 60;
                            }
                        }
                    }
                }
                if (gold_gun != 0)
                {
                    var gg = ceil(damage * (min(1, (gold_gun * gold) / (700 * power(global.enemy_buff, global.hp_co))) * 0.4));
                    s.hp -= gg;
                    draw_damage(other.s.x - 16, other.s.y - sprite_get_yoffset(other.s.sprite_idle) - 4 - other.climb, global.handlerDamage, gg, critical, 10019560, 3585993);
                }
                if (sniper_bonus != 0)
                {
                    var col;
                    if (sniper_bonus == 0.6)
                    {
                        col = 16297453;
                    }
                    else
                    {
                        col = 13135783;
                    }
                    s.hp -= damage * sniper_bonus;
                    draw_damage(other.s.x, other.s.y - sprite_get_yoffset(other.s.sprite_idle) - 12 - other.climb, global.handlerDamage, ceil(damage * sniper_bonus), critical, col, col);
                }
                if (gold_on_hit != 0)
                {
                    repeat (gold_on_hit)
                    {
                        g = instance_create((s.x - 10) + random(10), (s.y - 10) + random(10), oEfGold);
                        g.direction = 180 - random(180);
                        g.speed = random_range(1, 4);
                        g.value = gold_on_hit;
                        if (gold_on_hit >= 2)
                        {
                            g.sprite_index = sEfGold2;
                        }
                        else
                        {
                            g.sprite_index = sEfGold1;
                        }
                    }
                }
                if (slow_on_hit != 0)
                {
                    apply_buff(s, 1, 60 + (30 * (slow_on_hit - 1)));
                }
                if (sunder != 0)
                {
                    apply_buff(s, 20, 120 + (30 * (sunder - 1)));
                }
                with (s)
                {
                    if (object_index == oP && other.team != team && (other.team + "proc") != team)
                    {
                        other.hit_player = id;
                    }
                }
                hit = 1;
                s.lastHp = s.hp;
                s.hp -= damage;
                s.lasthit_x = global.collision_x;
                if (refresh_x == 1)
                {
                    if (s.hp <= 0)
                    {
                        s.blast = sign(s.x - x);
                        refresh_x = 2;
                        if (object_get_parent(s.object_index) == 323 && s.object_index != oImpM)
                        {
                            refresh_x = 3;
                        }
                    }
                    else
                    {
                        refresh_x = -1;
                    }
                }
                if (damage != 0)
                {
                    if (team == "playerproc")
                    {
                        draw_damage(other.s.x, other.s.y - sprite_get_yoffset(other.s.sprite_idle) - 4 - other.climb, global.handlerDamage, damage_fake, critical, 3585993, 3585993);
                    }
                    else
                    {
                        draw_damage(other.s.x, other.s.y - sprite_get_yoffset(other.s.sprite_idle) - 4 - other.climb, global.handlerDamage, damage_fake, critical, 16777215, 16777215);
                    }
                    d = instance_create(global.collision_x, global.collision_y, oEfSparks);
                    d.sprite_index = damage_index;
                    d.image_xscale = -sign(direction - 90);
                }
                damage = max(damage - (damage * damage_degrade), 1);
                damage_fake = max(damage_fake - (damage_fake * damage_degrade), 1);
                if (damage_degrade != 0)
                {
                    if (team == "player")
                    {
                        team = "playerproc";
                    }
                }
                if (damage_index == 299)
                {
                    damage_index = 292;
                }
                if (aoe == 1)
                {
                    instance_deactivate_object(s);
                }
                if (lightning != 0 && (oInit.coop != 2 || global.host))
                {
                    var t = instance_create(global.collision_x, global.collision_y, oChainLightning);
                    t.team = team + "proc";
                    t.damage = ceil(damage / 3) * lightning;
                    if (oInit.coop == 2)
                    {
                        server_message_send(0, 29, 9, t.x, t.y, t.damage, t.team);
                    }
                }
            }
            else
            {
                if (s.invincible > 0 && s.team != team && (s.team + "proc") != team)
                {
                    if (s.object_index == oP)
                    {
                        if (s.class == 1 && s.activity == 3 && s.hp <= damage && (oInit.coop != 2 || s.id == global.my_player))
                        {
                            achievement_progress(2, 1);
                        }
                    }
                    d = instance_create(s.x, s.y - 15, oEfDodge);
                    if (s.invincible > 1000)
                    {
                        d.text = 1;
                    }
                    if (s.object_index == objServer)
                    {
                        if (s.scarfed == 1)
                        {
                            d.text = 3;
                        }
                    }
                }
                instance_deactivate_object(s);
            }
            if (aoe == 0 && hit_number > 0)
            {
                instance_destroy();
                break;
            }
        }
    }
    instance_activate_object(pNPC);
    if (hit == 1 && instance_exists(parent))
    {
        if (blaster != 0)
        {
            caster_play(87, global.volume * 0.3, random_range(1.8, 2));
            with (instance_create(parent.x, parent.y, oEfBlaster))
            {
                direction = other.direction;
                parent = other.parent;
                team = "playerproc";
                max_bounce = 1 + other.blaster;
                climb = other.climb + 8;
            }
            blaster = 0;
        }
        if (critical && wolfblood != 0)
        {
            apply_buff(parent, 25, 180);
        }
        if (plasma == -5)
        {
            parent.plasma_count += 1;
        }
        if (refresh_x >= 2)
        {
            parent.alarm[3] = 10;
            parent.alarm[4] = 10;
            parent.alarm[5] = 10;
            parent.bonus_count += 1;
            if (refresh_x == 3 && (oInit.coop != 2 || global.my_player == parent))
            {
                achievement_progress(9, 1);
            }
        }
        else if (refresh_x == -1)
        {
            parent.bonus_count = 0;
        }
        if (critical == 1)
        {
            caster_play(63, global.volume, 1);
        }
        if (hit_player != 0)
        {
            hit_player.last_hit_number += 1;
            if (instance_exists(parent))
            {
                hit_player.last_hit = parent.object_index;
                hit_player.last_hit_name = parent.name;
            }
        }
        if (explosive_shot != 0)
        {
            caster_play(76, global.volume, 1);
        }
        if (critical == 1 && skull_ring != 0)
        {
            with (instance_create(parent.x, parent.y, oEfBullet2))
            {
                sprite_index = sEfSkull;
                image_yscale = 1;
                image_alpha = 0.5;
            }
            parent.alarm[3] = max(0, parent.alarm[3] - (60 * skull_ring));
            parent.alarm[4] = max(0, parent.alarm[4] - (60 * skull_ring));
            parent.alarm[5] = max(0, parent.alarm[5] - (60 * skull_ring));
        }
        if (horn != 0 && (global.host || oInit.coop != 2))
        {
            var t;
            with (parent)
            {
                t = instance_create(x, y, oIfritBullet);
                with (t)
                {
                    speed = 4;
                    direction = 90 - (90 * other.image_xscale);
                    image_xscale = other.image_xscale;
                    parent = other.id;
                    team = other.team;
                    damage = other.damage * 3 * (1 + ((other.horn - 1) * 0.3));
                }
            }
            if (oInit.coop == 2)
            {
                server_message_send(0, 29, 17, t.x, t.y, t.direction, t.damage);
            }
        }
        if (lifesteal != 0)
        {
            parent.hp = min(parent.maxhp, parent.hp + ((2 + ((lifesteal - 1) * 1)) * (log10(hit_number) + 1)));
            draw_damage(parent.x, parent.y - parent.sprite_yoffset, global.handlerDamage, string(ceil((2 + ((lifesteal - 1) * 1)) * (log10(hit_number) + 1))), 0, 6870916, 6870916);
        }
        if (dynamite_on_hit != 0 && hit_number != 0)
        {
            instance_create(parent.x, parent.y, oEfDyno);
        }
        if (scythe != 0 && critical == 1)
        {
            parent.hp = min(parent.maxhp, parent.hp + 8 + (2 * (scythe - 1)));
            draw_damage(parent.x, parent.y - parent.sprite_yoffset, global.handlerDamage, string(ceil(8 + (2 * (scythe - 1)))), 0, 6870916, 6870916);
        }
        if (missile != 0 && (oInit.coop != 2 || global.host))
        {
            s = instance_create(parent.x, parent.y, oEfMissile);
            s.parent = parent;
            s.damage = damage * 3;
            s.team = team + "proc";
        }
        if (missile_tri != 0 && (oInit.coop != 2 || global.host))
        {
            s = instance_create(parent.x, parent.y, oEfMissileBox);
            s.bullets = 3;
            s.co = 2;
            s.parent = parent;
        }
        if (mortar != 0 && (oInit.coop != 2 || global.host))
        {
            var t = instance_create(parent.x, parent.y, oEfMortar);
            t.damage = damage * 1.7 * mortar;
            t.direction = ((direction + (65 * image_xscale)) - 6) + random(12);
            if (oInit.coop == 2)
            {
                server_message_send(0, 29, 4, t.x, t.y, t.damage, t.direction);
            }
        }
    }
}
