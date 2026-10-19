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
            if (abs(y - target.y) < 24 && alarm[1] == -1)
            {
                oHUD.alarm[0] = 1;
                with (instance_create(x + (image_xscale * 10), y + 4, oEfBullet2))
                {
                    sprite_index = sPyroFire;
                    image_speed = 0.3;
                    image_xscale = other.image_xscale;
                }
                fire_bullet(0, x, y, 1, 1, 75 + random(10), 528, 90 - (90 * image_xscale), 1, 1, -1);
                alarm[1] = 11;
                caster_play(167, global.volume * 0.5, 2.5);
                sprite_index = sprite_shoot1;
                image_index = 0;
            }
        }
    }
    if (hp <= 0 || master.dead == 1)
    {
        instance_destroy();
    }
}
else
{
    hp = 0;
}
