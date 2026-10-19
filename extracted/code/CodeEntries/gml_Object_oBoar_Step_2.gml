instance_activate_region(x - (view_wview[0] / 2) - 200, y - (view_hview[0] / 2) - 200, x + (view_wview[0] / 2) + 200, y + (view_hview[0] / 2) + 200, true);
if (lastHp > hp)
{
    caster_play(29, global.volume, 0.6);
    lastHp = hp;
}
if (global.time_stop == 0)
{
    if (collision_point(x + ((-sprite_get_xoffset(sprite_idle) + sprite_get_width(sprite_idle) + 2) * image_xscale * 0.4), (y - sprite_yoffset) + sprite_height + 3, oBossSpawn, 0, 1) > 0 && activity == 0)
    {
        if (moveLeft == 1 && activity == 0)
        {
            sprite_index = sprite_walk;
            image_xscale = -1;
            image_speed = 0.2;
            pHspeed = max(-pHmax, pHspeed - 0.1);
            if (floor(image_index) == 3 && inside_view(x, y) == 1)
            {
                if (exploded == 0)
                {
                    exploded = 1;
                    fire_explosion(0, x, (y - sprite_yoffset) + sprite_height, 1, 444, 2, -1, 3, 1);
                    caster_play(28, global.volume, 1 + random(0.3));
                }
                repeat (4)
                {
                    part_particles_create_color(global.above, (x - sprite_xoffset) + random(sprite_width), (y - sprite_yoffset) + sprite_height, global.pPixelDust, 3418409, 1);
                }
                oHUD.alarm[0] = 4;
            }
        }
        else if (moveRight == 1 && activity == 0)
        {
            sprite_index = sprite_walk;
            image_xscale = 1;
            image_speed = 0.2;
            pHspeed = min(pHmax, pHspeed + 0.1);
            if (floor(image_index) == 3 && inside_view(x, y) == 1)
            {
                if (exploded == 0)
                {
                    exploded = 1;
                    fire_explosion(0, x, (y - sprite_yoffset) + sprite_height, 1, 444, 2, -1, 3, 2);
                    caster_play(28, global.volume, 1 + random(0.3));
                }
                repeat (4)
                {
                    part_particles_create_color(global.above, (x - sprite_xoffset) + random(sprite_width), (y - sprite_yoffset) + sprite_height, global.pPixelDust, 3418409, 1);
                }
                oHUD.alarm[0] = 4;
            }
        }
    }
    else if (activity == 0)
    {
        pHspeed = -pHspeed;
        moveRight = !moveRight;
        moveLeft = !moveLeft;
    }
    if (instance_exists(target) == 1)
    {
        if (alarm[2] == -1 && point_distance(x, y, target.x, target.y) > 100)
        {
            oHUD.alarm[0] = 72;
            alarm[2] = 1140;
            image_index = 0;
            pHspeed = 0;
            sprite_index = sBoarShoot1;
            image_speed = 0.2;
            activity = 1;
            caster_play(31, global.volume, 1);
        }
        if (activity == 1)
        {
            if (oInit.coop != 2 || global.host)
            {
                if (floor(image_index) >= 4)
                {
                    repeat (4)
                    {
                        activity = 2;
                        xx = target.x;
                        yy = target.y;
                        i = instance_nearest(xx, yy, oB);
                        if (target.x > i.x)
                        {
                            s = instance_create(i.x + 8 + (irandom_range(0, i.width_box - 1) * 16), i.y, oSpawn);
                        }
                        else
                        {
                            s = instance_create(i.x + 8 + (irandom_range(0, ceil(i.width_box / 3) - 1) * 16), i.y, oSpawn);
                        }
                        s.sprite_index = sBoarMSpawn;
                        s.child = 288;
                        s.sound_spawn = -1;
                        s.y = (s.y + s.sprite_yoffset) - s.sprite_height;
                        s.elite = 0;
                        s.point_value = 0;
                        if (oInit.coop == 2)
                        {
                            server_message_send(0, 23, s.object_index, s.m_id, s.x, s.y, s.sprite_index, s.child, s.sound_spawn, s.elite, s.elite_tier, s.point_value, s.image_xscale, s.image_blend);
                        }
                    }
                }
            }
        }
    }
    if (activity == 2 && floor(image_index) >= 4)
    {
        oHUD.alarm[0] = 12;
    }
    x += pHspeed;
}
else
{
    image_speed = 0;
}
step_boss(0);
if ((hp <= 0 && (oInit.coop != 2 || global.host)) || force_death)
{
    oHUD.boss = -1;
    y -= 30;
    npc_death(1, force_death);
    y += 30;
    with (instance_create(x, y, oBoarCorpse))
    {
        image_xscale = other.image_xscale;
        pHspeed = other.pHspeed;
    }
    instance_destroy();
}
