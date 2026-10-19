switch (activity)
{
    case 1:
        z_skill = 0;
        pHspeed = 0;
        if (activity_var1 == 0 && floor(image_index) == 7)
        {
            activity_var1 = 1;
            fire_explosion(0, x, y, skill[0, 5], 444, 2, -1, 2.5, 4);
            caster_play(63, global.volume * 0.6, random_range(1.2, 1.3));
            caster_play(81, global.volume, 1);
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
}
