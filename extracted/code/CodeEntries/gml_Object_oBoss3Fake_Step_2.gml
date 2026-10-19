f += 0.05;
yy = cos(f) * 2;
if (flying == 1)
{
    sprite_index = oBoss3Teleport;
    if (floor(image_index) == 2)
    {
        instance_create(x, y, oWhiteFlash);
        with (instance_create(4768, 1280, oBoss3))
        {
            activity = 1.2;
            image_index = 5;
        }
        if (oInit.coop != 2 || global.host)
        {
            for (i = -32; i <= 32; i += 64)
            {
                s = instance_create(4768 + i, 1296, oSpawn);
                s.sprite_index = sGuardSpawn;
                s.child = 294;
                s.sound_spawn = 89;
                s.y = (s.y + s.sprite_yoffset) - s.sprite_height;
                s.elite = 0;
                s.elite_tier = -1;
                server_message_send(0, 23, s.object_index, s.m_id, s.x, s.y, s.sprite_index, s.child, s.sound_spawn, s.elite, s.elite_tier, s.point_value, s.image_xscale, s.image_blend);
            }
        }
        instance_destroy();
    }
}
