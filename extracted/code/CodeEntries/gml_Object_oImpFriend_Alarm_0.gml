alarm[0] = 15 + random(10);
if (global.time_stop == 0 && alarm[7] == -1)
{
    if ((point_distance(x, y, parent.x, parent.y) > tether_range_max || abs(parent.y - y) > 32) && parent.activity != 30 && parent.free == 0 && activity == 0)
    {
        alarm[0] = 5;
        state = "attack3";
    }
    z_skill = 0;
    if (instance_exists(target) == 0)
    {
        target = instance_nearest_variable(x, y, 321, "team", "enemy");
    }
    switch (state)
    {
        case "idle":
            if (abs(parent.x - x) > tether_range_min)
            {
                if (parent.x < x)
                {
                    moveLeft = 1;
                    moveRight = 0;
                }
                else
                {
                    moveRight = 1;
                    moveLeft = 0;
                }
            }
            else
            {
                moveLeft = 1 * (random(100) < 5);
                moveRight = 1 * (random(100) < 5);
            }
            z_skill = 0;
            x_skill = 0;
            if (instance_exists(target) == 1)
            {
                if (point_distance(target.x, target.y, x, y) < 300 && (target.y - y) < 32)
                {
                    state = "chase";
                }
                else
                {
                    target = -10;
                }
            }
            break;
        case "chase":
            if (instance_exists(target) == 1 && global.time_stop == 0)
            {
                if (point_distance(x, y, target.x, target.y) > 380 || (target.y - ((y - sprite_yoffset) + sprite_height)) > 32)
                {
                    state = "idle";
                }
                if (target.x > x)
                {
                    moveLeft = 0;
                    moveRight = 1;
                    image_xscale = 1;
                }
                else if (target.x < x)
                {
                    moveLeft = 1;
                    moveRight = 0;
                    image_xscale = -1;
                }
                if (abs(target.x - x) < z_range && abs(target.y - y) < 64 && alarm[2] == -1)
                {
                    alarm[0] = 5;
                    state = "attack1";
                    if (abs(target.x - x) < 20)
                    {
                        moveLeft = 0;
                        moveRight = 0;
                    }
                }
                if (abs(target.x - x) < x_range && alarm[3] == -1 && object_get_parent(target.object_index) == 322)
                {
                    alarm[0] = 5;
                    state = "attack2";
                    if (abs(target.x - x) < 20)
                    {
                        moveLeft = 0;
                        moveRight = 0;
                    }
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
        case "attack1":
            if (instance_exists(target) == 1)
            {
                if (abs(target.x - x) < 20)
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
            break;
        case "attack3":
            if (instance_exists(parent) == 1)
            {
                c_skill = 1;
            }
            else
            {
                state = "idle";
            }
            break;
    }
}
