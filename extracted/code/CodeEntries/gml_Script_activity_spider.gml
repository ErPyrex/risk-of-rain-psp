switch (activity)
{
    case 1:
        z_skill = 0;
        pHspeed = 0;
        if (activity_var1 == 0)
        {
            activity_var1 = 1;
            with (instance_create(x, y, oSpiderBullet))
            {
                speed = 5;
                direction = 90 - (90 * other.image_xscale);
                parent = other.id;
                team = other.team;
            }
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
