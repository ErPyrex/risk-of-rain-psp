switch (activity)
{
    case 1:
        z_skill = 0;
        pHspeed = 0;
        if (activity_var1 == 0 && floor(image_index) == 4)
        {
            activity_var1 = 1;
            fire_explosion(0, x + (4 * image_xscale), y, skill[0, 5], 444, 2, -1, 1.2, 1);
            critical_chance_bonus = 0;
        }
        if (activity_var1 == 1 && floor(image_index) == 7)
        {
            activity_var1 = 2;
            fire_explosion(0, x + (4 * image_xscale), y, skill[0, 5], 444, 2, -1, 1.2, 1);
            bullet.climb = 12;
            critical_chance_bonus = 0;
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
            if (activity_var1 == 0 && floor(image_index) == 2)
            {
                activity_var1 = 1;
                if (instance_exists(target))
                {
                    teleport_nearby(id, target.x, target.y);
                }
            }
            if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
            {
                image_speed = 0;
                activity = 0;
                activity_type = 0;
                state = "chase";
                z_skill = 1;
            }
        }
        else
        {
            activity = 0;
            activity_type = 0;
        }
        break;
    case 3:
        if (instance_exists(parent))
        {
            c_skill = 0;
            pHspeed = 0;
            sprite_index = sprite_shoot2;
            image_speed = 0.23 * attack_speed;
            if (activity_var1 == 0 && floor(image_index) == 2)
            {
                activity_var1 = 1;
                if (instance_exists(parent))
                {
                    teleport_nearby(id, parent.x, parent.y);
                }
            }
            if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
            {
                image_speed = 0;
                activity = 0;
                activity_type = 0;
                state = "idle";
                target = -5;
            }
        }
        else
        {
            activity = 0;
            activity_type = 0;
        }
        break;
}
