switch (activity)
{
    case 1:
        z_skill = 0;
        pHspeed = 0;
        for (i = 0; i < 8; i += 2)
        {
            if (activity_var1 == i && floor(image_index) == (6 + i))
            {
                if (i == 0)
                {
                    oHUD.alarm[0] = 1;
                }
                activity_var1 = i + 2;
                fire_explosion(0, x + (25 * image_xscale), y + 25, skill[0, 5], 444, 2, -1, 1.5, 1);
                bullet.percent_hp = 0.04;
                critical_chance_bonus = 0;
            }
        }
        activity_type = 1;
        sprite_index = sprite_shoot1;
        image_speed = 0.3 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            activity_type = 0;
            state = "chase";
        }
        break;
}
