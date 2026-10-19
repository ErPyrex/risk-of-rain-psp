switch (activity)
{
    case 1:
        darksight_timer = 0;
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
                fire_bullet(0, x, y, 1, skill[0, 5], 700, 294, 90 - (90 * image_xscale), 1, 1, -1);
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
                    fire_bullet(0, x, y, 0, skill[0, 5], 700, 294, 90 - (90 * image_xscale), 1, 1, -1);
                    bullet.climb = i * 8;
                }
            }
            caster_play(57, global.volume, random_range(0.85, 1));
        }
        activity_type = 1;
        sprite_index = sprite_shoot1;
        image_speed = 0.22 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            activity_type = 0;
        }
        break;
    case 2:
        darksight_timer = 0;
        if (free == 0)
        {
            pHspeed = 0;
        }
        if (activity_var1 == 0 && floor(image_index) == 0)
        {
            for (i = 0; i <= sp; i += 1)
            {
                caster_play(58, global.volume, 1);
                z_count += 1;
                activity_var1 = 1;
                with (instance_create(x, y - 12, oCowboyDynamite))
                {
                    parent = other.id;
                    direction = 90 - ((80 - (30 * other.i)) * other.image_xscale);
                }
            }
        }
        activity_type = 1;
        sprite_index = sprite_shoot2;
        image_speed = 0.22 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            activity_type = 0;
        }
        break;
    case 3:
        with (child_poi)
        {
            instance_destroy();
        }
        caster_play(167, global.volume, 1.5);
        activity = 0;
        pHmax += 0.5;
        with (instance_create(x, y, oEfBullet2))
        {
            sprite_index = sCowboyShoot3;
            image_yscale = 1;
        }
        darksight = 1;
        darksight_timer = 180;
        image_alpha = 0.5;
        break;
    case 4:
        darksight_timer = 0;
        if (free == 0)
        {
            pHspeed = 0;
        }
        if ((activity_var1 == 0 && floor(image_index) == 5) || (activity_var1 == 1 && floor(image_index) == 7 && scepter != 0))
        {
            caster_play(60, global.volume, random_range(0.7, 1.2));
            oHUD.alarm[0] = 8;
            activity_var1 += 1;
            for (i = 0; i <= sp; i += 1)
            {
                fire_bullet(0, x, y, 0, skill[3, 5] + (0.2 * (scepter - 1)), 700, 293, 90 - (90 * image_xscale), 1, 1, -1);
                bullet.knockback = 3;
                bullet.climb = (i * 8) + (5 * (floor(image_index) == 7));
                bullet.refresh_x = 1;
            }
            caster_play(87, global.volume * 0.25, random_range(1.8, 2));
            caster_play(37, global.volume, 1);
            critical_chance_bonus = 0;
        }
        activity_type = 1;
        sprite_index = sprite_shoot4;
        image_speed = 0.22 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
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
