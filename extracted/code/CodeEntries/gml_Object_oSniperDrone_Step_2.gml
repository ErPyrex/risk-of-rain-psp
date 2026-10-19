if (instance_exists(master))
{
    damage = master.damage;
    if (!instance_exists(master))
    {
        instance_destroy();
        exit;
    }
    yo = sin(ff) / 5;
    ff += 0.05;
    if (!instance_exists(tt))
    {
        if (sprite_index != sprite_turn)
        {
            sprite_index = sprite_idle;
        }
        if (firing)
        {
            y = (master.y + 20 + yy + (11 * y)) / 12;
            x = (master.x + (xx * master.image_xscale) + (20 * x)) / 21;
            if (!instance_exists(target))
            {
                if (image_xscale != master.image_xscale && turning == 0)
                {
                    turning = 1;
                    image_index = 0;
                    sprite_index = sprite_turn;
                    image_speed = 0.4;
                }
            }
            else if (abs(target.y - y) < 32 && abs(target.x - x) < 150)
            {
                if (image_xscale != sign(target.x - x) && turning == 0)
                {
                    turning = 1;
                    image_index = 0;
                    sprite_index = sprite_turn;
                    image_speed = 0.2;
                }
                if (alarm[2] == -1 && turning == 0)
                {
                    sprite_index = sSniperDroneShoot1;
                    image_speed = 0.3;
                    image_index = 0;
                    if (bullets > 0)
                    {
                        alarm[2] = 5;
                        bullets -= 1;
                    }
                    else
                    {
                        bullets += 30;
                        alarm[2] = 60;
                    }
                    if (inside_view(x, y))
                    {
                        caster_play(38, global.volume, random_range(1.5, 1.7));
                    }
                    fire_bullet(2, x, y, 0, 0.3, 700, 292, 90 - (90 * image_xscale), 1, 1, -1);
                    bullet.team = "playerproc";
                    bullet.knockback = random(100) < 10;
                }
            }
            else
            {
                target = -10;
            }
            target = instance_nearest_variable(x, y, 321, "team", "enemy");
        }
        else
        {
            y = (((master.y - 20) + yy + (11 * y)) / 12) + yo;
            x = (master.x + (xx * master.image_xscale) + (20 * x)) / 21;
            if (image_xscale != master.image_xscale && turning == 0)
            {
                turning = 1;
                image_index = 0;
                sprite_index = sprite_turn;
                image_speed = 0.2;
            }
        }
    }
    else
    {
        if (sprite_index != sprite_turn)
        {
            sprite_index = sSniperDroneZap;
        }
        image_speed = 0.3;
        x = (tt.x + -25 + (20 * x)) / 21;
        y = (((tt.y - 35) + (11 * y)) / 12) + yo;
        if (image_xscale != sign(tt.x - x) && turning == 0)
        {
            turning = 1;
            image_index = 0;
            sprite_index = sprite_turn;
            image_speed = 0.2;
        }
    }
}
