if (image_blend != c_white)
{
    sprite_index = sWormHeadElectric;
}
if (oInit.skip == 1)
{
    instance_activate_region(x - 16, y + 16, 32, 32, true);
}
if (instance_exists(oP))
{
    audio_sound_gain(wWormBurning, max(0, global.volume - (round(point_distance(x, y, oP.x, oP.y) / 400) / 10)), 0);
}
for (i = 1; i <= 19; i += 1)
{
    with (body[i])
    {
        if (instance_exists(parent))
        {
            image_angle = point_direction(x, y, parent.x, parent.y);
            x = parent.x - lengthdir_x(19, image_angle);
            y = parent.y - lengthdir_y(19, image_angle);
        }
    }
}
f += 0.05;
yy = cos(f);
image_angle = direction;
if (instance_exists(controller))
{
    controller.hp = hp;
}
if (instance_exists(target))
{
    if (abs(gravity - worm_gravity) < 0.1 && vspeed > 0 && y < target.y && dead == 0)
    {
        direction += (sign(((((point_direction(x, y, target.x, target.y) - direction) % 360) + 540) % 360) - 180) * 1);
    }
    if (gravity != 0 && (target.y + 800) < y)
    {
        instance_destroy();
    }
}
else if (gravity != 0 && y > room_height)
{
    instance_destroy();
}
if (dead == 0)
{
    if (place_meeting(x, y, pBlockMain) == 1 && place_meeting(x, y - 30, oWormHole) == 0 && alarm[0] == -1 && inside_view(x, y) == 1 && global.time_stop == 0)
    {
        caster_play(170, global.volume, 1);
        if (global.graphics == 3)
        {
            repeat (8)
            {
                part_particles_create(global.above, (x - 20) + random(40), (y - 20) + random(40), global.pRubble1, 1);
            }
        }
        if (instance_exists(oHUD))
        {
            oHUD.alarm[0] = 30;
        }
        for (i = -3; i <= 3; i += 1)
        {
            s = instance_create(x + lengthdir_x(-sign(vspeed) * 60, image_angle) + (i * 8), y + lengthdir_y(-sign(vspeed) * 60, image_angle), oFireTrail);
            s.team = team;
            with (s)
            {
                move_contact_solid(270, 64);
            }
            damage_default(s, 0.2);
        }
        fire_explosion(2, x + lengthdir_x((vspeed < 0) * 60, image_angle), y + lengthdir_y((vspeed < 0) * 60, image_angle), 1.2, 444, 2, -1, 2, 2.5);
        with (bullet)
        {
            move_contact_solid(270, 64);
        }
        alarm[0] = 18;
    }
}
if (dead == 1)
{
    for (i = 1; i <= 19; i += 1)
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
