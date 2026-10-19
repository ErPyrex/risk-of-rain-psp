switch (activity)
{
    case 1:
        pHspeed = 0;
        if (floor(image_index) == 6 && activity_var1 == 0)
        {
            for (i = 0; i <= 40; i += 10)
            {
                if (place_meeting(x + (i * image_xscale), y - 1, pBlock) == 0 && place_meeting(x + ((30 + i) * image_xscale), y + 8, pBlock) == 1)
                {
                    x += (i * image_xscale);
                }
                else
                {
                    activity_var1 = 1;
                    break;
                }
                if (place_meeting(x, y, pFriend) == 1 && activity_var1 == 0)
                {
                    activity_var1 = 1;
                    oHUD.alarm[0] = 15;
                    fire_explosion(0, x + (10 * image_xscale), y + 8, skill[0, 5], 444, 2, -1, 1.5, 2);
                    break;
                }
                if (i == 40)
                {
                    activity_var1 = 1;
                    break;
                }
            }
            ghost_x = x;
            ghost_y = y;
        }
        activity_type = 1;
        sprite_index = sprite_shoot1;
        image_speed = 0.25;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            activity_type = 0;
            state = "chase";
        }
        break;
}
