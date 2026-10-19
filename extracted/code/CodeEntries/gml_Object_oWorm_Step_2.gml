if (instance_exists(target) == 0)
{
    target = instance_find(oPOI, irandom(instance_number(oPOI) - 1));
}
if (elite == 1)
{
    image_blend = #87D6DA;
    elite = 2;
    hp *= 2.8;
    maxhp *= 2.8;
    damage *= 1.3;
}
step_boss(0);
if (head == -10 && alarm[0] == -1 && global.time_stop == 0)
{
    if (oInit.coop != 2 || global.host)
    {
        alarm[0] = ((45 + random(150)) * ceil(hp / maxhp)) / max_speed;
    }
}
worm_speed = 8 + ((1 - (hp / (max_speed * maxhp))) * 8);
worm_gravity = 0.1 + ((1 - (hp / (max_speed * maxhp))) * 0.2);
hp = max(0, hp);
if (head != -10 && instance_exists(head))
{
    if (((hp <= 0 && (oInit.coop != 2 || global.host)) || force_death) && head.dead == 0)
    {
        head.dead = 1;
        head.sprite_index = sWormHeadDead;
        var tp = instance_nearest(x, y, oP);
        caster_play(169, global.volume * 3, 1);
        if (oInit.coop != 2 || global.host)
        {
            if (random(100) < 85 || global.artifact_command)
            {
                with (tp)
                {
                    if (global.director.boss_drop == 0)
                    {
                        global.director.boss_drop = 1;
                        drop_item(2);
                    }
                    else
                    {
                        drop_item(1);
                    }
                }
            }
            else
            {
                instance_create(tp.x, tp.y - 15, oWormEye);
            }
        }
        with (head)
        {
            npc_death(1, other.force_death);
        }
        oHUD.boss = -1;
    }
}
if (!instance_exists(head) && ((hp <= 0 && (oInit.coop != 2 || global.host)) || force_death))
{
    instance_destroy();
}
