switch (activity)
{
    case 1:
        z_skill = 0;
        pHspeed = 0;
        if (activity_var1 == 0 && floor(image_index) == 5)
        {
            if (instance_exists(spat))
            {
                spat.alarm[0] = 1;
                fire_bullet(0, spat.x, spat.y, 1, skill[0, 5], 400, 528, spat.direction, 1, 1, -1);
            }
            activity_var1 = 1;
        }
        activity_type = 1;
        sprite_index = sprite_shoot1;
        image_speed = 0.2 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            activity_type = 0;
            state = "chase";
        }
        break;
}
