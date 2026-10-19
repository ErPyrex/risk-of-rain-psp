if (oInit.coop == 2 && !global.host)
{
    exit;
}
item_id_previous = item_id;
caster_play(54, global.volume, 0.5);
while (1)
{
    if (random(100) < 10)
    {
        item_id = irandom(oDirectorControl.tier3_count);
        if (oDirectorControl.item_tier3[item_id, 1] == 1 && oDirectorControl.item_tier3[item_id, 0] != item_id_previous)
        {
            item_id = oDirectorControl.item_tier3[item_id, 0];
            break;
        }
    }
    else if (random(100) < 70)
    {
        item_id = irandom(oDirectorControl.tier2_count);
        if (oDirectorControl.item_tier2[item_id, 1] == 1 && oDirectorControl.item_tier2[item_id, 0] != item_id_previous)
        {
            item_id = oDirectorControl.item_tier2[item_id, 0];
            break;
        }
    }
    else
    {
        item_id = irandom(oDirectorControl.tier1_count);
        if (oDirectorControl.item_tier1[item_id, 1] == 1 && oDirectorControl.item_tier1[item_id, 0] != item_id_previous)
        {
            item_id = oDirectorControl.item_tier1[item_id, 0];
            break;
        }
    }
}
sprite_id = object_get_sprite(item_id);
server_message_send(0, 36, object_index, m_id, item_id);
