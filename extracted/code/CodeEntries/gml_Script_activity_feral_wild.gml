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
                    fire_explosion(0, x + (12 * image_xscale), y + 7, skill[0, 5], 445, 2, -1, 1, 3);
                    bullet.climb = i * 8;
                    bullet.max_hit_number = 1;
                    bullet.poison_dot = 1;
                    move_contact_solid(90 - (90 * image_xscale), 3);
                }
            }
            caster_play(77, global.volume, random_range(0.9, 1));
            critical_chance_bonus = 0;
        }
        activity_type = 1;
        if (sprite_index != sprite_shoot1_1 && sprite_index != sprite_shoot1_2)
        {
            sprite_index = choose(sprite_shoot1_1, sprite_shoot1_2);
        }
        image_speed = 0.23 * attack_speed;
        if (floor(image_index + image_speed) > (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            activity_type = 0;
            state = "chase";
        }
        break;
    case 2:
        if (free == 0)
        {
            pHspeed = 0;
        }
        if (activity_var1 == 0 && floor(image_index) == 4)
        {
            oHUD.alarm[0] = 4;
            activity_var1 = 1;
            for (i = 0; i <= sp; i += 1)
            {
                fire_bullet(0, x, y, 1, skill[1, 5], 80, 293, 90 - (90 * image_xscale), 1, 1, -1);
                bullet.stun = 0.2;
            }
            caster_play(78, global.volume, 1);
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
            state = "chase";
        }
        break;
    case 3:
        invincible = max(invincible, 5);
        sprite_index = sFeral2Shoot3_2;
        activity_type = 1;
        if (free == 0)
        {
            pHspeed = 0;
        }
        image_speed = 0.22 * attack_speed;
        if (activity_var1 == 0)
        {
            activity_var1 = 1;
            target_jump = instance_nearest_variable(x, y, 322, "team", "enemy");
            if (target_jump != -10)
            {
                if (point_distance(x, y, target_jump.x, target_jump.y) > 100)
                {
                    target_jump = -10;
                }
            }
            with (instance_create(x, y, oEfSparks))
            {
                sprite_index = sFeral2Shoot3_1;
                image_yscale = 1;
                image_xscale = other.image_xscale;
                image_speed = 0.22 * other.attack_speed;
            }
        }
        if (instance_exists(target_jump) && floor(image_index) == 3 && activity_var1 == 1)
        {
            oHUD.alarm[0] = 1;
            x = target_jump.x + (15 * image_xscale);
            y = ((target_jump.y - target_jump.sprite_yoffset) + target_jump.sprite_height) - 8;
            fire_bullet(0, x - (15 * image_xscale), y, 0, skill[2, 5], 2, 292, 90 - (90 * image_xscale), 1, 1, -1);
            bullet.stun = 1;
            move_contact_solid(270, 10);
            activity_var1 = 2;
        }
        if (floor(image_index + image_speed) > (sprite_get_number(sprite_index) - 1))
        {
            if (invincible <= 5)
            {
                invincible = 0;
            }
            image_speed = 0;
            activity = 0;
            activity_type = 0;
        }
        break;
    case 4:
        if (free == 0)
        {
            pHspeed = 0;
        }
        if (activity_var1 == 0 && floor(image_index) == 0)
        {
            oHUD.alarm[0] = 4;
            activity_var1 = 1;
            for (i = 0; i <= sp; i += 1)
            {
                var obj;
                if (scepter != 0)
                {
                    obj = 213;
                }
                else
                {
                    obj = 212;
                }
                with (instance_create(x, y, obj))
                {
                    direction = 90 - (90 * other.image_xscale);
                    parent = other.id;
                    team = other.team;
                    master = instance_create(x, y, oFeralDiseaseMaster);
                }
            }
            caster_play(78, global.volume, 0.75);
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
