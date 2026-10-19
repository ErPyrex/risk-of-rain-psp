switch (activity)
{
    case 1:
        if (free == 0)
        {
            pHspeed = 0;
        }
        if (activity_var1 == 0)
        {
            z_count += 1;
            activity_var1 = 1;
            if (drill != 0 && z_count >= max(1, 5 - drill))
            {
                caster_play(70, global.volume, 1);
                fire_bullet(0, x, y, 1, 1, 700, 292, 90 - (90 * image_xscale), 1, 1, -1);
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
                    fire_bullet(0, x, y, 0, skill[0, 5], 700, 292, 90 - (90 * image_xscale), 1, 1, -1);
                    bullet.climb = i * 8;
                }
            }
            caster_play(36, global.volume, random_range(0.85, 1));
        }
        if (activity_var1 == 1 && floor(image_index) == 2)
        {
            activity_var1 = 2;
            for (i = 0; i <= sp; i += 1)
            {
                fire_bullet(0, x, y, 0, skill[0, 5], 700, 292, 90 - (90 * image_xscale), 1, 1, -1);
                bullet.climb = 9 + (i * 8);
            }
            caster_play(36, global.volume, random_range(0.85, 1));
            critical_chance_bonus = 0;
        }
        activity_type = 1;
        sprite_index = sprite_shoot1;
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
            oHUD.alarm[0] = 4;
            activity_var1 = 1;
            for (i = 0; i <= sp; i += 1)
            {
                fire_bullet(0, x, y, 1, skill[1, 5], 700, 293, 90 - (90 * image_xscale), 1, 1, -1);
                bullet.knockback += 6;
                bullet.climb = i * 8;
            }
            caster_play(37, global.volume, 1);
            critical_chance_bonus = 0;
        }
        activity_type = 1;
        sprite_index = sprite_shoot2;
        image_speed = 0.25 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            activity_type = 0;
        }
        break;
    case 3:
        invincible = max(invincible, 5);
        if (pHspeed != 0)
        {
            pHspeed = pHmax * 2 * image_xscale;
        }
        else
        {
            pHspeed = 2.6 * image_xscale;
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
        break;
    case 4.1:
        image_speed = 0.3 * attack_speed;
        if (scepter != 0)
        {
            image_speed = 0.4 * attack_speed;
        }
        if (free == 0)
        {
            pHspeed = 0;
        }
        if ((activity_var1 == 0 && (floor(image_index) == 1 || floor(image_index) == 5 || floor(image_index) == 9 || (floor(image_index) == 13 && scepter != 0) || (floor(image_index) == 17 && scepter != 0))) || (activity_var1 == 1 && (floor(image_index) == 3 || floor(image_index) == 7 || floor(image_index) == 11 || (floor(image_index) == 15 && scepter != 0) || (floor(image_index) == 19 && scepter != 0))))
        {
            activity_var1 = !activity_var1;
            for (i = 0; i <= sp; i += 1)
            {
                fire_bullet(0, x, y - 3, 0, skill[3, 5], 700, 292, (((90 - (90 * image_xscale)) + (activity_var1 * 180)) - 2) + random(4), 1, 1, -1);
                bullet.stun = 0.5;
                bullet.climb = i * 8;
                if (scepter > 0)
                {
                    caster_play(87, global.volume * 0.25, random_range(1.8, 2));
                }
            }
            if (inside_view(x, y) == 1)
            {
                caster_play(38, global.volume, random_range(0.85, 1));
            }
        }
        activity_type = 1;
        sprite_index = sprite_shoot4_1;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            activity_type = 0;
            critical_chance_bonus = 0;
        }
        break;
    case 4.2:
        if (free == 0)
        {
            pHspeed = 0;
        }
        if ((activity_var1 == 0 && (floor(image_index) == 1 || floor(image_index) == 5 || floor(image_index) == 9 || ((floor(image_index) == 13 || floor(image_index) == 17) && scepter != 0))) || (activity_var1 == 1 && (floor(image_index) == 3 || floor(image_index) == 7 || floor(image_index) == 11 || ((floor(image_index) == 15 || floor(image_index) == 19) && scepter != 0))))
        {
            activity_var1 = !activity_var1;
            for (i = 0; i <= sp; i += 1)
            {
                fire_bullet(0, x, y - 3, 0, skill[3, 5], 700, 292, (90 - (90 * image_xscale) - 2) + random(4), 1, 1, -1);
                bullet.climb = (5 * (floor(image_index) - 1)) + (5 * i);
                bullet.stun = 0.5;
                if (scepter > 0)
                {
                    caster_play(87, global.volume * 0.25, random_range(1.8, 2));
                }
            }
            caster_play(38, global.volume, random_range(0.85, 1));
        }
        activity_type = 1;
        sprite_index = sprite_shoot4_2;
        image_speed = 0.3 * attack_speed;
        if (scepter != 0)
        {
            image_speed = 0.4 * attack_speed;
        }
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
