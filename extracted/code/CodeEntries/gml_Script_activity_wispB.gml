switch (activity)
{
    case 1:
        z_skill = 0;
        pHspeed = 0;
        if (activity_var1 == 0 && floor(image_index) == 0 && instance_exists(target))
        {
            activity_var1 = 1;
            i = -max_bullets / 2;
            while (i <= max_bullets)
            {
                s = instance_create(target.x + (i * 56 * (4 / max_bullets)), target.y, oWispBMine);
                s.alarm[0] = (50 + (i * 5)) / attack_speed;
                s.damage = ceil(damage * 1.5);
                s.team = team;
                s.parent = id;
                s.image_blend = image_blend;
                s.explosive_shot = explosive_shot;
                i += 1;
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
