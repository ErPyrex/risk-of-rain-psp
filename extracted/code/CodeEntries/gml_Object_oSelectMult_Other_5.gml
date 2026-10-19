if (global.host)
{
    d_ini_open("Prefs.ini");
    d_ini_write_real("Gameplay", "diff_level", global.diff_level);
    d_ini_write_real("Online", "fair_loot", global.fair_loot);
    for (i = 0; i <= global.artifact_number; i += 1)
    {
        d_ini_write_real("Gameplay", "artifact_active" + string(i), oInit.artifact_active[i]);
    }
    d_ini_close();
}
