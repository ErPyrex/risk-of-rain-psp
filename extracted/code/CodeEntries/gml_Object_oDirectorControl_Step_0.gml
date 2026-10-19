if (instance_exists(oP))
{
    if (((oP.dead == 0 && oInit.coop == 0) || ((oInit.coop == 1 && oInit.player_number != 0) && alarm[11] == -1)) && oInit.skip == 1)
    {
    }
    if (global.fair_loot && oInit.coop == 2)
    {
        var tplayer_number = 0;
        average_item_value = 0;
        with (oP)
        {
            if (dead == 0)
            {
                other.average_item_value += item_value;
                tplayer_number += 1;
            }
        }
        if (tplayer_number != 0)
        {
            average_item_value /= tplayer_number;
        }
    }
}
