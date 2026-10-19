switch (activity)
{
    case 1.1:
        if (free == 0)
        {
            pHspeed = 0;
        }
        if (activity_var1 == 0 && floor(image_index) == 3)
        {
            caster_play(120, global.volume, 1.4);
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
                    cleaver_count++;
                    with (instance_create(x + (9 * image_xscale), y - (10 * i), oChefKnife))
                    {
                        direction = 90 - (90 * other.image_xscale);
                        parent = other.id;
                        team = other.team;
                        true_damage = other.damage * other.skill[0, 5];
                        damage = true_damage;
                    }
                }
            }
        }
        activity_type = 1;
        sprite_index = sprite_shoot1_1;
        image_speed = 0.25 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
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
            caster_play(120, global.volume, 1.4);
            z_count += 1;
            activity_var1++;
            for (j = 0; j < 9; j++)
            {
                for (i = 0; i <= sp; i += 1)
                {
                    cleaver_count++;
                    with (instance_create(x + (9 * image_xscale), y - (10 * i), oChefKnife))
                    {
                        direction = (90 - (90 * other.image_xscale)) + (other.j * 40) + (other.sp * 20);
                        parent = other.id;
                        team = other.team;
                        true_damage = other.damage * other.skill[0, 5];
                        damage = true_damage;
                        sprite_index = sChefKnife2;
                        max_speed = 11;
                        speed = max_speed;
                        pass = 1;
                    }
                }
            }
        }
        activity_type = 1;
        sprite_index = sprite_shoot1_1;
        image_speed = 0.25 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            activity_type = 0;
        }
        break;
    case 2.1:
        if (free == 0)
        {
            pHspeed = 0;
        }
        if (activity_var1 == 0)
        {
            caster_play(0, global.volume, 1);
            activity_var1++;
        }
        if (activity_var1 == 1 && floor(image_index) == 4)
        {
            caster_play(123, global.volume, 2);
            oHUD.alarm[0] = 4;
            activity_var1++;
            for (i = 0; i <= sp; i += 1)
            {
                fire_explosion(0, x + (48 * image_xscale), y - 8, skill[1, 5], 305, 2, -1, 4, 3);
                bullet.climb = i * 8;
                bullet.knockback += 10;
                bullet.knockback_direction = image_xscale;
                bullet.fire = 1;
            }
            critical_chance_bonus = 0;
        }
        activity_type = 1;
        sprite_index = sprite_shoot2_1;
        image_speed = 0.2 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            activity_type = 0;
        }
        break;
    case 2.2:
        if (free == 0)
        {
            pHspeed = 0;
        }
        if (activity_var1 == 0)
        {
            caster_play(0, global.volume, 1);
            activity_var1++;
        }
        if (activity_var1 == 1 && floor(image_index) == 4)
        {
            caster_play(123, global.volume, 2);
            oHUD.alarm[0] = 4;
            activity_var1++;
            for (i = 0; i <= sp; i += 1)
            {
                fire_explosion(0, x + (48 * image_xscale), y - 8, skill[1, 5] * 2, 305, 2, -1, 4, 3);
                bullet.climb = i * 8;
                bullet.knockback += 10;
                bullet.knockback_direction = image_xscale;
                bullet.fire = 1;
            }
            critical_chance_bonus = 0;
        }
        activity_type = 1;
        sprite_index = sprite_shoot2_2;
        image_speed = 0.2 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            activity_type = 0;
        }
        break;
    case 3.1:
        pHspeed = 2 * image_xscale;
        activity_type = 1;
        sprite_index = sprite_shoot3_1;
        image_speed = 0.22;
        if (floor(image_index) == activity_var1)
        {
            activity_var1++;
            fire_explosion(2, x, y + 6, 0, 288, 2, -1, 1, 2);
            bullet.oil = 1;
        }
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            pHspeed = 0;
            activity = 0;
            activity_type = 0;
        }
        break;
    case 3.2:
        pHspeed = 2.5 * image_xscale;
        activity_type = 1;
        sprite_index = sprite_shoot3_2;
        image_speed = 0.22;
        if (floor(image_index) == activity_var1)
        {
            activity_var1++;
            fire_explosion(2, x, y + 6, 0, 288, 2, -1, 1, 2);
            bullet.oil = 1;
        }
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            pHspeed = 0;
            activity = 0;
            activity_type = 0;
        }
        break;
    case 30:
        pHspeed = 0;
        pVspeed = 0;
        break;
}
