switch (activity)
{
    case 1:
        if (free == 0)
        {
            pHspeed = 0;
        }
        if (activity_var1 == 0 && floor(image_index) == 3)
        {
            caster_play(142, global.volume, random_range(0.8, 1));
            move_contact_solid(90 - (90 * image_xscale), 3);
            z_count += 1;
            activity_var1 = 1;
            if (drill != 0 && z_count >= max(1, 5 - drill))
            {
                caster_play(70, global.volume, 1);
                fire_bullet(0, x, y, 1, skill[0, 5], 700, 292, 90 - (90 * image_xscale), 1, 1, -1);
                with (instance_create(x, y, oEfBullet2))
                {
                    sprite_index = sEfDrill;
                    image_xscale = other.image_xscale;
                }
                z_count = 0;
            }
            else
            {
                for (i = 0; i <= sp; i += 1)
                {
                    fire_explosion(0, x + (12 * image_xscale), y + 8, skill[0, 5], 300, 2, -1, 1, 3);
                    bullet.max_hit_number = 3;
                    bullet.climb = i * 8;
                }
            }
            critical_chance_bonus = 0;
        }
        activity_type = 1;
        image_speed = 0.25 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            activity_type = 0;
        }
        break;
    case 2:
        if (free == 0)
        {
            pHspeed = 0;
        }
        if (activity_var1 == 0)
        {
            activity_var1 = 1;
            for (i = 0; i <= sp; i += 1)
            {
                fire_explosion(0, x, y, skill[1, 5], 300, 2, -1, 1.8, 5);
                bullet.climb = i * 8;
            }
            caster_play(142, global.volume, random_range(1.2, 1.4));
            critical_chance_bonus = 0;
        }
        if (activity_var1 == 1 && floor(image_index) == 3)
        {
            activity_var1 = 2;
            for (i = 0; i <= sp; i += 1)
            {
                fire_explosion(0, x, y, skill[1, 5], 300, 2, -1, 1.9, 4);
                bullet.climb = (i * 8) + 11;
            }
            caster_play(142, global.volume, random_range(1.2, 1.4));
            critical_chance_bonus = 0;
        }
        activity_type = 1;
        sprite_index = sprite_shoot2;
        image_speed = 0.3 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            activity_type = 0;
        }
        break;
    case 3:
        if (!place_meeting(x, y, oMinerDust) && !free)
        {
            var tdust = instance_create(x, y, oMinerDust);
            tdust.image_xscale = image_xscale;
        }
        if (activity_var1 == 0)
        {
            caster_play(121, global.volume, random_range(1.4, 1.5));
            oHUD.alarm[0] = 5;
            pHspeed = pHmax * 10 * image_xscale;
            activity_var1 = 1;
            for (i = 0; i <= sp; i += 1)
            {
                fire_bullet(0, x, y, 1, skill[2, 5], abs(pHmax * 10 * image_xscale * 4), 302, 90 - (90 * image_xscale), 1, 1, -1);
                bullet.stun = 0.5;
                bullet.climb = i * 8;
            }
        }
        invincible = max(invincible, 5);
        if (floor(image_index) == 1)
        {
            pHspeed = 0;
        }
        activity_type = 1;
        sprite_index = sprite_shoot3;
        image_speed = 0.25;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            if (invincible <= 5)
            {
                invincible = 0;
            }
            image_speed = 0;
            pHspeed = 0;
            activity = 0;
            activity_type = 0;
        }
        critical_chance_bonus = 0;
        break;
    case 4:
        alarm[5] = skill[3, 2] * (1 - cdr);
        invincible = max(invincible, 5);
        if (free == 0)
        {
            pHspeed = 0;
        }
        if ((activity_var1 == 0 && (floor(image_index) == 4 || floor(image_index) == 8 || floor(image_index) == 12)) || (activity_var1 == 1 && (floor(image_index) == 6 || floor(image_index) == 10 || floor(image_index) == 14)))
        {
            if (instance_exists(ult_target))
            {
                caster_play(142, global.volume, random_range(0.8, 1));
                caster_play(87, global.volume * 0.15, random_range(1.8, 2));
                activity_var1 = !activity_var1;
                var tspr;
                if (scepter == 0)
                {
                    tspr = choose(300, 302);
                }
                else
                {
                    tspr = choose(301, 303);
                }
                for (i = 0; i <= sp; i += 1)
                {
                    fire_bullet(0, (ult_target.x - sprite_get_xoffset(ult_target.sprite_idle)) + 2 + random(sprite_get_width(ult_target.sprite_idle) - 2), ((ult_target.y + 2) - sprite_get_yoffset(ult_target.sprite_idle)) + random(sprite_get_height(ult_target.sprite_idle) - 2), 0, skill[3, 5], 18, tspr, 90 - (90 * image_xscale), 1, 1, -1);
                    bullet.specific_target = ult_target;
                    bullet.direction = point_direction(bullet.x, bullet.y, ult_target.x, ult_target.y);
                    bullet.climb = (5 * (floor(image_index) - 4)) + (5 * i);
                }
            }
            else
            {
                ult_target = instance_nearest_variable(x, y, 321, "team", "enemy");
                if (instance_exists(ult_target))
                {
                    if (point_distance(x, y, ult_target.x, ult_target.y) > 100)
                    {
                        ult_target = -4;
                    }
                    if (ult_target != -4 && scepter != 0)
                    {
                        image_index = 4;
                        activity_var1 = 1;
                    }
                }
            }
        }
        activity_type = 1;
        sprite_index = sprite_shoot4;
        image_speed = 0.3 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            activity_type = 0;
            critical_chance_bonus = 0;
        }
        break;
    case 30:
        pHspeed = 0;
        pVspeed = 0;
        break;
}
