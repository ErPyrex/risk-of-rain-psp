switch (activity)
{
    case 1:
        z_skill = 0;
        pHspeed = 0;
        if (activity_var1 == 0 && floor(image_index) == 5)
        {
            activity_var1 = 1;
            with (instance_create(x, y, oMushDust))
            {
                damage = ceil(other.damage * 0.4);
                parent = other.id;
                team = other.team;
            }
            oHUD.alarm[0] = 5;
            caster_play(sound_attack1, global.volume, 1);
        }
        activity_type = 1;
        sprite_index = sprite_shoot1;
        image_speed = 0.23 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            activity_type = 0;
            state = "chase";
        }
        break;
}
