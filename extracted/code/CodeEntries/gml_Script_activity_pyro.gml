lifesteal_bonus_time -= 1;
if (lifesteal_bonus_time == 0)
{
    lifesteal_bonus = 0;
}
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
            for (i = 0; i <= sp; i += 1)
            {
                if (lifesteal_bonus == 0)
                {
                    with (instance_create(x + (image_xscale * 10), y, oEfBullet2))
                    {
                        sprite_index = sPyroFire;
                        image_speed = 0.3;
                        image_xscale = other.image_xscale;
                    }
                }
                else
                {
                    with (instance_create(x + (image_xscale * 10), y, oEfBullet2))
                    {
                        sprite_index = sPyroFireG;
                        image_speed = 0.3;
                        image_xscale = other.image_xscale;
                    }
                }
                fire_bullet(0, x, y, 0, skill[0, 5], 50 + random(10), 528, 90 - (90 * image_xscale), 1, 1, -1);
                bullet.lifesteal += lifesteal_bonus;
                bullet.climb = i * 8;
            }
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
            activity_var1 = 1;
            for (i = 0; i <= sp; i += 1)
            {
                if (lifesteal_bonus == 0)
                {
                    with (instance_create(x + (image_xscale * 10), y, oEfBullet2))
                    {
                        sprite_index = sPyroFire2;
                        image_speed = 0.3;
                        image_xscale = other.image_xscale;
                    }
                }
                else
                {
                    with (instance_create(x + (image_xscale * 10), y, oEfBullet2))
                    {
                        sprite_index = sPyroFire2G;
                        image_speed = 0.3;
                        image_xscale = other.image_xscale;
                    }
                }
                fire_bullet(0, x, y, 1, skill[1, 5], 40, 293, 90 - (90 * image_xscale), 1, 1, -1);
                bullet.lifesteal += lifesteal_bonus;
                bullet.blaze = 1;
                bullet.climb = i * 8;
            }
            critical_chance_bonus = 0;
        }
        activity_type = 1;
        sprite_index = sprite_shoot1;
        image_speed = 0.25 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            pHspeed = 0;
            image_speed = 0;
            activity = 0;
            activity_type = 0;
        }
        break;
    case 4.1:
        if (free == 0)
        {
            pHspeed = 0;
        }
        if ((activity_var1 == 0 && (floor(image_index) == 1 || floor(image_index) == 5 || floor(image_index) == 9)) || (activity_var1 == 1 && (floor(image_index) == 3 || floor(image_index) == 7 || floor(image_index) == 11)))
        {
            activity_var1 = !activity_var1;
            for (i = 0; i <= sp; i += 1)
            {
                fire_bullet(0, x, y, 0, skill[3, 5], 700, 292, (((90 - (90 * image_xscale)) + (activity_var1 * 180)) - 2) + random(4), 1, 1, -1);
                bullet.climb = i * 8;
            }
            if (inside_view(x, y) == 1)
            {
                caster_play(38, global.volume, random_range(0.85, 1));
            }
        }
        activity_type = 1;
        sprite_index = sprite_shoot4_1;
        image_speed = 0.3 * attack_speed;
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
        if ((activity_var1 == 0 && (floor(image_index) == 1 || floor(image_index) == 5 || floor(image_index) == 9)) || (activity_var1 == 1 && (floor(image_index) == 3 || floor(image_index) == 7 || floor(image_index) == 11)))
        {
            activity_var1 = !activity_var1;
            for (i = 0; i <= sp; i += 1)
            {
                fire_bullet(0, x, y, 0, skill[3, 5], 700, 292, (90 - (90 * image_xscale) - 2) + random(4), 1, 1, -1);
                bullet.climb = i * (4 * floor(image_index));
            }
            if (inside_view(x, y) == 1)
            {
                caster_play(38, global.volume, random_range(0.85, 1));
            }
        }
        activity_type = 1;
        sprite_index = sprite_shoot4_2;
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
