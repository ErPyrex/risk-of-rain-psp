step_drone();
if (instance_exists(master))
{
    if (state == "chase")
    {
        if (instance_exists(target))
        {
            x = (master.x + xx + x) / 2;
            y = (((11 * y) + target.y) / 12) + yo;
            image_xscale = sign(target.x - x);
            if (image_xscale == 0)
            {
                image_xscale = 1;
            }
            if (abs(y - target.y) < 10 && alarm[1] == -1)
            {
                caster_play(38, global.volume, 1);
                alarm[1] = 10;
                fire_bullet(0, x, y, 0, 0.5, 700, 292, 90 - (90 * image_xscale), 1, 1, -1);
                fire_bullet(0, x, y, 0, 0.5, 700, 292, 90 - (90 * image_xscale), 1, 1, -1);
                bullet.climb = 8;
                sprite_index = sprite_shoot1;
                image_index = 0;
            }
        }
    }
}
else
{
    hp = 0;
}
