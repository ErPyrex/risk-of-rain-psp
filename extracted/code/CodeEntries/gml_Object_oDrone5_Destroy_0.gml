if (hp <= 0)
{
    caster_play(72, global.volume, 1);
    part_particles_create(global.above, x, y, global.pSpark, 6);
    oHUD.alarm[0] = 10;
    with (instance_create(x, y, oEfBullet2))
    {
        sprite_index = sDroneDeath;
        image_yscale = 1;
    }
    if (not_client())
    {
        with (instance_create(x, y, oDrone5Item))
        {
            teleport_nearby(id, x, y);
            cost = ceil(other.value * 1.6 * global.enemy_buff);
            if (oInit.coop == 2 && global.host)
            {
                m_id = global.chest_index;
                global.chest_index += 1;
                server_message_send(0, 12, object_index, m_id, x, y);
                server_message_send(0, 32, object_index, m_id, cost);
            }
        }
    }
}
