var retx = x;
var rety = y;
for (i = 0; i < 10; i += 1)
{
    var tff = collision_circle(argument1, argument2, 5 + (i * 16), oBNoSpawn3, 0, 0);
    if (tff > 0)
    {
        rety = (tff.y + argument0.sprite_yoffset) - argument0.sprite_height;
        if (argument1 > (tff.x + (tff.width_box * 16)))
        {
            retx = (tff.x + (tff.width_box * 16)) - (argument0.sprite_width / 2);
            break;
        }
        else if (argument1 < (tff.x + abs(argument0.sprite_width / 2)))
        {
            retx = tff.x + abs(argument0.sprite_width / 2);
            break;
        }
        else
        {
            retx = argument1;
            break;
        }
    }
}
argument0.x = retx;
argument0.y = rety;
