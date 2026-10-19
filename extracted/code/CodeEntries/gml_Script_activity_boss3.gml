switch (activity)
{
    case 1.1:
        z_skill = 0;
        pHspeed = 0;
        if (free == 0)
        {
            pHspeed = 0;
        }
        if (activity_var1 == 0 && floor(image_index) == 4)
        {
            caster_play(32, global.volume, 1);
            oHUD.alarm[0] = 4;
            for (i = 0; i <= 20; i += 5)
            {
                place_meeting(x, y, pBlock);
                if (place_meeting(x + (i * image_xscale), y - 1, pBlock) == 0 && place_meeting(x + ((30 + i) * image_xscale), y + 8, pBlock) == 1)
                {
                    var tdust = instance_create(x, y + 10, oMinerDust);
                    tdust.image_xscale = image_xscale;
                    x += (i * image_xscale);
                }
                else
                {
                    activity_var1 = 1;
                    break;
                }
                if (i == 15)
                {
                    activity_var1 = 1;
                    break;
                }
            }
            ghost_x = x;
            ghost_y = y;
            activity_var1 = 1;
            fire_explosion(0, x - (12 * image_xscale), y + 8, skill[1, 5], 298, 2, -1, 2.2, 3);
            bullet.percent_hp = 0.08;
        }
        activity_type = 1;
        sprite_index = sprite_shootZ1;
        image_speed = 0.23 * attack_speed;
        if (floor(image_index) == 0 && activity_var1 == 1)
        {
            image_speed = 0;
            activity = 0;
            activity_type = 0;
            state = "chase";
        }
        break;
    case 1.2:
        z_skill = 0;
        activity_type = 1;
        if (instance_exists(target))
        {
            pHspeed = 0;
            sprite_index = sprite_shootZ2;
            image_speed = 0.24;
            if (activity_var1 == 0 && floor(image_index) == 9)
            {
                activity_var1 = 1;
                if (instance_exists(target))
                {
                    teleport_nearby2(id, target.x, target.y);
                    instance_activate_region(x - sprite_width, y - sprite_height, sprite_width * 2, 200 + pVspeed, true);
                    move_contact_solid(270, 150);
                    ghost_x = x;
                    ghost_y = y;
                }
            }
            if (activity_var1 == 1 && floor(image_index) == 15)
            {
                caster_play(32, global.volume, 1.3);
                oHUD.alarm[0] = 9;
                activity_var1 = 2;
                fire_explosion(0, x, y - 10, skill[1, 5], 298, 2, -1, 1.2, 7);
                bullet.percent_hp = 0.12;
                repeat (8)
                {
                    part_particles_create(global.above, (x - 30) + random(60), y, global.pRubble2, 1);
                }
            }
        }
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            activity_type = 0;
            state = "chase";
        }
        break;
    case 2.1:
        x_skill = 0;
        pHspeed = 0;
        if (activity_var1 == 0 && floor(image_index) == 9)
        {
            for (i = 0; i < 10; i += 1)
            {
                part_particles_create(global.above, x, (y + 6) - (i * 10), global.pRubble2, 3);
            }
            oHUD.alarm[0] = 6;
            activity_var1 = 1;
            with (instance_create(x + 60, y, oBoss1Bullet1))
            {
                direction = 0;
                image_xscale = 1;
                parent = other.id;
            }
            with (instance_create(x - 60, y, oBoss1Bullet1))
            {
                direction = 180;
                image_xscale = -1;
                parent = other.id;
            }
            critical_chance_bonus = 0;
        }
        activity_type = 1;
        sprite_index = sprite_shootX1;
        image_speed = 0.2 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            activity_type = 0;
            state = "chase";
        }
        break;
    case 3.1:
        c_skill = 0;
        pHspeed = 0;
        image_speed = 0.25 * attack_speed;
        if (activity_var1 == 0)
        {
            sprite_index = sprite_shootC1_1;
            if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
            {
                bb = 10;
                bb_current = 1;
                activity_var1 = 1;
                image_index = 0;
                sprite_index = sprite_shootC1_2;
                image_speed = 0.2 * attack_speed;
            }
        }
        else
        {
            sprite_index = sprite_shootC1_2;
            if (activity_var1 == bb_current && floor(image_index) == 1)
            {
                activity_var1 += 1;
                with (oP)
                {
                    if (dead == 0)
                    {
                        var tskill = instance_create(x, y, oBossSkill2);
                        tskill.alarm[1] = 60;
                    }
                }
            }
            activity_type = 1;
            if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
            {
                if (activity_var1 != bb_current)
                {
                    bb_current += 1;
                }
                if (bb_current == 16)
                {
                    image_speed = 0;
                    activity = 0;
                    activity_type = 0;
                    state = "chase";
                }
            }
        }
        break;
    case 3.2:
        c_skill = 0;
        pHspeed = 0;
        image_speed = 0.2 * attack_speed;
        if (activity_var1 == 0)
        {
            sprite_index = sprite_shootC1_1;
            if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
            {
                bb = 10;
                bb_current = 1;
                activity_var1 = 1;
                image_index = 0;
                sprite_index = sprite_shootC1_2;
                image_speed = 0.2 * attack_speed;
            }
        }
        else
        {
            sprite_index = sprite_shootC1_2;
            if (activity_var1 == bb_current && floor(image_index) == 1)
            {
                activity_var1 += 1;
                with (oP)
                {
                    if (dead == 0)
                    {
                        instance_create(x, y, oBossSkill1);
                        repeat (1)
                        {
                            instance_create(x + (random_range(10, 70) * choose(1, -1)), y + (random_range(10, 70) * choose(1, -1)), oBossSkill1);
                        }
                    }
                }
            }
            activity_type = 1;
            if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
            {
                if (activity_var1 != bb_current)
                {
                    bb_current += 1;
                }
                if (bb_current == 16)
                {
                    image_speed = 0;
                    activity = 0;
                    activity_type = 0;
                    state = "chase";
                }
            }
        }
        break;
}
