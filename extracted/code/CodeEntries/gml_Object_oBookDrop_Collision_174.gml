if (alarm[0] == -1 && used == 0)
{
    used = 1;
    oInit.mons_found_temp[unlock_id] = 1;
    oInit.new_mons_found += 1;
    if (oInit.achievement[20, 1] != 14)
    {
        achievement_progress(20, 1);
    }
    else
    {
        with (instance_create(x, y, oPodBehind))
        {
            sprite_index = sHuntressPod;
            achievement_id = 20;
        }
    }
    if (oInit.coop == 2)
    {
        add_chat_system(1, other.user_name + " has picked up &p&" + text1 + "&!&.");
    }
}
