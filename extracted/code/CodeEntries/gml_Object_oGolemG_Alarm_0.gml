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
alarm[0] = 45 + random(45);
switch (state)
{
    case "chase":
        if (instance_exists(target) == 1)
        {
            if (target.x > x)
            {
                moveLeft = 0;
                moveRight = 1;
                image_xscale = 1;
            }
            if (target.x < x)
            {
                moveLeft = 1;
                moveRight = 0;
                image_xscale = -1;
            }
            if (abs(target.x - x) < z_range && abs(target.y - y) < 64 && alarm[2] == -1)
            {
                alarm[0] = 5;
                state = "attack1";
                if (abs(target.x - x) < 100)
                {
                    moveLeft = 0;
                    moveRight = 0;
                }
            }
            if (abs(target.x - x) < x_range && abs(target.y - y) < 200 && alarm[3] == -1)
            {
                alarm[0] = 5;
                state = "attack2";
                if (abs(target.x - x) < 100)
                {
                    moveLeft = 0;
                    moveRight = 0;
                }
            }
        }
        else
        {
            target = instance_nearest(x, y, oPOI);
        }
        break;
    case "attack1":
        z_skill = 1;
        if (alarm[2] != -1 && sprite_index != sprite_shoot1)
        {
            state = "chase";
        }
        break;
    case "attack2":
        x_skill = 1;
        if (alarm[3] != -1 && sprite_index != sprite_shoot2)
        {
            state = "chase";
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
