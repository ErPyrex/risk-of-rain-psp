offset = 0;
var xoffset1 = round((sprite_get_bbox_left(mask_index) - sprite_get_xoffset(mask_index)) * abs(image_xscale));
var xoffset2 = round((sprite_get_bbox_right(mask_index) - sprite_get_xoffset(mask_index)) * abs(image_xscale));
var yoffset1 = round((sprite_get_bbox_top(mask_index) - sprite_get_yoffset(mask_index)) * abs(image_yscale));
var yoffset2 = round((sprite_get_bbox_bottom(mask_index) - sprite_get_yoffset(mask_index)) * abs(image_yscale));
repeat (ceil(abs(argument0)))
{
    th = min(1, abs(argument0));
    var tth = th * sign(argument0);
    if (get_collision_rec(round(x + xoffset1 + tth) + sign(argument0), round(y + yoffset1), round(x + xoffset2 + tth) + sign(argument0), round(y + yoffset2)))
    {
        pHspeed = 0;
        break;
    }
    else
    {
        x += tth;
        argument0 -= tth;
    }
}
