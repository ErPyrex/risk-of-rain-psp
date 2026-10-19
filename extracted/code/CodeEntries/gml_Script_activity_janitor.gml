switch (activity)
{
    case 1:
        if (free == 0)
        {
            pHspeed = 0;
        }
        if (activity_var1 == 0 && floor(image_index) == 4)
        {
            z_count += 1;
            oHUD.alarm[0] = 3;
            caster_play(100, global.volume, 1);
            activity_var1 = 1;
            if (drill != 0 && z_count >= max(1, 5 - drill))
            {
                caster_play(70, global.volume, 1);
                fire_bullet(0, x, y, 1, skill[0, 5], 700, 292, 90 - (90 * image_xscale), 1, 1, -1);
                bullet.knockback += 6;
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
                    fire_explosion(0, x + (19 * image_xscale), y - 8, skill[0, 5], 292, 2, -1, 1.3, 3);
                    bullet.climb = i * 8;
                    bullet.knockback += 6;
                    if (instance_exists(gauge))
                    {
                        bullet.steam = 1;
                    }
                    bullet.knockback_direction = image_xscale;
                    bullet.climb = i * 8;
                }
            }
            critical_chance_bonus = 0;
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
    case 3:
        activity = 0;
        gauge = instance_create(x, y, oJanitorGauge);
        gauge.parent = id;
        attack_speed += 0.3;
        break;
    case 4:
        if (free == 0)
        {
            pHspeed = 0;
        }
        if (activity_var1 == 0 && floor(image_index) == 9)
        {
            oHUD.alarm[0] = 20;
            caster_play(104, global.volume, 1);
            activity_var1 = 1;
            repeat (11)
            {
                part_particles_create(global.above, x + (random_range(25, 33) * image_xscale), y + 12, global.pSpark, 1);
            }
            for (i = 0; i <= sp; i += 1)
            {
                fire_explosion(0, x + (29 * image_xscale), y - 12, skill[3, 5] + (0.2 * (scepter - 1)), 292, 2, -1, 3, 6);
                bullet.simult_kill = 10;
                bullet.climb = i * 8;
                bullet.knockup = 6;
                if (scepter != 0)
                {
                    bullet.lightning = 1;
                    bullet.stun = 2;
                }
                if (instance_exists(gauge))
                {
                    bullet.steam = 5;
                }
            }
            critical_chance_bonus = 0;
        }
        activity_type = 1;
        sprite_index = sprite_shoot4;
        image_speed = 0.2 * attack_speed;
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
