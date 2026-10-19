if (explosive_shot != 0)
{
    fire_explosion(3, x, y, explosive_shot / 3, 292, 2, 883, 1.5, 1);
    bullet.team += "proc";
    caster_play(76, global.volume, 1);
}
if (lightning != 0 && (oInit.coop != 2 || global.host))
{
    t = instance_create(x, y, oChainLightning);
    t.team = team + "proc";
    t.damage = ceil(damage / 2);
    if (oInit.coop == 2)
    {
        server_message_send(0, 29, 9, t.x, t.y, t.damage, t.team);
    }
}
if (crowbar_hit == 1)
{
    caster_play(64, global.volume, random_range(0.8, 1.1));
}
