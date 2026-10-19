if (alarm[0] != -1)
{
    if (other.team != team && (other.team + "proc") != team && other.invincible == 0 && hit_number < max_hit_number && hit != 2)
    {
        if ((weather == 1 && other.weather_immune == 0) || weather == 0)
        {
            with (other)
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
            with (other)
            {
                if (bunker > 0 && sign(other.xprevious - (4 * other.image_xscale) - x) == image_xscale)
                {
                    if ((oInit.coop == 2 && global.my_player) || oInit.coop != 2)
                    {
                        achievement_progress(15, damage);
                    }
                    other.damage = 0;
                    other.damage_fake = 0;
                    other.blocked = 1;
                }
            }
            if (crowbar != 0 && other.hp >= (other.maxhp * 0.8))
            {
                if (crowbar_hit == 0)
                {
                    damage = ceil(damage * (1.5 + ((crowbar - 1) * 0.3)));
                    damage_fake = ceil(damage_fake * (1.5 + ((crowbar - 1) * 0.3)));
                    crowbar_hit = 1;
                }
                with (instance_create(other.x, other.y, oEfSparks))
                {
                    sprite_index = sEfCrowbar;
                }
            }
            if (sticky != 0)
            {
                var t = instance_create(x, y, oEfSticky);
                t.damage = damage * (1 + (sticky * 0.4));
                t.parent = other.id;
                t.xx = random_range(-5, 5);
                t.yy = random_range(-5, 5);
                if (oInit.coop == 2 && global.host)
                {
                    server_message_send(0, 29, 13, t.parent.object_index, t.parent.m_id, t.damage);
                }
                sticky = 0;
            }
            if (nugget != 0)
            {
                repeat (2)
                {
                    var t = instance_create(other.x, other.y, oEfNugget);
                    t.value = nugget * 6;
                }
                nugget = 0;
            }
            if (snare != 0)
            {
                apply_buff(other.id, 17, 30 + (30 * snare));
                var t = instance_create(x, y, oEfFlash);
                t.parent = other.id;
                t.image_blend = c_white;
                t.rate = 0.05;
            }
            if (scope != 0 && (oInit.coop != 2 || global.host))
            {
                if (object_get_parent(other.object_index) != 323)
                {
                    scope = 0;
                    var t = instance_create(x, y, oEfScope);
                    t.target = -2;
                    if (oInit.coop == 2)
                    {
                        server_message_send(0, 29, 5, x, y, other.object_index, other.m_id);
                    }
                }
            }
            if (thallium != 0)
            {
                if (oInit.coop != 2 || global.host)
                {
                    apply_buff(other.id, 9, 180);
                    if (oInit.coop == 2)
                    {
                        server_message_send(0, 29, 3, other.object_index, other.m_id, 9, 180);
                    }
                }
            }
            if (plasma > 0 && (oInit.coop != 2 || global.host) && hit_number == 0)
            {
                var t = instance_create(x, y, oEfChain);
                t.parent = parent;
                t.target = other.id;
                t.coeff = 0.6;
                plasma = -5;
                if (oInit.coop == 2)
                {
                    server_message_send(0, 29, 6, parent.m_id, other.object_index, other.m_id, t.coeff);
                }
            }
            if (poison > 0)
            {
                s = instance_create(x, y, oEfPoison2);
                s.damage = ceil(damage);
                s.team = team;
                s.ticks_max = 3 + poison;
                s.parent = other.id;
            }
            hit_number += 1;
            if (bleed != 0 && (oInit.coop != 2 || global.host))
            {
                g = instance_create(x, y, oDot);
                g.parent = other.id;
                g.damage = ceil(damage * 0.35);
                g.ticks = 4;
                with (instance_create(other.x, other.y, oEfBullet2))
                {
                    sprite_index = sEfSlash;
                    image_yscale = 1;
                }
                if (oInit.coop == 2)
                {
                    server_message_send(0, 29, 8, g.parent.object_index, g.parent.m_id, g.damage);
                }
            }
            if (poison_dot != 0)
            {
                g = instance_create(x, y, oDot);
                g.parent = other.id;
                g.damage = ceil(damage * 0.2);
                g.ticks = 6;
                g.textColor = 5108425;
                with (instance_create(other.x, other.y, oEfBullet2))
                {
                    sprite_index = sEfSlash2;
                    image_yscale = 1;
                }
            }
            if (pregnate != 0)
            {
                g = instance_create(x, y, oFeralPregnate);
                g.parent = other.id;
                g.area = sprite_get_width(other.sprite_idle) * sprite_get_height(other.sprite_idle);
                g.master = parent;
                g = instance_create(x, y, oDot);
                g.parent = other.id;
                g.damage = ceil(damage * 0.35);
                g.ticks = 4;
                g.textColor = 3585993;
                with (instance_create(other.x, other.y, oEfBullet2))
                {
                    sprite_index = sEfSlash;
                    image_yscale = 1;
                }
            }
            if (axe != 0)
            {
                if (other.hp <= (other.maxhp * min(0.1 + (0.04 * axe), 0.35)) && !critical)
                {
                    critical = 1;
                    damage *= 2;
                    damage_fake *= 2;
                }
            }
            if (oil != 0)
            {
                var ti = other.id;
                apply_buff(other.id, 31, 180);
                var te = 0;
                with (oEfOil)
                {
                    if (parent == ti)
                    {
                        te = 1;
                    }
                }
                if (!te)
                {
                    with (instance_create(x, y, oEfOil))
                    {
                        parent = ti;
                    }
                }
            }
            if (fire != 0)
            {
                var ti = other.id;
                var te = 0;
                with (oEfOil)
                {
                    if (parent == ti)
                    {
                        instance_destroy();
                        te = 1;
                    }
                }
                if (te)
                {
                    apply_buff(ti, 31, 1);
                    fire_explosion(3, other.x, other.y, 0.3, 292, 2, 289, 2.5, 5);
                    bullet.fire = fire;
                    bullet.stun = 1;
                    bullet.team = "playerproc";
                    bullet.climb = 12;
                    repeat (global.graphics)
                    {
                        part_particles_create_color(global.above, ti.x - (((sprite_get_width(ti.sprite_index) / 2) - random(sprite_get_width(ti.sprite_index))) * random(1.3) * random(1.3)), ti.y - (((sprite_get_height(ti.sprite_index) / 2) - random(sprite_get_height(ti.sprite_index))) * random(1.3) * random(1.3)), global.pPoison, merge_color(c_yellow, c_red, random(1)), 1);
                    }
                    with (instance_create(x, y, oEfFlash))
                    {
                        parent = ti;
                        image_blend = c_orange;
                        rate = 0.03;
                    }
                }
            }
            if (knockback != 0)
            {
                if (oInit.coop != 2 || global.host)
                {
                    other.knockback_value = knockback;
                }
                if (knockback_glove == 1)
                {
                    with (instance_create(other.x, other.y, oEfBullet2))
                    {
                        sprite_index = sEfPunch;
                        image_yscale = 1;
                    }
                }
            }
            if (knockup != 0)
            {
                other.pVspeed = -knockup * random_range(0.9, 1);
                other.pHspeed = 0;
            }
            if (stun != 0)
            {
                if ((oInit.coop != 2 || global.host) || stun == 0.3)
                {
                    other.alarm[7] = 90;
                }
                if (stun_ef)
                {
                    with (instance_create(other.x, other.y, oEfSparks))
                    {
                        sprite_index = sSparks11;
                    }
                }
            }
            if (freeze != 0)
            {
                if (oInit.coop != 2 || global.host)
                {
                    apply_buff(other.id, 7, 180 + ((30 * freeze) - 1));
                    if (oInit.coop == 2)
                    {
                        server_message_send(0, 29, 3, other.object_index, other.m_id, 7, 180 + ((30 * freeze) - 1));
                    }
                }
            }
            if (fear != 0)
            {
                with (other)
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
            if (taunt != 0)
            {
                with (other)
                {
                    if (is_string(state))
                    {
                        if (state != "taunted")
                        {
                            state = "taunted";
                            var t = instance_create(x, y, oEfFear);
                            t.parent = id;
                            t.sprite_index = sEfTaunt;
                            t.alarm[0] = (1 + other.taunt) * 60;
                        }
                    }
                }
            }
            if (gold_gun != 0)
            {
                var gg = ceil(damage * (min(1, (gold_gun * gold) / (700 * power(global.enemy_buff, global.hp_co))) * 0.4));
                other.hp -= gg;
                draw_damage(other.x - 16, other.y - sprite_get_yoffset(other.sprite_idle) - 4 - climb, global.handlerDamage, gg, critical, 10019560, 3585993);
            }
            if (gold_on_hit != 0)
            {
                repeat (gold_on_hit)
                {
                    g = instance_create((other.x - 10) + random(10), (other.y - 10) + random(10), oEfGold);
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
                apply_buff(other.id, 1, 60 + (30 * (slow_on_hit - 1)));
            }
            if (sunder != 0)
            {
                apply_buff(other.id, 20, 120 + (30 * (sunder - 1)));
            }
            hit = 1;
            other.lastHp = other.hp;
            damage_fake = ceil(max(other.hp * percent_hp, damage_fake));
            other.hp -= max(other.hp * percent_hp, damage);
            with (other)
            {
                if (object_index == oP)
                {
                    last_hit_number += 1;
                    if (instance_exists(other.parent))
                    {
                        last_hit = other.parent.object_index;
                        last_hit_name = other.parent.name;
                    }
                }
                else if (object_index == oCrab && hp <= 0 && other.fire != 0)
                {
                    achievement_progress(50, 1);
                }
            }
            if (damage > 0)
            {
                var d = instance_create(other.x, other.y, oEfSparks);
                d.sprite_index = damage_index;
                if (knockback_direction == 0)
                {
                    other.lasthit_x = x;
                }
                else
                {
                    other.lasthit_x = other.x - (10 * knockback_direction);
                }
                if (team == "playerproc")
                {
                    draw_damage(other.x + 12, other.y - sprite_get_yoffset(other.sprite_idle) - 4 - climb, global.handlerDamage, damage_fake, critical, 3585993, 3585993);
                }
                else
                {
                    draw_damage(other.x, other.y - sprite_get_yoffset(other.sprite_idle) - 4 - climb, global.handlerDamage, damage_fake, critical, 16777215, 16777215);
                }
                if (weather == 1)
                {
                    other.weather_immune = 240;
                }
            }
            if (other.hp <= 0)
            {
                simult_kill_count += 1;
            }
        }
    }
    if (other.team != team && hit != 2 && (other.team + "proc") != team)
    {
        with (other)
        {
            if (reflecting == -1)
            {
                continue;
            }
            if (reflecting != 0)
            {
                reflecting_hit = 1;
            }
        }
    }
    if (hit == 1 && instance_exists(parent) && procced == 0)
    {
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
        if (critical == 1)
        {
            caster_play(63, global.volume, 1);
        }
        procced = 1;
        if (missile != 0 && (oInit.coop != 2 || global.host))
        {
            s = instance_create(parent.x, parent.y, oEfMissile);
            s.parent = parent;
            s.damage = damage * 5;
            s.team = team + "proc";
        }
        if (plasma == -5)
        {
            parent.plasma_count += 1;
        }
        if (scythe != 0 && critical == 1)
        {
            parent.hp = min(parent.maxhp, parent.hp + 8 + (2 * (scythe - 1)));
            draw_damage(parent.x, parent.y - parent.sprite_yoffset, global.handlerDamage, string(ceil(8 + (2 * (scythe - 1)))), 0, 6870916, 6870916);
        }
        if (missile_tri != 0 && (oInit.coop != 2 || global.host))
        {
            repeat (3)
            {
                s = instance_create(parent.x, parent.y, oEfMissile);
                s.parent = parent;
                s.damage = damage * 3;
                s.team = team + "proc";
            }
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
        if (spark != 0)
        {
            if (oInit.coop != 2 || global.host)
            {
                for (i = 0; i < (spark + 1); i += 1)
                {
                    var t = instance_create(other.x + (i * 26 * -image_xscale), other.y, oWispBMine);
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
    }
    if ((other.invincible > 0 || blocked) && dodged == 0 && other.team != team && (other.team + "proc") != team)
    {
        if (other.object_index == oP)
        {
            if (other.class == 1 && other.activity == 3 && other.hp <= damage && (oInit.coop != 2 || other.id == global.my_player))
            {
                achievement_progress(2, 1);
            }
        }
        dodged = 1;
        var d = instance_create(other.x, other.y - 15, oEfDodge);
        if (blocked)
        {
            d.text = 4;
            caster_play(100, global.volume * 0.4, random_range(1.3, 1.5));
        }
        if (other.invincible > 1000)
        {
            d.text = 1;
        }
        if (other.object_index == objServer)
        {
            if (other.scarfed == 1)
            {
                d.text = 3;
            }
        }
    }
}
