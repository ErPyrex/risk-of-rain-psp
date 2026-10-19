if (!skull)
{
    image_angle += 2;
    image_angle2 -= 2;
    image_alpha = min(1, image_alpha + 0.1);
    image_xscale = max(1, image_xscale - 0.03);
    image_yscale = image_xscale;
}
if (skull)
{
    image_alpha -= 0.1;
    skull_index = min(skull_index + 0.2, 9);
    if (skull_index == 5 && !attacked)
    {
        attacked = 1;
        oHUD.alarm[0] = 6;
        with (oP)
        {
            if (place_meeting(x, y, other.id) && invincible == 0)
            {
                with (other)
                {
                    draw_damage(other.x, other.y - 16, global.handlerDamage, ceil(other.hp - 1), 0, 16777215, 16777215);
                    other.hp = 0.5;
                }
            }
        }
    }
    if (skull_index == 9)
    {
        skull_alpha -= 0.1;
    }
    if (skull_alpha == 0)
    {
        instance_destroy();
    }
}
