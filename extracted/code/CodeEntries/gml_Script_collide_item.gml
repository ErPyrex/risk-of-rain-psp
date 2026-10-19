if (oInit.coop == 2)
{
    server_message_send(0, 25, object_index, m_id, other.m_id, 0);
}
force_pickup = -5;
other.item_count += 1;
owner = other.id;
var tcount = 0;
var done = 0;
for (i = 0; i <= other.item_count; i += 1)
{
    if (other.item[i, 0] == sprite_index)
    {
        if (!done)
        {
            other.item_count -= 1;
            other.item[i, 1] += 1;
            tcount += other.item[i, 1];
            if (oInit.coop == 2 && global.host)
            {
                add_chat_system(1, other.user_name + " has picked up &" + tier + "&" + text1 + " (" + string(other.item[i, 1]) + ")&!&.");
            }
            done = 1;
        }
    }
    else if (i == other.item_count)
    {
        if (!done)
        {
            other.item[other.item_count, 0] = sprite_index;
            other.item[other.item_count, 1] = 1;
            other.item[other.item_count, 2] = text2;
            tcount++;
            if (oInit.coop == 2 && global.host)
            {
                add_chat_system(1, other.user_name + " has picked up &" + tier + "&" + text1 + "&!&.");
            }
            done = 1;
        }
    }
    else
    {
        tcount++;
    }
}
if (tcount >= 30)
{
    achievement_progress(52, 1);
}
if (oInit.coop == 2)
{
    switch (tier)
    {
        case "w":
            other.item_value += 1;
            break;
        case "g":
            other.item_value += 2;
            break;
        case "r":
            other.item_value += 4;
            break;
    }
}
