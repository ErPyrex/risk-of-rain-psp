for (i = 0; i <= ceil((xprevious - x) / 24); i += 1)
{
    if (xprevious != x)
    {
        s = instance_create(x + (i * ceil((xprevious - x) / 14)), y - 30, oFireTrail);
        s.team = team;
        damage_default(s, 0.35);
        s.sprite_index = sEfFireTrail2;
        with (s)
        {
            if (place_meeting(x, y, oFireTrail) == 1)
            {
                instance_destroy();
            }
        }
    }
}
step_boss(0);
dot_immune = max(0, dot_immune - 1);
if (lastHp > hp)
{
    caster_play(85, global.volume, 1);
    lastHp = hp;
}
var test = collision_point(x + (80 * image_xscale), (y - sprite_yoffset) + sprite_height + 3, oBossSpawn2, 0, 1) > 0;
if (global.time_stop == 0)
{
    if (test == 1)
    {
        if (activity == 0)
        {
            if ((moveLeft == 1 || moveRight == 1) && ((floor(image_index) == 0 && foot == 1) || (floor(image_index) == 4 && foot == 0)))
            {
                if (foot == 0)
                {
                    foot = 1;
                }
                else
                {
                    foot = 0;
                }
                oHUD.alarm[0] = 1;
            }
            if (moveLeft == 1)
            {
                sprite_index = sprite_walk;
                image_xscale = -1;
                image_speed = 0.2;
                pHspeed = -1.7;
            }
            else if (moveRight == 1)
            {
                sprite_index = sprite_walk;
                image_xscale = 1;
                image_speed = 0.2;
                pHspeed = 1.7;
            }
        }
        else
        {
        }
        if ((moveLeft == 0 && moveRight == 0) && activity == 0)
        {
            pHspeed = 0;
            if (activity == 0)
            {
                sprite_index = sprite_idle;
                image_speed = 0.2;
            }
        }
    }
    else
    {
        pHspeed = 0;
        if (activity == 0)
        {
            sprite_index = sprite_idle;
        }
        image_speed = 0.2;
    }
    if (activity == 0 && free == 0 && (alarm[2] == -1 || (oInit.coop == 2 && !global.host)) && z_skill == 1)
    {
        alarm[2] = 120;
        activity_var1 = 0;
        activity = 1;
        pHspeed = 0;
        image_index = 0;
    }
    if (activity == 0 && free == 0 && (alarm[3] == -1 || (oInit.coop == 2 && !global.host)) && x_skill == 1)
    {
        alarm[3] = 1440;
        activity_var1 = 0;
        activity = 2;
        pHspeed = 0;
        image_index = 0;
    }
    switch (activity)
    {
        case 1:
            z_skill = 0;
            if (activity_var1 == 0 && floor(image_index) == 7)
            {
                caster_play(147, global.volume, 1);
                activity_var1 = 1;
                fire_explosion(0, x + (28 * image_xscale), y + 20, 2, 444, 2, -1, 3.5, 6);
                with (instance_create(x + (60 * image_xscale), y, oIfritBullet))
                {
                    direction = 90 - (90 * other.image_xscale);
                    image_xscale = other.image_xscale;
                    parent = other.id;
                    team = other.team;
                }
                oHUD.alarm[0] = 15;
            }
            sprite_index = sprite_shoot1;
            image_speed = 0.15 * attack_speed;
            if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
            {
                image_speed = 0;
                activity = 0;
                activity_type = 0;
                state = "chase";
                alarm[2] = 30;
                alarm[0] = 1;
            }
            break;
        case 2:
            x_skill = 0;
            if (activity_var1 == 0 && floor(image_index) == 1 && instance_exists(target))
            {
                oHUD.alarm[0] = 5;
                with (instance_create(target.x - 200, target.y, oIfritTower))
                {
                    teleport_nearby(id, x, y);
                }
                activity_var1 = 1;
            }
            if (activity_var1 == 1 && floor(image_index) == 4 && instance_exists(target))
            {
                oHUD.alarm[0] = 5;
                with (instance_create(target.x + 200, target.y, oIfritTower))
                {
                    teleport_nearby(id, x, y);
                }
                activity_var1 = 2;
            }
            sprite_index = sprite_shoot2;
            image_speed = 0.15 * attack_speed;
            if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
            {
                image_speed = 0;
                activity = 0;
                activity_type = 0;
                state = "chase";
                alarm[0] = 1;
                alarm[3] = 1200;
            }
            break;
    }
    x += pHspeed;
}
else
{
    image_speed = 0;
}
if ((hp <= 0 && (oInit.coop != 2 || global.host)) || force_death)
{
    oHUD.boss = -1;
    npc_death(0, force_death);
}
