switch (activity)
{
    case 1:
        z_skill = 0;
        pHspeed = 0;
        if (activity_var1 == 0 && floor(image_index) == 4)
        {
            caster_play(52, global.volume, random_range(0.9, 1));
            activity_var1 = 1;
            fire_explosion(0, x + (3 * image_xscale), y, skill[0, 5], 444, 2, -1, 1, 1);
            critical_chance_bonus = 0;
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
    case 2:
        invincible = 1;
        pHspeed = pHmax * 2 * image_xscale;
        activity_type = 1;
        sprite_index = sprite_shoot2;
        image_speed = 0.25;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            invincible = 0;
            image_speed = 0;
            pHspeed = 0;
            activity = 0;
            activity_type = 0;
            state = "chase";
            alarm[0] = 1;
        }
        break;
}
