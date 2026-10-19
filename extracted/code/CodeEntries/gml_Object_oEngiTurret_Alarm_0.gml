alarm[0] = 15;
switch (state)
{
    case "set up":
        break;
    case "idle":
        if (random(100) < 10)
        {
            state = "head rotate";
        }
        while (1)
        {
            s = collision_line_advanced(x - 300, y, x + 300, y, 321, 0, 0);
            if (s < 0)
            {
                break;
            }
            else if (s.solid == 1)
            {
                break;
            }
            else if (s.team != team)
            {
                target = s;
                state = "chase";
                break;
            }
            else
            {
                instance_deactivate_object(s);
            }
        }
        instance_activate_object(pNPC);
        break;
    case "chase":
        if (instance_exists(target) == 0)
        {
            state = "idle";
            break;
            break;
        }
        if (abs(target.x - x) > 400)
        {
            state = "idle";
            break;
            break;
        }
        if (sign(target.x - x) != image_xscale2)
        {
            state = "head rotate";
            break;
            break;
        }
        if (alarm[1] == -1)
        {
            state = "firing1";
            break;
        }
    case "firing1":
}
image_index2 += image_speed2;
