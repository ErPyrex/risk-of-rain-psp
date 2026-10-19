switch (activity)
{
    case 1:
        if ((floor(image_index) == 0 || floor(image_index) == 2 || floor(image_index) == 4 || floor(image_index) == 5) && sprite_index == sprites1[1, 1])
        {
            ydisp = -1;
        }
        else
        {
            ydisp = 0;
        }
        image_index2 += (0.29 * attack_speed);
        for (t = 4; t < 8; t += 1)
        {
            if (activity_var1 == 0 && floor(image_index2) >= 4)
            {
                z_count += 1;
                activity_var1 = 1;
                if (drill != 0 && z_count >= max(1, 5 - drill))
                {
                    caster_play(70, global.volume, 1);
                    fire_bullet(0, x, y, 1, skill[0, 5], 700, 292, 90 - (90 * image_xscale2), 1, 1, -1);
                    with (instance_create(x, y, oEfBullet2))
                    {
                        sprite_index = sEfDrill;
                        image_xscale = other.image_xscale2;
                    }
                    z_count = 0;
                }
                else
                {
                    for (i = 0; i <= sp; i += 1)
                    {
                        with (instance_create(x + (9 * image_xscale2), y - (10 * i), oHuntressBolt1))
                        {
                            image_yscale = other.image_xscale2;
                            direction = 90 - (90 * other.image_xscale2);
                            parent = other.id;
                            team = other.team;
                        }
                    }
                }
                caster_play(92, global.volume, random_range(0.85, 1));
                critical_chance_bonus = 0;
            }
        }
        activity_type = 0;
        sprite_index2 = sprite_shoot1;
        if (floor(image_index2) >= (sprite_get_number(sprite_index2) - 1))
        {
            activity = 0;
            activity_type = 0;
        }
        break;
    case 2:
        if ((floor(image_index) == 0 || floor(image_index) == 2 || floor(image_index) == 4 || floor(image_index) == 5) && sprite_index == sprites1[1, 1])
        {
            ydisp = -1;
        }
        else
        {
            ydisp = 0;
        }
        image_index2 += (0.22 * attack_speed);
        if (activity_var1 == 0 && floor(image_index2) >= 5)
        {
            oHUD.alarm[0] = 3;
            activity_var1 = 1;
            for (i = 0; i <= sp; i += 1)
            {
                with (instance_create(x, y - (10 * i), oHuntressBoomerang))
                {
                    direction = 90 - (90 * other.image_xscale2);
                    parent = other.id;
                    team = other.team;
                }
            }
            caster_play(92, global.volume, random_range(1.35, 1.4));
            critical_chance_bonus = 0;
        }
        activity_type = 0;
        sprite_index2 = sprite_shoot2;
        if (floor(image_index2) >= (sprite_get_number(sprite_index2) - 1))
        {
            activity = 0;
            activity_type = 0;
        }
        break;
    case 3:
        break;
    case 4:
        if ((floor(image_index) == 0 || floor(image_index) == 2 || floor(image_index) == 4 || floor(image_index) == 5) && sprite_index == sprites1[1, 1])
        {
            ydisp = -1;
        }
        else
        {
            ydisp = 0;
        }
        image_index2 += (0.22 * attack_speed);
        if (activity_var1 == 0 && floor(image_index2) >= 5)
        {
            oHUD.alarm[0] = 3;
            activity_var1 = 1;
            for (i = 0; i <= sp; i += 1)
            {
                var obj;
                if (scepter != 0)
                {
                    obj = 195;
                }
                else
                {
                    obj = 194;
                }
                with (instance_create(x + (9 * image_xscale2), y - (10 * i), obj))
                {
                    direction = 90 - (90 * other.image_xscale2);
                    parent = other.id;
                    team = other.team;
                    scepter = other.scepter;
                }
            }
            caster_play(92, global.volume, random_range(0.6, 0.65));
            critical_chance_bonus = 0;
        }
        activity_type = 0;
        sprite_index2 = sprite_shoot4;
        if (floor(image_index2) >= (sprite_get_number(sprite_index2) - 1))
        {
            activity = 0;
            activity_type = 0;
        }
        break;
    case 30:
        pHspeed = 0;
        pVspeed = 0;
        break;
}
if (stance == 1)
{
    if (activity == 0)
    {
        half = 0;
    }
    sprite_idle = sprites1[half, 0];
    sprite_walk = sprites1[half, 1];
    sprite_jump = sprites1[half, 2];
    if (sprite_index == sprites1[1, 0] && half == 0)
    {
        sprite_index = sprites1[0, 0];
    }
    if (sprite_index == sprites1[1, 1] && half == 0)
    {
        sprite_index = sprites1[0, 1];
    }
    if (sprite_index == sprites1[1, 2] && half == 0)
    {
        sprite_index = sprites1[0, 2];
    }
}
if (stance == 2)
{
    if (activity == 0)
    {
        half = 0;
    }
    sprite_idle = sprites2[half, 0];
    sprite_walk = sprites2[half, 1];
    sprite_jump = sprites2[half, 2];
    if (sprite_index == sprites2[1, 0] && half == 0)
    {
        sprite_index = sprites2[0, 0];
    }
    if (sprite_index == sprites2[1, 1] && half == 0)
    {
        sprite_index = sprites2[0, 1];
    }
    if (sprite_index == sprites2[1, 2] && half == 0)
    {
        sprite_index = sprites2[0, 2];
    }
}
