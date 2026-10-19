if (instance_exists(argument0))
{
    var retx = x;
    var rety = y;
    var ttele = argument0;
    var tff = -10;
    for (i = 0; i < 10; i += 1)
    {
        tff = collision_circle(argument1, argument2, 5 + (i * 16), oB, 0, 0);
        if (instance_exists(tff))
        {
            rety = (tff.y + sprite_get_yoffset(ttele.sprite_index)) - sprite_get_height(ttele.sprite_index);
            if (argument1 > (tff.x + (tff.width_box * 16)))
            {
                retx = (tff.x + (tff.width_box * 16)) - (ttele.sprite_width / 2);
                break;
            }
            else if (argument1 < (tff.x + abs(ttele.sprite_width / 2)))
            {
                retx = tff.x + abs(ttele.sprite_width / 2);
                break;
            }
            else
            {
                retx = argument1;
                break;
            }
        }
    }
    ttele.x = retx;
    ttele.y = rety;
}
