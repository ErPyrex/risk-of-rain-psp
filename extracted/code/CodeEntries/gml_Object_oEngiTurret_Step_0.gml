if (hp <= 0)
{
    alarm[2] = 1;
}
if (!instance_exists(parent))
{
    exit;
}
switch (state)
{
    case "set up":
        if ((floor(image_index) + image_speed) >= (sprite_get_number(sprite_index) - 1))
        {
            image_speed = 0;
            sprite_index = sprite_base;
            state = "idle";
            head_active = 1;
        }
        break;
    case "idle":
        if (random(100) < 0.3)
        {
            state = "head rotate";
        }
        break;
    case "firing1":
        if (sprite_index2 != sprite_shoot1)
        {
            image_index2 = 0;
            image_speed2 = 0.25 * parent.attack_speed;
            sprite_index2 = sprite_shoot1;
        }
        if (floor(image_index2) == 0 && alarm[1] == -1)
        {
            alarm[1] = 7 / parent.attack_speed;
            with (parent)
            {
                caster_play(38, global.volume, 1.5);
                fire_bullet(2, other.x, other.y + 4, 0, 1 + ((scepter - 1) * 0.2), 700, 292, 90 - (90 * other.image_xscale2), 1, 1, -1);
                bullet.team = "playerproc";
                bullet.climb = -(other.bullets * 8) + 24;
            }
        }
        if ((floor(image_index2) + image_speed2) >= (sprite_get_number(sprite_index2) - 1))
        {
            image_speed2 = 0;
            image_index2 = 0;
            sprite_index2 = sprite_rotate;
            state = "chase";
            alarm[0] = 1;
        }
        break;
    case "head rotate":
        if (head_rotate == 0)
        {
            head_rotate = 1;
            image_speed2 = 0.28;
            image_index2 = 0;
            if (inside_view(x, y) == 1)
            {
                caster_play(99, global.volume, 1.5);
            }
        }
        if (head_rotate == 1)
        {
            if ((image_index2 + image_speed2) >= (sprite_get_number(sprite_index2) - 1))
            {
                state = "idle";
                head_rotate = 0;
                image_xscale2 = -image_xscale2;
                image_index2 = 0;
                image_speed2 = 0;
            }
        }
        break;
}
image_index2 += image_speed2;
