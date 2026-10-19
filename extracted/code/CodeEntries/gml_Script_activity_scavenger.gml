switch (activity)
{
    case 1:
        z_skill = 0;
        pHspeed = 0;
        if (activity_var1 == 0 && floor(image_index) == 9)
        {
            oHUD.alarm[0] = 10;
            activity_var1 = 1;
            with (instance_create(x, y, oScavengerBullet))
            {
                speed = 5;
                direction = 90 - (90 * other.image_xscale);
                parent = other.id;
                team = other.team;
                critical = random(100) < other.critical_chance;
            }
            caster_play(37, global.volume, 0.7);
        }
        activity_type = 1;
        sprite_index = sprite_shoot1;
        image_speed = 0.22 * attack_speed;
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
        if (activity_var1 == 0 && floor(image_index) == 9)
        {
            oHUD.alarm[0] = 10;
            activity_var1 = 1;
            repeat (1)
            {
                s = instance_create(x + (10 * image_xscale), y - 15, oEfMissileEnemy);
                s.parent = id;
                s.damage = damage * 0.5;
                s.critical = random(100) < critical_chance;
                s.team = team;
            }
        }
        if (activity_var1 == 1 && floor(image_index) == 11)
        {
            oHUD.alarm[0] = 10;
            activity_var1 = 2;
            repeat (1)
            {
                s = instance_create(x + (10 * image_xscale), y - 15, oEfMissileEnemy);
                s.parent = id;
                s.damage = damage * 0.5;
                s.critical = random(100) < critical_chance;
                s.team = team;
            }
        }
        if (activity_var1 == 2 && floor(image_index) == 13)
        {
            oHUD.alarm[0] = 10;
            activity_var1 = 3;
            repeat (1)
            {
                s = instance_create(x + (10 * image_xscale), y - 15, oEfMissileEnemy);
                s.parent = id;
                s.damage = damage * 0.5;
                s.critical = random(100) < critical_chance;
                s.team = team;
            }
        }
        if (activity_var1 == 3 && floor(image_index) == 15)
        {
            oHUD.alarm[0] = 10;
            activity_var1 = 4;
            repeat (1)
            {
                s = instance_create(x + (10 * image_xscale), y - 15, oEfMissileEnemy);
                s.parent = id;
                s.damage = damage * 0.5;
                s.critical = random(100) < critical_chance;
                s.team = team;
            }
        }
        if (activity_var1 == 4 && floor(image_index) == 17)
        {
            oHUD.alarm[0] = 10;
            activity_var1 = 5;
            repeat (1)
            {
                s = instance_create(x + (10 * image_xscale), y - 15, oEfMissileEnemy);
                s.parent = id;
                s.damage = damage * 0.5;
                s.critical = random(100) < critical_chance;
                s.team = team;
            }
        }
        activity_type = 1;
        sprite_index = sprite_shoot2;
        image_speed = 0.2 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            activity_type = 0;
            state = "chase";
        }
        break;
    case 3:
        c_skill = 0;
        pHspeed = 0;
        if (activity_var1 == 0 && floor(image_index) == 8)
        {
            caster_play(57, global.volume, 0.7);
            oHUD.alarm[0] = 15;
            activity_var1 = 1;
            fire_bullet(0, x, y + 8, 0, skill[2, 5], 700, 293, 90 - (90 * image_xscale), 1, 1, -1);
            bullet.explosive_shot = 1;
        }
        activity_type = 1;
        sprite_index = sprite_shoot3;
        image_speed = 0.2 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            activity = 0;
            activity_type = 0;
            state = "chase";
        }
        break;
    case 4:
        pHspeed = 0;
        if (activity_var1 == 0 && floor(image_index) == 2)
        {
            oHUD.alarm[0] = 15;
            activity_var1 = 1;
            attack_speed_buffed = 1;
        }
        activity_type = 1;
        sprite_index = sScavengerBuff1;
        image_speed = 0.13 * attack_speed;
        if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
        {
            attack_speed += 0.4;
            image_speed = 0;
            activity = 0;
            activity_type = 0;
            state = "chase";
        }
        break;
}
