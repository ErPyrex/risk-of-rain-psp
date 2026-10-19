speed = 0;
if (dead == 0)
{
    vsspeed += p_gravity;
    x = round(x);
    y = round(y);
    if (get_collision(x, y + (sprite_height / 2)) > 0)
    {
        if (target == -5)
        {
            target = instance_nearest_var_yoyo(x, y, 167, "dead", 0);
            with (oEfGold)
            {
                target = other.target;
            }
        }
        vsspeed = 0;
        hsspeed = 0;
        dead = 1;
        alarm[1] = 120;
    }
}
x += hsspeed;
y += vsspeed;
