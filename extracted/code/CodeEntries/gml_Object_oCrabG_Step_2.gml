step_boss(0);
dot_immune = max(0, dot_immune - 1);
if (lastHp > hp)
{
    caster_play(85, global.volume, 1);
    lastHp = hp;
}
if (global.time_stop == 0)
{
    if (collision_point(x - ((sprite_get_xoffset(sprite_idle) - 5) * image_xscale), (y - sprite_yoffset) + sprite_height + 3, oBossSpawn, 0, 1) > 0 && collision_point(x + ((-sprite_get_xoffset(sprite_idle) + sprite_get_width(sprite_idle) + 5) * image_xscale), (y - sprite_yoffset) + sprite_height + 3, oBossSpawn, 0, 1) > 0)
    {
        if (moveLeft == 1 && activity == 0)
        {
            sprite_index = sprite_walk;
            image_xscale = -1;
            image_speed = 0.2;
            pHspeed = -pHmax;
        }
        else if (moveRight == 1 && activity == 0)
        {
            sprite_index = sprite_walk;
            image_xscale = 1;
            image_speed = 0.2;
            pHspeed = pHmax;
        }
    }
    else
    {
        pHspeed = 0;
        image_speed = 0.2;
        if (activity == 0)
        {
            sprite_index = sprite_idle;
        }
    }
    x += pHspeed;
    if (activity == 0 && free == 0 && alarm[2] == -1 && z_skill == 1)
    {
        alarm[2] = 240;
        activity_var1 = 0;
        activity = 1;
        pHspeed = 0;
        image_index = 0;
    }
    if (activity == 0 && free == 0 && alarm[3] == -1 && x_skill == 1)
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
            if (activity_var1 == 0 && floor(image_index) == 6)
            {
                caster_play(147, global.volume, 1);
                activity_var1 = 1;
                fire_explosion(0, x + (84 * image_xscale), (y - sprite_yoffset) + sprite_height, 1, 444, 2, -1, 2.5, 1);
                oHUD.alarm[0] = 15;
            }
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
            x_skill = 0;
            if (activity_var1 == 0 && floor(image_index) == 7)
            {
                caster_play(83, global.volume, 1);
                activity_var1 = 1;
                fire_explosion(0, x + (34 * image_xscale), y, 1, 444, 2, -1, 1, 7);
                oHUD.alarm[0] = 35;
                if (oInit.coop != 2 || global.host)
                {
                    i = -max_spawns / 2;
                    while (i < (max_spawns / 2))
                    {
                        s = instance_create(x + (32 * i), (y - sprite_yoffset) + sprite_height, oSpawn);
                        s.sprite_index = sGolemSpawn;
                        s.child = 231;
                        s.y = (s.y + s.sprite_yoffset) - s.sprite_height;
                        s.elite = 0;
                        s.sound_spawn = 86;
                        if (image_blend != c_white)
                        {
                            s.elite = 1;
                            s.image_blend = image_blend;
                            if (image_blend == c_red)
                            {
                                s.sprite_index = sWispSpawn;
                                s.child = 252;
                                s.sound_spawn = 167;
                            }
                            if (image_blend == #87D6DA)
                            {
                                s.elite = 0;
                                s.sprite_index = sJellyWalk;
                                s.child = 245;
                                s.sound_spawn = 107;
                            }
                        }
                        if (oInit.coop == 2)
                        {
                            server_message_send(0, 23, s.object_index, s.m_id, s.x, s.y, s.sprite_index, s.child, s.sound_spawn, s.elite, s.elite_tier, s.point_value, s.image_xscale, s.image_blend);
                        }
                        i += 1;
                    }
                }
            }
            sprite_index = sprite_shoot2;
            image_speed = 0.18 * attack_speed;
            if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
            {
                image_speed = 0;
                activity = 0;
                activity_type = 0;
                state = "chase";
            }
            break;
    }
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
