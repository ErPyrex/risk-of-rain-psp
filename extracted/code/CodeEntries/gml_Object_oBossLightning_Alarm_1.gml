alarm[1] = 20;
if (oInit.coop != 2 || global.host)
{
    with (oBNoSpawn3)
    {
        if (random(100) < 30)
        {
            var t = instance_create(x + random_range(0, width_box * 16), y, oBossSkill2);
            t.damage = other.damage;
            server_message_send(0, 29, 14, t.x, t.y);
        }
    }
}
