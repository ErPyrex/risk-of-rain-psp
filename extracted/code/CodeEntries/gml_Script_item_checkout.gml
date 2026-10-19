if (argument0.dead == 1)
{
    return 0;
}
if (oInit.coop != 2)
{
    return 1;
}
if (oInit.coop == 2 && !global.host)
{
    if (force_pickup == argument0.m_id)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}
else if (oInit.coop == 2)
{
    if ((icount <= 0 || item_dibs == argument0) && (argument0.item_value <= (global.director.average_item_value + ceil(global.director.average_item_value * 0.2)) || tier == "or" || !global.fair_loot))
    {
        return 1;
    }
    else
    {
        return 0;
    }
}
