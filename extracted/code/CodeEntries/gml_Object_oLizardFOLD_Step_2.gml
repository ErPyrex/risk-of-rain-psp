if (random(100) < 0.5 && inside_view(x, y) == 1 && global.graphics == 3)
{
    part_particles_create(global.above, x, y, global.pDust1, 1);
}
image_angle = direction;
if (image_angle > 90 && image_angle < 270)
{
    image_yscale = -1;
}
else
{
    image_yscale = 1;
}
if (hp != lastHp)
{
    alarm[6] = 360;
}
if (target != -1 && global.time_stop == 0 && instance_exists(target))
{
    if (point_distance(x, y, target.x, target.y) < 150 && alarm[2] == -1)
    {
        image_speed = 0.4;
        turn_towards(direction, point_direction(x, y, xx, yy));
        if (distance_to_point(xx, yy) < 5)
        {
            alarm[2] = 180;
        }
        speed = min(speed + 0.05, 2.2);
    }
    else
    {
        image_speed = 0.2;
        turn_towards(direction, point_direction(x, y, (target.x - 20) + random(40), (target.y - 20) + random(40)));
        speed = max(speed - 0.05, max_speed);
        xx = target.x;
        yy = target.y;
    }
}
else
{
    target = instance_nearest(x, y, oP);
}
if (global.time_stop != 0)
{
    speed = 0;
    image_speed = 0;
}
if (hp <= 0 && dead == 0)
{
    s = instance_create(x, y, oEfBullet2);
    s.sprite_index = sJellyMissile;
    instance_destroy();
}
if (lastHp > hp)
{
    lastHp = hp;
    if (make_sound == 0)
    {
        make_sound = 10;
        caster_play(107, global.volume, 1);
    }
}
make_sound = max(0, make_sound - 1);
