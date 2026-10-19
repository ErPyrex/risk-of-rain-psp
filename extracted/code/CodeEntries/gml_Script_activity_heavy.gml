switch (activity)
{
    case 1:
        if (free == 0)
        {
            pHspeed = 0;
        }
        if (activity_var1 == 0)
        {
            activity_var1 = 1;
            if (check_trace(200, 90 - (90 * image_xscale)) == 1)
            {
                d = (150 - distance_to_object(s)) / 150;
            }
            else
            {
                d = 1;
            }
            fire_bullet(0, x, y - 3, 0, skill[0, 5] * d, 150, 292, 90 - (90 * image_xscale), 1, 1, -1);
            critical_chance_bonus = 0;
        }
        activity_type = 1;
        sprite_index = sprite_shoot1;
        image_speed = 0.3 * attack_speed;
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
            fire_explosion(0, x + (40 * image_xscale), y, skill[1, 5], 293, 1, 883, 2, 2);
            bullet.stun = 1;
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
        invincible = 1;
        if (pHspeed != 0)
        {
            pHspeed = pHmax * 2;
        }
        else
        {
            pHspeed = 2.6;
        }
        activity_type = 1;
        sprite_index = sprite_shoot3;
        image_speed = 0.25;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            invincible = 0;
            image_speed = 0;
            pHspeed = 0;
            activity = 0;
            activity_type = 0;
        }
        break;
    case 30:
        pHspeed = 0;
        s = collision_point(x, ceil(y) - sprite_yoffset, pRope, 0, 1);
        if (s < 0)
        {
            activity = 0;
            activity_type = 0;
        }
        break;
}
