alarm[1] = 20;
if (oInit.coop != 2 || global.host)
{
    with (pNPC)
    {
        if (random(100) < 10)
        {
            var t = instance_create((x - 10) + random(20), y, oEfSmite);
            server_message_send(0, 29, 14, t.x, t.y);
        }
    }
}
