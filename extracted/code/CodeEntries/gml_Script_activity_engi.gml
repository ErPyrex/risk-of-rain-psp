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
                for (i = 0; i < 3; i += 1)
                {
                    fire_bullet(0, x, y, 1, skill[0, 5], 700, 292, 90 - (90 * image_xscale), 1, 1, -1);
                    bullet.climb = i * 8;
                }
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
                    for (t = 0; t < 3; t += 1)
                    {
                        with (instance_create(x, y - 3, oEngiGrenade))
                        {
                            direction = 90 - ((55 + (other.t * 5) + (other.i * 3)) * other.image_xscale);
                            speed = 2.5 + (other.t * 1) + (other.i * 1);
                            parent = other.id;
                            team = other.team;
                        }
                    }
                }
            }
            caster_play(58, global.volume, random_range(0.65, 0.7));
        }
        activity_type = 1;
        sprite_index = sprite_shoot1;
        image_speed = 0.2 * attack_speed;
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
        if (free == 0)
        {
            pHspeed = 0;
        }
        activity_type = 1;
        sprite_index = sprite_shoot3;
        image_speed = 0.25 * attack_speed;
        for (i = 0; i < 4; i += 1)
        {
            if (floor(image_index) == (5 + (i * 3)) && activity_var1 == i)
            {
                for (tt = 0; tt <= sp; tt += 1)
                {
                    caster_play(124, global.volume, random_range(0.6, 0.7));
                    oHUD.alarm[0] = 5;
                    activity_var1 = i + 1;
                    with (instance_create(x + (((-4 + (3 * i)) - (6 * tt)) * image_xscale), y - 4, oEngiHarpoon))
                    {
                        parent = other.id;
                    }
                }
            }
        }
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
                bullet.stun = 0.5;
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
                bullet.climb = (i + 1) * (4 * floor(image_index));
                bullet.stun = 0.5;
            }
            caster_play(38, global.volume, random_range(0.85, 1));
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
