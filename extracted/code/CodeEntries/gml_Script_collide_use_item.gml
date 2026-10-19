if (alarm[0] == -1 && used == 0 && item_checkout(other.id))
{
    if (other.use[0] == -1)
    {
        if (oInit.coop == 2)
        {
            server_message_send(0, 25, object_index, m_id, other.m_id, 0);
        }
        used = 1;
        other.use[0] = object_index;
        if (other.use[0] == 421)
        {
            other.dynamite_on_hit = 1;
        }
        other.use[1] = sprite_index;
        other.use[2] = text2;
        owner = other.id;
        if (oInit.coop == 2 && global.host)
        {
            add_chat_system(1, other.user_name + " has picked up &or&" + text1 + "&!&.");
        }
    }
}
if ((other.use[0] != -1 && alarm[0] == -1 && used == 0 && other.swap_item == 0) || force_pickup == other.m_id || other.force_swap)
{
    other.swap_item = 1;
    item_switch = 1;
}
with (other)
{
    if (control(global.swap_key, 13, 1) == 1 && oInit.coop == 2 && other.used == 0)
    {
        show_debug_message("swap key pressed");
        client_message_send(28);
    }
}
if (item_switch == 1 && item_checkout(other.id))
{
    with (other.id)
    {
        if (control(global.swap_key, 13, 1) == 1 || (force_swap == 1 && other.used == 0))
        {
            with (other.id)
            {
                show_debug_message("force swap client");
                if (oInit.coop == 2)
                {
                    server_message_send(0, 25, object_index, m_id, other.m_id, 1);
                }
                if (ds_map_exists(oInit.use_list, other.use[0]) == 1)
                {
                    ds_map_replace(oInit.use_list, other.use[0], ds_map_find_value(oInit.use_list, other.use[0]) + other.use_item_held);
                }
                else
                {
                    ds_map_add(oInit.use_list, other.use[0], other.use_item_held);
                }
                other.use_item_held = 0;
                item_switch = 2;
                if (oInit.coop != 2 || global.host)
                {
                    instance_create(x, y - 16, other.use[0]);
                }
                used = 1;
                if (other.use[0] == 421)
                {
                    other.dynamite_on_hit = 0;
                }
                other.use[0] = object_index;
                if (other.use[0] == 421 && other.alarm[0] == -1)
                {
                    other.dynamite_on_hit = 1;
                }
                other.use[1] = sprite_index;
                other.use[2] = text2;
                owner = other.id;
                force_pickup = -5;
                other.force_swap = 0;
                if (oInit.coop == 2 && global.host)
                {
                    add_chat_system(1, other.user_name + " has picked up &or&" + text1 + "&!&.");
                }
            }
        }
    }
}
