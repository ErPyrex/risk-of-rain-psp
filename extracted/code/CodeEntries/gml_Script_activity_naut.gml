switch (activity)
{
    case 1:
        z_skill = 0;
        pHspeed = 0;
        if (activity_var1 == 0 && floor(image_index) == 5)
        {
            activity_var1 = 1;
            fire_bullet(0, x, y + 4, 0, skill[0, 5], 90, 528, 90 - (90 * image_xscale), 1, 1, -1);
            bullet.image_xscale = image_xscale;
            bullet.slow_on_hit = 1;
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
