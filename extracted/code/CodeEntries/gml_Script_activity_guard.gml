switch (activity)
{
    case 1:
        z_skill = 0;
        pHspeed = 0;
        if (activity_var1 == 0 && floor(image_index) == 4)
        {
            activity_var1 = 1;
            with (instance_create(x + 9, y, oGuardBullet))
            {
                parent = other.id;
                team = other.team;
            }
            with (instance_create(x - 9, y, oGuardBullet))
            {
                parent = other.id;
                team = other.team;
            }
            caster_play(37, global.volume, 0.7);
        }
        activity_type = 1;
        sprite_index = sprite_shoot1;
        image_speed = 0.16 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            activity_type = 0;
            state = "chase";
        }
        break;
    case 2:
        x_skill = 0;
        pHspeed = 0;
        if (activity_var1 == 0 && floor(image_index) == 1)
        {
            activity_var1 = 1;
            oHUD.alarm[0] = 5;
            apply_buff(id, 8, 480);
            armor += 100;
            caster_play(63, global.volume, 0.5);
        }
        activity_type = 1;
        sprite_index = sprite_shoot2;
        image_speed = 0.16 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            activity_type = 0;
            state = "chase";
        }
        break;
}
