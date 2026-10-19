if (global.time_stop == 0)
{
    if (force_speedup == 1 && (oInit.coop == 2 && !global.host))
    {
        alarm[1] = 1;
        force_speedup = 0;
    }
    image_speed = 0.2;
    if (landing < 2)
    {
        if (speed != intended_speed)
        {
            speed += (sign(intended_speed - speed) * 0.1);
        }
        if (targetx > x)
        {
            image_xscale = 1;
        }
        else
        {
            image_xscale = -1;
        }
        if (landing == 0)
        {
            turn_towards(direction, point_direction(x, y, targetx, targety));
        }
        else
        {
            direction = point_direction(x, y, targetx, targety);
        }
    }
    if (landing == 1 && point_distance(x, y, targetx, targety) < 4 && y < targety)
    {
        speed = 0;
        y = targety;
        image_index = 0;
        sprite_index = sLizardFLand;
        landing = 2;
    }
}
else
{
    speed = 0;
    image_speed = 0;
}
if (lastHp > hp)
{
    alarm[6] = 360;
    lastHp = hp;
    if (make_sound == 0)
    {
        make_sound = 10;
        caster_play(116, global.volume, 1);
    }
}
make_sound = max(0, make_sound - 1);
if ((hp <= 0 && (oInit.coop != 2 || global.host)) || force_death)
{
    npc_death(1, 0);
    caster_play(111, global.volume, 1);
    s = instance_create(x, y, oEfBullet2);
    s.sprite_index = sLizardFDeath;
    s.image_speed = 0.2;
    s.image_xscale = image_xscale;
    s.image_yscale = 1;
    instance_destroy();
}
