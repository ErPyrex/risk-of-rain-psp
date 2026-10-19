var t = drop_item(0);
part_particles_create_color(global.below, x, y, global.pHeal, 65535, 20);
oP.opened_chests += 1;
if (t == 0)
{
    charges -= 1;
    oInit.achievement[5, 1] = 0;
    with (oP)
    {
        if (dice != 0)
        {
            apply_buff(id, 11, 2);
        }
    }
    achievement_progress(45, 1);
    oInit.win_shrine += 1;
    oInit.loss_shrine = 0;
    oInit.win_shrine_max = max(oInit.win_shrine, oInit.win_shrine_max);
    oInit.loss_shrine_max = max(oInit.loss_shrine, oInit.loss_shrine_max);
}
else
{
    oInit.achievements[45, 1] = 0;
    with (oP)
    {
        if (dice != 0)
        {
            apply_buff(id, 11, 72000);
        }
    }
    achievement_progress(5, 1);
    oInit.win_shrine = 0;
    oInit.loss_shrine += 1;
    oInit.win_shrine_max = max(oInit.win_shrine, oInit.win_shrine_max);
    oInit.loss_shrine_max = max(oInit.loss_shrine, oInit.loss_shrine_max);
}
if (oInit.coop == 2)
{
    server_message_send(0, 30, object_index, m_id, t);
}
