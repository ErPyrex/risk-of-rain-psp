switch (activity)
{
    case 1:
        z_skill = 0;
        pHspeed = 0;
        if (activity_var1 == 0 && floor(image_index) == 2)
        {
            oHUD.alarm[0] = 10;
            caster_play(95, global.volume, 1);
            activity_var1 = 1;
            fire_explosion(0, x + (4 * image_xscale), y + 26, skill[0, 5], 444, 2, -1, 1.2, 1);
            critical_chance_bonus = 0;
            bullet.poison_dot = 1;
        }
        if (activity_var1 == 1 && floor(image_index) == 5)
        {
            oHUD.alarm[0] = 10;
            caster_play(95, global.volume, 1);
            activity_var1 = 2;
            fire_explosion(0, x + (4 * image_xscale), y + 26, skill[0, 5], 444, 2, -1, 1.2, 1);
            bullet.climb = 12;
            critical_chance_bonus = 0;
            bullet.poison_dot = 1;
        }
        if (activity_var1 == 2 && floor(image_index) == 8)
        {
            oHUD.alarm[0] = 10;
            caster_play(95, global.volume, 1);
            activity_var1 = 3;
            fire_explosion(0, x + (4 * image_xscale), y + 26, skill[0, 5], 444, 2, -1, 1.2, 1);
            bullet.climb = 12;
            critical_chance_bonus = 0;
            bullet.poison_dot = 1;
        }
        activity_type = 1;
        sprite_index = sprite_shoot1;
        image_speed = 0.26 * attack_speed;
        if (round(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            activity_type = 0;
            state = "chase";
        }
        break;
    case 2:
        if (instance_exists(target))
        {
            x_skill = 0;
            pHspeed = 0;
            sprite_index = sprite_shoot2;
            image_speed = 0.23 * attack_speed;
            if (activity_var1 == 0 && floor(image_index) == 5)
            {
                activity_var1 = 1;
                if (instance_exists(target))
                {
                    teleport_nearby(id, target.x, target.y);
                    ghost_x = x;
                    ghost_y = y;
                }
            }
            if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
            {
                image_speed = 0;
                activity = 0;
                activity_type = 0;
                state = "chase";
                z_skill = 1;
                alarm[0] = 30;
            }
        }
        else
        {
            activity = 0;
            activity_type = 0;
        }
        break;
    case 3:
        c_skill = 0;
        pHspeed = max(0, abs(pHspeed) - 0.4) * sign(pHspeed);
        if (activity_var1 == 0 && floor(image_index) == 2)
        {
            pHspeed = 7 * image_xscale;
            oHUD.alarm[0] = 10;
            caster_play(95, global.volume, 1);
            activity_var1 = 1;
            fire_explosion(0, x + (4 * image_xscale), y + 11, skill[2, 5], 444, 2, -1, 1.6, 3.3);
            critical_chance_bonus = 0;
        }
        if (activity_var1 == 1 && floor(image_index) == 5)
        {
            pHspeed = 7 * image_xscale;
            oHUD.alarm[0] = 10;
            caster_play(95, global.volume, 1);
            activity_var1 = 2;
            fire_explosion(0, x + (4 * image_xscale), y + 11, skill[2, 5], 444, 2, -1, 1.6, 3.3);
            bullet.climb = 12;
            critical_chance_bonus = 0;
        }
        if (activity_var1 == 2 && floor(image_index) == 8)
        {
            pHspeed = 7 * image_xscale;
            oHUD.alarm[0] = 10;
            caster_play(95, global.volume, 1);
            activity_var1 = 3;
            fire_explosion(0, x + (4 * image_xscale), y + 11, skill[2, 5], 444, 2, -1, 1.6, 3.3);
            bullet.climb = 12;
            critical_chance_bonus = 0;
        }
        if (activity_var1 == 3 && floor(image_index) == 11)
        {
            pHspeed = 7 * image_xscale;
            oHUD.alarm[0] = 10;
            caster_play(95, global.volume, 1);
            activity_var1 = 4;
            fire_explosion(0, x + (4 * image_xscale), y + 11, skill[2, 5], 444, 2, -1, 1.6, 3.3);
            bullet.climb = 12;
            critical_chance_bonus = 0;
        }
        activity_type = 1;
        sprite_index = sprite_shoot3;
        image_speed = 0.22 * attack_speed;
        if (round(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            activity_type = 0;
            state = "chase";
        }
        break;
    case 4:
        v_skill = 0;
        pHspeed = 0;
        if (activity_var1 == 0 && floor(image_index) == 5)
        {
            caster_play(105, global.volume, 1.3);
            oHUD.alarm[0] = 10;
            activity_var1 = 1;
            if (instance_exists(target))
            {
                with (instance_create(x, (target.y - target.parent.sprite_yoffset) + target.parent.sprite_height, oImpGLaser))
                {
                    parent = other.id;
                    xorig = other.x;
                    yorig = other.y;
                    scale = other.image_xscale;
                }
            }
            critical_chance_bonus = 0;
        }
        activity_type = 1;
        sprite_index = sprite_shoot4;
        image_speed = 0.26 * attack_speed;
        if (round(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            activity_type = 0;
            state = "chase";
        }
        break;
}
