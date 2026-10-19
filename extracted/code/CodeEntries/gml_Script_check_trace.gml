while (1)
{
    s = collision_line_advanced(x, y, x + lengthdir_x(argument0, argument1), y + lengthdir_y(argument0, argument1), 21, 0, 0);
    if (s < 0)
    {
        success = 0;
        break;
    }
    else if (s.solid == 1)
    {
        success = 0;
        break;
    }
    else if (s.team != team)
    {
        success = 1;
        break;
    }
    else
    {
        instance_deactivate_object(s);
    }
}
instance_activate_object(pNPC);
return success;
