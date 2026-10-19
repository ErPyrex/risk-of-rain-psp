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
z_skill = 0;
target = instance_nearest(x, y, oPOI);
if (target != last_target && (oInit.coop == 2 && global.host) && instance_exists(target))
{
    server_message_send(0, 10, object_index, m_id, x, y, target.parent.m_id, direction, 0);
}
last_target = target;
switch (state)
{
    case "idle":
        moveLeft = choose(1, 0);
        moveRight = choose(1, 0);
        z_skill = 0;
        x_skill = 0;
        if (instance_exists(target) == 1)
        {
            state = "chase";
        }
        break;
    case "chase":
        if (instance_exists(target) == 1)
        {
            var tabsx = abs(target.x - x);
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
            if (tabsx < 40)
            {
                moveLeft = 0;
                moveRight = 0;
            }
            if (tabsx < z_range && alarm[2] == -1)
            {
                alarm[0] = 5;
                state = "attack1";
            }
            if (tabsx < x_range && alarm[3] == -1 && z_count >= 3)
            {
                alarm[0] = 5;
                state = "attack2";
            }
            if (tabsx < c_range && alarm[4] == -1 && x_count >= 3)
            {
                alarm[0] = 5;
                state = "attack3";
            }
        }
        else
        {
            state = "idle";
        }
        if (target == -1)
        {
            state = "idle";
        }
        if (place_meeting(x + (3 * image_xscale), y, pBlock) == 1 && place_meeting(x + (3 * image_xscale), y - 20, pBlock) == 0 && can_jump == 1)
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
        z_skill = 1;
        if (instance_exists(target))
        {
            if (abs(target.y - y) > 50 || abs(target.x - x) > 70)
            {
                z_skill = 2;
            }
        }
        break;
    case "attack2":
        x_skill = 1;
        break;
    case "attack3":
        c_skill = 1;
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
    server_message_send(0, 11, object_index, m_id, x, y, z_skill, x_skill, c_skill, v_skill, image_xscale);
}
