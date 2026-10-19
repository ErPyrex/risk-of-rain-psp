if (instance_exists(parent) == 0)
{
    instance_destroy();
    exit;
}
if (state == 0)
{
    if (alarm[0] != -1)
    {
        speed = max(0, speed - 0.1);
    }
    else
    {
        speed = min(4, speed + 0.1);
        direction = point_direction(x, y, parent.x, parent.y);
        if (distance_to_object(parent) <= 1)
        {
            if (parent.x_stack < 10)
            {
                parent.x_stack += 1;
                number = parent.x_stack;
                state = 1;
                caster_play(101, global.volume, 1 + random(0.12));
            }
            else
            {
                instance_destroy();
            }
        }
    }
}
if (state == 1)
{
    speed = 0;
    image_xscale = parent.image_xscale;
    x = (parent.x + lengthdir_x(13 + (10 * (number > 5)), (parent.image_angle2 * sign(360 - (number * 71))) + (number * 72)) + x) / 2;
    y = ((parent.y - 8) + lengthdir_y(13 + (10 * (number > 5)), (parent.image_angle2 * sign(360 - (number * 71))) + (number * 72)) + y) / 2;
    with (parent)
    {
        if (((x_skill == 1 && other.number == x_stack && alarm[3] <= 1) || force_x == 1) && !dead)
        {
            with (other)
            {
                parent.force_x = 0;
                parent.alarm[3] = parent.skill[1, 2] * (1 - parent.cdr);
                state = 2;
                target = instance_nearest(x, y, pEnemy);
                parent.x_stack -= 1;
                sprite_index = sJanitorBabyHunt;
                caster_play(102, global.volume, 1 + random(0.1));
            }
        }
    }
}
if (state == 2)
{
    if (global.graphics == 3)
    {
        part_particles_create(global.above, x, y, global.pSpark, 1);
    }
    target = instance_nearest_variable(x, y, 321, "team", "enemy");
    speed = min(4, speed + 0.3);
    if (instance_exists(target))
    {
        direction = point_direction(x, y, target.x, target.y);
        alarm[1] = -1;
    }
    else
    {
        direction = 90 - (image_xscale * 90);
        alarm[1] = 180;
    }
}
if (state == 3)
{
    speed = min(7, speed + 0.2);
    direction = point_direction(x, y, parent.x, parent.y);
    if (place_meeting(x, y, parent) == 1)
    {
        caster_play(70, global.volume, 2 + random(0.3));
        parent.hp = min(parent.hp + (parent.maxhp * 0.08), parent.maxhp);
        instance_destroy();
        with (instance_create(x, y, oEfFlash))
        {
            parent = other.parent;
            image_blend = #7EB686;
        }
        i = instance_create(x, parent.y - 20, oEfDamage);
        i.critical = 0;
        i.damage = ceil(parent.maxhp * 0.08);
        i.team = "heal";
    }
}
