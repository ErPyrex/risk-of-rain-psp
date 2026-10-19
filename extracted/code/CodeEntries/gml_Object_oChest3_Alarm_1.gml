if (oInit.coop == 2 && !global.host)
{
    exit;
}
if (spawns != 0)
{
    for (t = 0; t <= 1; t += 1)
    {
        s = instance_create(x, y, oChest3);
        s.spawns = 0;
        spawn[t] = s.id;
        with (s)
        {
            for (d = -1; d <= 1; d += 1)
            {
                for (i = 1; i <= 6; i += 1)
                {
                    if (place_meeting(x + (i * 16), y + (d * 16), pBlock) == 0 && place_meeting(x + (i * 16), y + 8 + (d * 16), pBlock) == 1 && place_meeting(x + (i * 16), y + (d * 16), pMapObjects) == 0)
                    {
                        x += (i * 16);
                        y += (d * 16);
                        d = 5;
                        break;
                    }
                    else if (place_meeting(x + (-i * 16), y + (d * 16), pBlock) == 0 && place_meeting(x + (-i * 16), y + 8 + (d * 16), pBlock) == 1 && place_meeting(x + (-i * 16), y + (d * 16), pMapObjects) == 0)
                    {
                        x += (-i * 16);
                        y += (d * 16);
                        d = 5;
                        break;
                    }
                }
            }
            if (oInit.coop == 2)
            {
                m_id = global.chest_index;
                global.chest_index += 1;
                server_message_send(0, 12, object_index, m_id, x, y);
            }
        }
    }
}
for (t = 0; t <= 1; t += 1)
{
    spawn[t].spawn[0] = id;
    spawn[t].spawn[1] = spawn[!t];
}
if (oInit.coop == 2 && !global.host)
{
    exit;
}
if (random(100) < 20)
{
    item_id = -5;
    sprite_id = 732;
}
else
{
    if (random(100) < 25 && !global.artifact_use)
    {
        while (1)
        {
            item_id = irandom(oDirectorControl.use_count);
            if (oDirectorControl.item_use[item_id, 1] == 1)
            {
                item_id = oDirectorControl.item_use[item_id, 0];
                break;
            }
        }
    }
    else
    {
        while (1)
        {
            item_id = irandom(oDirectorControl.tier1_count);
            if (oDirectorControl.item_tier1[item_id, 1] == 1)
            {
                item_id = oDirectorControl.item_tier1[item_id, 0];
                break;
            }
        }
    }
    sprite_id = object_get_sprite(item_id);
}
if (oInit.coop == 2)
{
    server_message_send(0, 21, object_index, m_id, sprite_id);
}
