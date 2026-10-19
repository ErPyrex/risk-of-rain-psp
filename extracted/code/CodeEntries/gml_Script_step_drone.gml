if (!instance_exists(master))
{
    hp = 0;
    instance_destroy();
    exit;
}
missile = master.armsrace * 0.5;
mortar = master.armsrace;
damage = master.damage * 0.5;
yo = sin(ff) / 2;
ff += 0.1;
hp = min(maxhp, hp + (maxhp * 0.0002));
invincible = master.invincible;
if (hp <= (maxhp * 0.75) && random(100) < (5 * (hp / maxhp)) && global.graphics >= 2)
{
    part_particles_create(global.above, x, y, global.pSpark, 1);
}
if (hp <= (maxhp * 0.3) && global.graphics == 3)
{
    part_particles_create(global.below, (x - 2) + random(4), (y - 2) + random(4), global.pSmoke2, 1);
}
if (instance_exists(target))
{
    if (point_distance(x, y, target.x, target.y) < x_range && abs(master.y - target.y) < y_range && master.activity != 30)
    {
        state = "chase";
    }
    else
    {
        state = "idle";
    }
    if (point_distance(x, y, target.x, target.y) > (x_range + 30) || abs(y - target.y) > (y_range + 20))
    {
        target = -5;
    }
}
else
{
    state = "idle";
}
if (state == "idle")
{
    if (hp <= (maxhp * 0.5))
    {
        sprite_index = sprite_idle_broken;
    }
    else
    {
        sprite_index = sprite_idle;
    }
    image_xscale = master.image_xscale;
    x = (master.x + xx + (11 * x)) / 12;
    y = (((master.y - 20) + yy + (11 * y)) / 12) + yo;
    if (instance_exists(target) == 0)
    {
        with (pNPC)
        {
            if (point_distance(x, y, other.x, other.y) < 150 && team == "enemy")
            {
                other.target = id;
            }
        }
    }
}
if (((hp <= 0 || master.dead == 1) && (oInit.coop != 2 || global.host)) || force_death)
{
    if (global.host)
    {
        server_message_send(0, 9, object_index, m_id);
    }
    hp = 0;
    instance_destroy();
}
