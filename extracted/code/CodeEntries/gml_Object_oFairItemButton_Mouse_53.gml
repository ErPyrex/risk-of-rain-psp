if (hover)
{
    global.fair_loot = !global.fair_loot;
    server_message_send(0, 39, 0, 0, global.diff_level, global.fair_loot, oInit.artifact_active[0], oInit.artifact_active[1], oInit.artifact_active[2], oInit.artifact_active[3], oInit.artifact_active[4], oInit.artifact_active[5], oInit.artifact_active[6], oInit.artifact_active[7], oInit.artifact_active[8], oInit.artifact_active[9]);
}
