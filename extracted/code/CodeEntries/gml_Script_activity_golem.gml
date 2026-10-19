switch (activity)
{
    case 1:
        z_skill = 0;
        pHspeed = 0;
        if (activity_var1 == 0 && floor(image_index) == 4)
        {
            activity_var1 = 1;
            fire_explosion(0, x + (12 * image_xscale), y, skill[0, 5], 444, 2, -1, 0.6, 5);
            oHUD.alarm[0] = 5;
            caster_play(sound_attack1, global.volume, 1);
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
}
