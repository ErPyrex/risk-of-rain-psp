step_drone();
if (instance_exists(master))
{
    if (state == "chase")
    {
        if (instance_exists(target))
        {
            x = (master.x + xx + x) / 2;
            y = (((master.y - 20) + yy + (11 * y)) / 12) + yo;
            image_xscale = sign(target.x - x);
            if (image_xscale == 0)
            {
                image_xscale = 1;
            }
            if (alarm[1] == -1)
            {
                bullets -= 1;
                s = instance_create(x, y, oEfMissileSmall);
                s.parent = id;
                s.damage = damage * 2;
                s.team = team + "proc";
                s.direction = (90 - (90 * image_xscale) - 10) + random(20);
                sprite_index = sprite_shoot1;
                image_index = 0;
                if (bullets != 0)
                {
                    alarm[1] = 10;
                }
                else
                {
                    alarm[1] = 180;
                    bullets = 4 + mortar;
                }
            }
        }
    }
}
else
{
    hp = 0;
}
