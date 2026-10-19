caster_set_volume(burn_loop, max(0, global.volume - (round(point_distance(x, y, oP.x, oP.y) / 400) / 10)));
for (i = 1; i <= 12; i += 1)
{
    with (body[i])
    {
        image_angle = point_direction(x, y, parent.x, parent.y);
        x = parent.x - lengthdir_x(21, image_angle);
        y = parent.y - lengthdir_y(21, image_angle);
    }
}
f += 0.05;
yy = cos(f);
image_angle = direction;
controller.hp = hp;
if (gravity != 0 && (target.y + 800) < y)
{
    instance_destroy();
}
if (dead == 0)
{
    if (place_meeting(x, y, pBlockMain) == 1 && place_meeting(x, y - 30, oWormHole) == 0 && alarm[0] == -1 && inside_view(x, y) == 1 && global.time_stop == 0)
    {
        caster_play(170, global.volume, 1.3);
        if (global.graphics == 3)
        {
            repeat (4)
            {
                part_particles_create(global.above, (x - 20) + random(40), (y - 20) + random(40), global.pRubble1, 1);
            }
        }
        oHUD.alarm[0] = 30;
        for (i = -2; i <= 2; i += 1)
        {
            s = instance_create(x + lengthdir_x(-sign(vspeed) * 60, image_angle) + (i * 8), y + lengthdir_y(-sign(vspeed) * 60, image_angle), oFireTrail);
            s.team = team;
            with (s)
            {
                move_contact_solid(270, 64);
            }
            damage_default(s, 0.2);
        }
        fire_explosion(0, x + lengthdir_x(-sign(vspeed) * 60, image_angle), y + lengthdir_y(-sign(vspeed) * 60, image_angle), 3, 444, 2, -1, 2, 2.5);
        with (bullet)
        {
            move_contact_solid(270, 64);
        }
        alarm[0] = 18;
    }
}
if (dead == 1)
{
    for (i = 1; i <= 12; i += 1)
    {
        with (body[i])
        {
            dead = 1;
            sprite_index = sWormBodyDead;
        }
    }
}
if (global.time_stop != 0)
{
    x = xprevious;
    y = yprevious;
    image_speed = 0;
    speed = 0;
}
else
{
    image_speed = 0.3;
}
