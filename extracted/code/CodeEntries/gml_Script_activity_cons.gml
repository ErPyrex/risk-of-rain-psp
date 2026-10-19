switch (activity)
{
    case 1:
        activity_type = 1;
        if (activity_var1 == 0)
        {
            sprite_index = sprite_shoot11;
            image_speed = 0.2 * attack_speed;
            activity_var1 = 1;
        }
        if (activity_var1 == 1 && ((floor(image_index) == 3 && sprite_index == sprite_shoot11) || (floor(image_index) == 2 && sprite_index == sprite_shoot12) || (floor(image_index) == 3 && sprite_index == sprite_shoot13)))
        {
            oHUD.alarm[0] = 1;
            if (!free)
            {
                pHspeed = 4 * image_xscale;
            }
            z_count += 1;
            activity_var1 = 2;
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
                    if (sprite_index == sprite_shoot13)
                    {
                        fire_explosion(0, x + (12 * image_xscale), y, skill[0, 5] * 2, 298, 2, -1, 1, 2);
                        bullet.knockback += 4;
                        bullet.knockup += 3;
                        caster_play(104, global.volume * 0.7, 2);
                    }
                    else
                    {
                        fire_explosion(0, x + (12 * image_xscale), y, skill[0, 5], 298, 2, -1, 1, 2);
                    }
                    bullet.climb = i * 8;
                    bullet.knockback_direction = image_xscale;
                }
            }
            caster_play(100, global.volume * 0.9, 1.2);
        }
        else if (!free)
        {
            pHspeed = 0;
        }
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            image_index = image_number - 1;
            activity_var1++;
            if (activity_var1 > 20 || sprite_index == sprite_shoot13)
            {
                activity = 0;
                activity_type = 0;
            }
            else if ((z_skill && z_released) || force_z)
            {
                if (sprite_index == sprite_shoot11)
                {
                    sprite_index = sprite_shoot12;
                }
                else if (sprite_index == sprite_shoot12)
                {
                    sprite_index = sprite_shoot13;
                }
                activity_var1 = 1;
                image_index = 0;
                image_speed = 0.3 * attack_speed;
            }
        }
        break;
    case 3:
        activity_type = 1;
        if (!free)
        {
            pHspeed = max(0, abs(pHspeed) - 0.1) * sign(pHspeed);
        }
        sprite_index = sprite_shoot2;
        image_speed = 0.25;
        if (activity_var1 == 0)
        {
            activity_var1 = 1;
            pVspeed = min(pVspeed, 0);
        }
        if (activity_var1 == 1 && floor(image_index) == 4)
        {
            activity_var1 = 2;
            hand_id = instance_create(x, y - 4, oConsHand);
            hand_id.dx = 14 * image_xscale;
            hand_id.parent = id;
            caster_play(104, global.volume * 0.9, 2.5);
        }
        if (activity_var1 == 2)
        {
            if (!instance_exists(hand_id))
            {
                activity = 0;
                activity_type = 0;
            }
            else if (floor(image_index) == (sprite_get_number(sprite_index) - 2) && hand_id.done == 0)
            {
                activity = 0;
                activity_type = 0;
                with (hand_id)
                {
                    instance_destroy();
                }
            }
            else if (hand_id.done == 1)
            {
                achievement_progress(53, 1);
                pHspeed = lengthdir_x(8, point_direction(x, y, hand_id.x, hand_id.y));
                pVspeed = lengthdir_y(8, point_direction(x, y, hand_id.x, hand_id.y));
                image_index = 10;
                image_speed = 0;
                if (point_distance(x, y, hand_id.x, hand_id.y) <= 16 || get_collision(x + pHspeed, y + pVspeed) > 0 || get_collision(x + pHspeed, y + 6 + pVspeed) > 0)
                {
                    activity = 0;
                    activity_type = 0;
                    with (hand_id)
                    {
                        instance_destroy();
                    }
                }
            }
        }
        break;
    case 30:
        pHspeed = 0;
        pVspeed = 0;
        break;
}
