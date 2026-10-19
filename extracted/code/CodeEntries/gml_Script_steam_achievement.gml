if (global.steam_version == 1 && argument0 != "")
{
    if (!steam_get_achievement(argument0))
    {
        steam_set_achievement(argument0);
    }
}
