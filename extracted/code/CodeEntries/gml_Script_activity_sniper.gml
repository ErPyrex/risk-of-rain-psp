switch (activity)
{
    case 1.1:
        if (free == 0)
        {
            pHspeed = 0;
        }
        if (activity_var1 == 0)
        {
            oHUD.alarm[0] = 3;
            z_count += 1;
            activity_var1 = 1;
            if (drill != 0 && z_count >= max(1, 5 - drill))
            {
                caster_play(70, global.volume, 1);
                fire_bullet(0, x, y, 1, skill[0, 5], 700, 293, 90 - (90 * image_xscale), 1, 1, -1);
                if (sniper_bonus == 1)
                {
                    caster_play(87, global.volume * 0.4, random_range(1.8, 2));
                }
                bullet.sniper_bonus = sniper_bonus;
                sniper_bonus = 0;
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
                    fire_bullet(0, x, y - 2, 0, skill[0, 5], 2000, 295, 90 - (90 * image_xscale), 1, 1, -1);
                    if (sniper_bonus == 1)
                    {
                        caster_play(87, global.volume * 0.4, random_range(1.8, 2));
                    }
                    bullet.sniper_bonus = sniper_bonus;
                    sniper_bonus = 0;
                    bullet.climb = i * 8;
                }
            }
            caster_play(150, global.volume * 0.5, random_range(1, 1.2));
        }
        activity_type = 1;
        sprite_index = sprite_shoot1_1;
        image_speed = 0.25 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            skill[0, 0] = "Reload";
            skill[0, 1] = "Reload your sniper rifle, gaining 30-60% bonus damage if timed in the colored zone.";
            skill[0, 4] = 1;
            sniper_bar = instance_create(x, y, oSniperBar);
            sniper_bar.parent = id;
            image_speed = 0;
            activity = 0;
            activity_type = 0;
        }
        break;
    case 1.2:
        if (free == 0)
        {
            pHspeed = 0;
        }
        if (activity_var1 == 0 && floor(image_index) == 3)
        {
            caster_play(39, global.volume, random_range(1, 1.4));
            caster_play(59, global.volume * 0.6, 0.9);
            activity_var1 = 1;
        }
        activity_type = 1;
        sprite_index = sprite_shoot1_2;
        image_speed = 0.25 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            with (sniper_bar)
            {
                other.sniper_bar = -5;
                instance_destroy();
            }
            skill[0, 0] = "Snipe";
            skill[0, 1] = "Shoot an enemy for 250% damage. After firing, reactivate the ability to reload your weapon, granting bonus damage if timed correctly.";
            skill[0, 4] = 0;
            image_speed = 0;
            activity = 0;
            bullet_ready = 1;
            activity_type = 0;
        }
        break;
    case 2.1:
        activity_var1 += 1;
        if (activity_var1 == ceil(150 / attack_speed))
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
        if (free == 0)
        {
            pHspeed = 0;
        }
        if (activity_var1 != -1)
        {
            oHUD.alarm[0] = 3;
            for (i = 0; i <= sp; i += 1)
            {
                fire_bullet(0, x, y - 2, 1, max((skill[1, 5] * activity_var1) / 150, 1), 2000, 299, 90 - (90 * image_xscale), 1, 1, -1);
                bullet.damage_degrade = 0.5;
                if (sniper_bonus == 1)
                {
                    caster_play(87, global.volume * 0.4, random_range(1.8, 2));
                }
                bullet.sniper_bonus = sniper_bonus;
                sniper_bonus = 0;
                bullet.climb = i * 8;
            }
            activity_var1 = -1;
            caster_play(148, global.volume * 0.8, random_range(1, 1.2));
        }
        activity_type = 1;
        sprite_index = sprite_shoot3_2;
        image_speed = 0.25 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            skill[0, 0] = "Reload";
            skill[0, 1] = "Reload your sniper rifle, gaining 30-60% bonus damage if timed in the colored zone.";
            skill[0, 4] = 1;
            sniper_bar = instance_create(x, y, oSniperBar);
            sniper_bar.parent = id;
            image_speed = 0;
            activity = 0;
            activity_type = 0;
        }
        break;
        break;
    case 3.1:
        invincible = max(invincible, 5);
        if (floor(image_index) < 5)
        {
            pHspeed = pHmax * 3 * -image_xscale;
        }
        else
        {
            pHspeed = max(0, abs(pHspeed) - 0.2) * sign(pHspeed);
        }
        activity_type = 1;
        sprite_index = sprite_shoot3_1;
        image_speed = 0.3;
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
    case 3.2:
        if (free == 0)
        {
            pHspeed = 0;
        }
        if (activity_var1 == 0)
        {
            oHUD.alarm[0] = 3;
            z_count += 1;
            activity_var1 = 1;
            for (i = 0; i <= sp; i += 1)
            {
                fire_bullet(0, x, y - 2, 1, skill[2, 5], 2000, 295, 90 - (90 * image_xscale), 1, 1, -1);
                if (sniper_bonus == 1)
                {
                    caster_play(87, global.volume * 0.4, random_range(1.8, 2));
                }
                bullet.sniper_bonus = sniper_bonus;
                bullet.knockback = 9;
                sniper_bonus = 0;
                bullet.climb = i * 8;
            }
            caster_play(148, global.volume * 0.8, random_range(1, 1.2));
        }
        activity_type = 1;
        sprite_index = sprite_shoot3_2;
        image_speed = 0.25 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            sniper_bar = instance_create(x, y, oSniperBar);
            sniper_bar.parent = id;
            image_speed = 0;
            activity = 0;
            activity_type = 0;
        }
        break;
    case 4:
        break;
    case 30:
        pHspeed = 0;
        pVspeed = 0;
        break;
}
