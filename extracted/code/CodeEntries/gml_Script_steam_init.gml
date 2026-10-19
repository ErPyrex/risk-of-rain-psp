if (!global.steam_version)
{
    return 0;
}
if (global.steam_version && !steam_initialised())
{
    show_debug_message("No Steam");
    return 0;
}
return 1;
