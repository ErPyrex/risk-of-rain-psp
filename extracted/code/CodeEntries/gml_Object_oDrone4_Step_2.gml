if (!instance_exists(master))
{
    instance_destroy();
    exit;
}
invincible = master.invincible;
yo = sin(ff) / 2;
ff += 0.1;
hp = min(maxhp, hp + hp_regen);
if (hp <= (maxhp * 0.75) && random(100) < (5 * (hp / maxhp)) && global.graphics >= 2)
{
    part_particles_create(global.above, x, y, global.pSpark, 1);
}
if (hp <= (maxhp * 0.3) && global.graphics == 3)
{
    part_particles_create(global.below, (x - 2) + random(4), (y - 2) + random(4), global.pSmoke2, 1);
}
if (sprite_index == sprite_idle || sprite_index == sprite_idle_broken)
{
    image_xscale = master.image_xscale;
}
else
{
    image_xscale = sign(master.x - x);
}
x = (master.x + xx + (11 * x)) / 12;
y = (((master.y - 20) + yy + (11 * y)) / 12) + yo;
if (((hp <= 0 || master.dead == 1 || !instance_exists(master)) && 54) || force_death)
{
    if (hosting())
    {
        server_message_send(0, 9, object_index, m_id);
    }
    instance_destroy();
}
