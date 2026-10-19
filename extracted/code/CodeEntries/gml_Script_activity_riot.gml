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
                fire_bullet(0, x, y, 1, 1, 700, 293, 90 - (90 * image_xscale), 1, 1, -1);
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
                    fire_bullet(0, x, y - 2, 1, skill[0, 5], 100, 295, 90 - (90 * image_xscale), 1, 1, -1);
                    bullet.climb = i * 8;
                }
            }
            caster_play(141, global.volume, random_range(1, 1.2));
        }
        activity_type = 1;
        sprite_index = sprite_shoot1;
        image_speed = 0.22 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            if (!bunker)
            {
                activity_type = 0;
            }
            else
            {
                activity_type = 4;
            }
        }
        break;
    case 2:
        if (free == 0)
        {
            pHspeed = 0;
        }
        if (activity_var1 == 0 && floor(image_index) == 5)
        {
            caster_play(100, global.volume, 0.8);
            oHUD.alarm[0] = 8;
            activity_var1 = 1;
            for (i = 0; i <= sp; i += 1)
            {
                fire_explosion(0, x + (9 * image_xscale), y - 8, skill[1, 5], 296, 2, -1, 1.3, 3);
                bullet.climb = i * 8;
                bullet.knockback += 10;
                bullet.knockback_direction = image_xscale;
                bullet.climb = i * 8;
            }
            critical_chance_bonus = 0;
        }
        activity_type = 1;
        sprite_index = sprite_shoot2;
        image_speed = 0.23 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            if (!bunker)
            {
                activity_type = 0;
            }
            else
            {
                activity_type = 4;
            }
        }
        break;
    case 3.1:
        pHspeed = 0;
        activity_type = 1;
        sprite_index = sprite_shoot3_1;
        image_speed = 0.25 * attack_speed;
        if (activity_var1 == 0 && floor(image_index) == 3)
        {
            activity_var1 = 1;
            oHUD.alarm[0] = 5;
        }
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            bunker = 1;
            sprite_idle = 202;
            sprite_shoot1 = 205;
            sprite_walk = 212;
            walk_speed_coeff = 1.7;
            pHmax -= 0.7;
            image_speed = 0;
            pHspeed = 0;
            activity = 0;
            activity_type = 4;
        }
        break;
    case 3.2:
        pHspeed = 0;
        activity_type = 1;
        sprite_index = sprite_shoot3_2;
        image_speed = 0.25 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            bunker = 0;
            sprite_idle = 199;
            sprite_shoot1 = 204;
            sprite_walk = 211;
            walk_speed_coeff = 1;
            image_speed = 0;
            pHmax += 0.7;
            pHspeed = 0;
            activity = 0;
            activity_type = 0;
        }
        break;
    case 4:
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
                with (instance_create(x, y - 3, oRiotGrenade))
                {
                    direction = 90 - ((85 + (other.i * 3)) * other.image_xscale);
                    speed = 7.5 + (other.i * 1);
                    parent = other.id;
                    team = other.team;
                    scepter = other.scepter;
                }
            }
            caster_play(37, global.volume, 1);
            critical_chance_bonus = 0;
        }
        activity_type = 1;
        sprite_index = sprite_shoot1;
        image_speed = 0.25 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            if (!bunker)
            {
                activity_type = 0;
            }
            else
            {
                activity_type = 4;
            }
        }
        break;
    case 30:
        pHspeed = 0;
        pVspeed = 0;
        break;
}
