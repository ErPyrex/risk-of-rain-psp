var v = argument0;
var tv = abs(argument0);
if (v == 0)
{
    exit;
}
var xoffset1 = round((sprite_get_bbox_left(mask_index) - sprite_get_xoffset(mask_index)) * abs(image_xscale));
var xoffset2 = round((sprite_get_bbox_right(mask_index) - sprite_get_xoffset(mask_index)) * abs(image_xscale));
var yoffset1 = round((sprite_get_bbox_top(mask_index) - sprite_get_yoffset(mask_index)) * abs(image_yscale));
var yoffset2 = round((sprite_get_bbox_bottom(mask_index) - sprite_get_yoffset(mask_index)) * abs(image_yscale));
repeat (ceil(abs(argument0)))
{
    tv = min(1, abs(argument0));
    var ttv = tv * sign(argument0);
    if (get_collision_rec(round(x + xoffset1), round(y + yoffset1 + ttv), round(x + xoffset2), round(y + yoffset2 + ttv)))
    {
        if (sign(argument0) > 0)
        {
            y = (round((y + yoffset2) / 16) * 16) - yoffset2 - 1;
        }
        else
        {
            y = ((round((y + yoffset1) / 16) * 16) - yoffset1) + 1;
        }
        if (sign(argument0) > 0)
        {
            jump_count = 0;
        }
        pVspeed = 0;
        break;
    }
    else
    {
        y += ttv;
        argument0 -= ttv;
    }
}
