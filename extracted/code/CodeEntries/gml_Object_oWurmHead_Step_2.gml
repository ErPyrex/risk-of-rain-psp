image_angle = direction;
for (i = 1; i <= body_count; i += 1)
{
    with (body[i])
    {
        if (instance_exists(parent))
        {
            var diff_hp = hp - lastHp;
            hp = other.hp;
            maxhp = other.maxhp;
            lastHp = other.hp;
            hp += diff_hp;
            image_angle = point_direction(x, y, parent.x, parent.y);
            x = parent.x - lengthdir_x(other.body_distance, image_angle);
            y = parent.y - lengthdir_y(other.body_distance, image_angle);
            if (other.type == 1)
            {
                sprite_index = sWurm1Body;
            }
            else
            {
                sprite_index = sWurm2Body;
            }
        }
    }
}
if (((hp <= 0 && (oInit.coop != 2 || global.host)) || force_death) && !dead)
{
    npc_death(1, force_death);
    dead = 1;
    hp = 0;
    if (type == 1)
    {
        sprite_index = sWurm1Dead;
    }
    else
    {
        sprite_index = sWurm2Dead;
    }
    caster_play(169, global.volume, 1.5);
}
if (dead == 1)
{
    hp = 0;
    direction = turn_towards_advanced(direction, 270, 1);
    speed += 0.1;
    exit;
}
if (type == 2)
{
    speed = 4;
}
else
{
    speed = 3;
}
ff += 0.05;
if (!dashing)
{
    direction = turn_towards_advanced(direction, point_direction(x, y, targetx, targety), 0.4);
}
direction += (1 * sin(ff));
if (shooting == 2)
{
    var timg = floor(image_index);
    if (type == 1)
    {
        oHUD.alarm[0] = 1;
        alarm[0] = 1;
        target = instance_nearest(x, y, oPOI);
        if (instance_exists(target))
        {
            targetx = target.x;
            targety = target.y;
        }
        var pd = point_direction(drawx, drawy, targetx, targety);
        drawx += lengthdir_x(2, pd);
        drawy += lengthdir_y(2, pd);
        if ((timg % 2) == 0 && timg == shooting_variable)
        {
            fire_explosion(2, drawx, drawy, 0.5, 444, 2, -1, 1, 2);
            bullet.percent_hp = 0.05;
            caster_play(40, global.volume, random_range(0.6, 0.8));
            caster_play(81, global.volume * 0.6, random_range(0.6, 0.8));
            shooting_variable += 2;
        }
        if (timg == (sprite_get_number(sprite_index) - 1))
        {
            shooting = 0;
            alarm[1] = 180 * (hp / maxhp);
            sprite_index = sWurm1Head;
        }
    }
    else
    {
        if ((timg == 0 || timg == 4 || timg == 8) && timg == shooting_variable)
        {
            oHUD.alarm[0] = 6;
            shooting_variable += 4;
            caster_play(40, global.volume * 0.5, 1.2);
            caster_play(37, global.volume, 0.7);
            for (i = -45; i <= 45; i += 15)
            {
                s = instance_create(x + lengthdir_x(20, direction), y + lengthdir_y(20, direction), oWurmMissile);
                s.damage = damage * 0.9;
                s.tracking = 0;
                s.parent = id;
                s.target = target;
                s.direction = point_direction(x, y, other.targetx, other.targety) + i;
                s.targetx = other.targetx;
                s.targety = other.targety;
                s.team = team;
                s.critical = 0;
            }
        }
        if (timg == (sprite_get_number(sprite_index) - 1))
        {
            shooting = 0;
            alarm[1] = 180;
            if (type == 2)
            {
                sprite_index = sWurm2Head;
            }
            else
            {
                sprite_index = sWurm1Head;
            }
        }
    }
}
