d_ini_open("Prefs.ini");
d_ini_write_real("Gameplay", "diff_level", global.diff_level);
d_ini_write_real("Gameplay", "class", choice + 1);
for (i = 0; i <= global.artifact_number; i += 1)
{
    d_ini_write_real("Gameplay", "artifact_active" + string(i), oInit.artifact_active[i]);
}
d_ini_close();
oInit.class = choice + 1;
