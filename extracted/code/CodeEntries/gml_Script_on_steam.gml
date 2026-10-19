if (!global.steam_version)
{
    return 0;
}
if (global.steam_version && !steam_initialised())
{
    return 0;
}
return 1;
