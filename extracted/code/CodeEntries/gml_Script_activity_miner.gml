switch (activity)
{
    case 1:
        if (free == 0)
        {
            pHspeed = 0;
        }
        if (activity_var1 == 0 && floor(image_index) == 3)
        {
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
                    fire_explosion(0, x + (12 * image_xscale), y + 8, skill[0, 5], 298, 2, -1, 1, 3);
                    bullet.climb = i * 8;
                }
            }
            caster_play(120, global.volume, 1);
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
    case 2.1:
        activity_var1 += 1;
        if (activity_var1 == ceil(90 / attack_speed))
        {
            activity = 2.2;
            alarm[3] = skill[1, 2] * (1 - cdr);
            image_index = 0;
        }
        break;
    case 2.2:
        if (activity_var2 != -1)
        {
            with (activity_var2)
            {
                instance_destroy();
            }
        }
        activity_var2 = -1;
        if (activity_type == 0)
        {
            caster_play(121, global.volume, 1);
            for (i = 0; i <= sp; i += 1)
            {
                fire_bullet(0, x + (0 * image_xscale), y, 1, skill[1, 5] * max(0.25, activity_var1 / ceil(120 / attack_speed)), 100, 295, 90 - (90 * image_xscale), 1, 1, -1);
                bullet.climb = i * 8;
            }
            pHspeed = 5.5 * image_xscale * pHmax;
        }
        while (1)
        {
            c = collision_line(x - (20 * image_xscale), y, x + (20 * image_xscale), y, pEnemy, true, false);
            if (c > 0)
            {
                c.knockback_value = 4 * pHmax;
                instance_deactivate_object(c);
            }
            else
            {
                break;
            }
        }
        instance_activate_object(pEnemy);
        if (!place_meeting(x, y, oMinerDust) && !free)
        {
            var tdust = instance_create(x, y, oMinerDust);
            tdust.image_xscale = image_xscale;
        }
        invincible = max(invincible, 48);
        activity_var1 = 0;
        activity_type = 1;
        if (floor(image_index) == 3)
        {
            pHspeed = 0;
        }
        sprite_index = sprite_shoot2;
        image_speed = 0.3;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            pHspeed = 0;
            activity = 0;
            activity_type = 0;
        }
        critical_chance_bonus = 0;
        break;
    case 3:
        if (activity_var1 == 0)
        {
            caster_play(122, global.volume, 1);
            oHUD.alarm[0] = 5;
            pHspeed = -pHmax * 4 * image_xscale;
            activity_var1 = 1;
            for (i = 0; i <= sp; i += 1)
            {
                fire_bullet(0, x + (0 * image_xscale), y, 1, skill[2, 5], 100, 293, (90 - (90 * image_xscale)) + 180, 1, 1, -1);
                bullet.stun = 1;
                bullet.climb = i * 8;
            }
        }
        invincible = max(invincible, 5);
        if (floor(image_index) == 3)
        {
            pHspeed = 0;
        }
        activity_type = 1;
        sprite_index = sprite_shoot3;
        image_speed = 0.25 * attack_speed;
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
        if (activity_var1 == 0 && abs(pVspeed) < 0.3)
        {
            sprite_index = sprite_shoot4;
            activity_var1 = 1;
            activity_type = 1;
            critical_chance_bonus = 0;
        }
        if (activity_var1 == 1 && floor(image_index) == 2)
        {
            activity_var1 = 2;
            oHUD.alarm[0] = 10;
            instance_activate_region(x - (2 * (sp + 1)), y, 4 * (sp + 1), 1000, true);
            if (scepter == 0)
            {
                i = -1 * (sp + 1);
                while (i <= (1 * (sp + 1)))
                {
                    caster_play(123, global.volume, 1);
                    fire_explosion(0, x + (12 * image_xscale) + (i * 20), y, skill[3, 5], 292, 2, 63, 1, 1);
                    with (bullet)
                    {
                        move_contact_solid(270, -1);
                    }
                    bullet.image_yscale = 1;
                    i += 1;
                }
            }
            else
            {
                i = -2 * (sp + 1);
                while (i <= (2 * (sp + 1)))
                {
                    caster_play(123, global.volume, 1);
                    caster_play(87, global.volume * 0.15, random_range(1.8, 2));
                    fire_explosion(0, x + (12 * image_xscale) + (i * 20), y, skill[3, 5] + (0.2 * (scepter - 1)), 292, 2, 64, 1, 1);
                    bullet.stun = 0.5;
                    with (bullet)
                    {
                        move_contact_solid(270, -1);
                    }
                    bullet.image_yscale = 1;
                    i += 1;
                }
            }
            critical_chance_bonus = 0;
        }
        image_speed = 0.25 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1) && activity_var1 == 2)
        {
            image_speed = 0;
            activity = 0;
            activity_type = 0;
        }
        break;
    case 30:
        pHspeed = 0;
        pVspeed = 0;
        break;
}
