if (instance_exists(target) && global.time_stop == 0)
{
    image_speed = 0.3;
    direction = turn_towards_advanced(direction, target_direction, 0.4);
    speed = 2;
    if (target.x > x)
    {
        image_xscale = 1;
    }
    else
    {
        image_xscale = -1;
    }
    f += 0.05;
    yy = cos(f) * 3;
    if (alarm[1] == -1 && abs(target.y - y) < 40)
    {
        caster_play(91, global.volume, 1.5);
        alarm[1] = 120;
        for (i = -15; i < 30; i += 15)
        {
            with (instance_create(x, y, oBugBullet))
            {
                speed = 5;
                direction = (90 - (90 * other.image_xscale)) + other.i;
                parent = other.id;
                team = other.team;
                alarm[0] = 120;
            }
        }
        sprite_index = sBugShoot1;
    }
}
else if (global.time_stop != 0)
{
    speed = 0;
    image_speed = 0;
}
if (hp != lastHp)
{
    alarm[6] = 360;
}
if (lastHp > hp)
{
    lastHp = hp;
    caster_play(107, global.volume, 0.6);
}
if (((hp <= 0 && (oInit.coop != 2 || global.host)) || force_death) && dead == 0)
{
    s = instance_create(x, y, oEfBullet2);
    s.sprite_index = sBugDeath;
    instance_destroy();
}
