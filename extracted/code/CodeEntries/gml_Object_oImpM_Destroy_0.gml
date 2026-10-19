parent.minions_dead += 1;
if (parent.minions_dead == (2 + (oInit.player_number * 3)) && parent.time != 0)
{
    if (instance_exists(oPOI))
    {
        with (instance_nearest(x, y, oPOI))
        {
            drop_item(1);
        }
    }
}
