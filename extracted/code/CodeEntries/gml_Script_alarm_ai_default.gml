if (oInit.coop == 2 && !global.host)
{
    exit;
}
var tmoveLeft = moveLeft;
var tmoveRight = moveRight;
var tmoveUp = moveUp;
var tsz = z_skill;
var tsx = x_skill;
var tsc = c_skill;
var tsv = v_skill;
alarm[0] = 15 + random(10);
if (room != rCutscene4)
{
    var tnp = instance_nearest(x, y, oP);
    if (point_distance(tnp.x, tnp.y, x, y) < 800 && ghost == 0)
    {
        death_timer = 3600;
        disable_ai = 0;
    }
    else if (death_timer <= 0 && (ghost == 1 || global.director.alarm[1] != -1))
    {
        if (ghost == 0 && room != rPigbeach)
        {
            global.director.points += point_value * 0.8;
            if (oInit.coop == 2)
            {
                server_message_send(0, 17, object_index, m_id);
            }
            instance_destroy();
        }
        else
        {
            hp = 0;
        }
    }
    else if (ghost != 1)
    {
        disable_ai = 1;
        pHspeed = 0;
        exit;
    }
}
if (global.time_stop == 0 && alarm[7] == -1)
{
    if (instance_exists(target))
    {
        if (image_blend == #F3A556 && random(100) < 12 && point_distance(x, y, target.x, target.y) < 250)
        {
            s = instance_create(x, y, oEfMissileEnemy);
            s.parent = id;
            s.damage = damage * 1;
            s.team = team;
        }
    }
    if (image_blend == #7EB686 && random(100) < 4)
    {
        with (instance_create(x, y, oEfCircle))
        {
            image_blend = #7EB686;
            radius = 12;
        }
        for (i = 0; i <= 5; i += 1)
        {
            var t = instance_find(pEnemy, i);
            if (t != id && distance_to_object(t) < 100)
            {
                if (t != -4)
                {
                    apply_buff(t, 6, 180);
                }
                else
                {
                    break;
                }
            }
        }
    }
    if (image_blend == #7C88B8 && random(100) < 30)
    {
        var t = instance_create((x - 10) + random(20), (y - 10) + random(20), oChainLightning);
        t.team = team + "proc";
        t.damage = ceil(damage / 6);
    }
    if ((image_blend == #EFD27B || elite_tier > 9) && random(100) < 4 && instance_exists(target) && activity == 0)
    {
        if (target.parent.free == 0 && target.parent.activity != 30)
        {
            alarm[2] = 60;
            alarm[3] = 60;
            alarm[4] = 60;
            alarm[5] = 60;
            teleport_nearby(id, (target.x - 20) + random(40), target.y);
            if (oInit.coop == 2 && global.host)
            {
                server_message_send(0, 37, object_index, m_id, x, y);
            }
            if (elite_tier <= 9)
            {
                with (instance_create(x, y, oEfFlash))
                {
                    parent = other.id;
                    image_blend = #EFD27B;
                }
            }
        }
    }
}
z_skill = 0;
if (instance_exists(target) == 0)
{
    if (team == "enemy")
    {
        target = instance_nearest(x, y, oPOI);
    }
    if (team == "player")
    {
        with (pEnemy)
        {
            if (point_distance(x, y, other.x, other.y) < 200 && team == "enemy")
            {
                other.target = id;
                break;
            }
        }
    }
}
switch (state)
{
    case "idle":
        moveLeft = choose(1, 0);
        moveRight = choose(1, 0);
        z_skill = 0;
        x_skill = 0;
        if (instance_exists(target) == 1)
        {
            if (point_distance(target.x, target.y, x, y) < 500 && (target.y - y) < 32)
            {
                state = "chase";
            }
            else
            {
                alarm[0] = 120;
            }
        }
        break;
    case "chase":
        if (instance_exists(target) == 1 && global.time_stop == 0)
        {
            if ((target.y - y) <= 64)
            {
                var tabsx = abs(target.x - x);
                if (point_distance(x, y, target.x, target.y) > 500)
                {
                    state = "idle";
                }
                if (target.x > x)
                {
                    moveLeft = 0;
                    moveRight = 1;
                    image_xscale = abs(image_xscale);
                }
                else if (target.x < x)
                {
                    moveLeft = 1;
                    moveRight = 0;
                    image_xscale = -abs(image_xscale);
                }
                if (tabsx < z_range && abs(target.y - y) < 64 && alarm[2] == -1)
                {
                    alarm[0] = 5;
                    state = "attack1";
                    if (tabsx < 20)
                    {
                        moveLeft = 0;
                        moveRight = 0;
                    }
                }
                if (tabsx < x_range && abs(target.y - y) < 64 && alarm[3] == -1)
                {
                    alarm[0] = 5;
                    state = "attack2";
                    if (tabsx < 20)
                    {
                        moveLeft = 0;
                        moveRight = 0;
                    }
                }
                if (tabsx < c_range && abs(target.y - y) < 64 && alarm[4] == -1)
                {
                    alarm[0] = 5;
                    state = "attack3";
                    if (tabsx < 20)
                    {
                        moveLeft = 0;
                        moveRight = 0;
                    }
                }
                if (tabsx < v_range && abs(target.y - y) < 64 && alarm[5] == -1)
                {
                    alarm[0] = 5;
                    state = "attack4";
                    if (tabsx < 20)
                    {
                        moveLeft = 0;
                        moveRight = 0;
                    }
                }
            }
            else
            {
                state = "idle";
            }
        }
        else if (global.time_stop == 0)
        {
            state = "idle";
        }
        if (target == -1)
        {
            state = "idle";
        }
        if (get_collision_rec(bbox_left + (8 * image_xscale) + 1, bbox_top, bbox_right + (8 * image_xscale), bbox_top) && !get_collision_rec(bbox_left + (8 * image_xscale) + 1, bbox_top - 18, bbox_right + (8 * image_xscale), bbox_bottom - 18) && can_jump)
        {
            moveUp = 1;
        }
        break;
    case "feared":
        if (instance_exists(target) == 1)
        {
            if (target.x > x)
            {
                moveLeft = 1;
                moveRight = 0;
            }
            if (target.x < x)
            {
                moveLeft = 0;
                moveRight = 1;
            }
        }
        else
        {
            state = "idle";
        }
        break;
    case "taunted":
        if (instance_exists(oEfDecoy) == 1)
        {
            var t = instance_nearest(x, y, oEfDecoy);
            if (t.x > x)
            {
                moveLeft = 0;
                moveRight = 1;
            }
            if (t.x < x)
            {
                moveLeft = 1;
                moveRight = 0;
            }
        }
        else
        {
            state = "idle";
        }
        break;
    case "attack1":
        if (instance_exists(target) == 1)
        {
            if ((target.x < x) < 20)
            {
                moveLeft = 0;
                moveRight = 0;
            }
            z_skill = 1;
        }
        else
        {
            state = "idle";
        }
        z_skill = 1;
        break;
    case "attack2":
        if (instance_exists(target) == 1)
        {
            if (abs(target.x - x) < 20)
            {
                moveLeft = 0;
                moveRight = 0;
            }
            x_skill = 1;
        }
        else
        {
            state = "idle";
        }
        x_skill = 1;
        break;
    case "attack3":
        if (instance_exists(target) == 1)
        {
            if (abs(target.x - x) < 20)
            {
                moveLeft = 0;
                moveRight = 0;
            }
            c_skill = 1;
        }
        else
        {
            state = "idle";
        }
        break;
    case "attack4":
        if (instance_exists(target) == 1)
        {
            if (abs(target.x - x) < 20)
            {
                moveLeft = 0;
                moveRight = 0;
            }
            v_skill = 1;
        }
        else
        {
            state = "idle";
        }
        break;
}
if (tmoveLeft != moveLeft || tmoveRight != moveRight || tmoveUp != moveUp)
{
    server_message_send(0, 0, object_index, m_id, x, y, moveLeft, moveRight, moveUp);
}
if (tsz != z_skill || tsx != x_skill || tsc != c_skill || tsv != v_skill)
{
    server_message_send(0, 11, object_index, m_id, x, y, z_skill, x_skill, c_skill, v_skill, sign(image_xscale));
}
