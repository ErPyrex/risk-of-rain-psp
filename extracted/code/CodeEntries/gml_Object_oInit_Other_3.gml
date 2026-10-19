d_ini_open("Save.ini");
for (i = 0; i <= achievement_number; i += 1)
{
    if (oInit.achievement[i, 0] == 1)
    {
        oInit.achievement[i, 0] = 2;
        d_ini_write_real("Achievement", "achievement" + string(i), 2);
        oInit.achievement_number_unlocked += 1;
        d_ini_write_real("Record", "achievement_number_unlocked", oInit.achievement_number_unlocked);
    }
    if (oInit.achievement[i, 5] == 1)
    {
        oInit.achievement[i, 1] = 0;
    }
    else
    {
        d_ini_write_real("Achievement", "achievement_progress" + string(i), oInit.achievement[i, 1]);
    }
}
for (i = 0; i <= global.item_number; i += 1)
{
    if (oInit.item_found_temp[i] != 0)
    {
        if (oInit.item_found[i] == 0)
        {
            oInit.new_item_found += 1;
            oInit.item_number_unlocked += 1;
            oInit.item_found[i] = 1;
            d_ini_write_real("Record", "item" + string(i), 1);
            d_ini_write_real("Record", "item_number_unlocked", oInit.item_number_unlocked);
        }
        else
        {
            oInit.item_found_temp[i] = 0;
        }
    }
}
for (i = 0; i <= global.mons_number; i += 1)
{
    if (oInit.mons_found_temp[i] != 0)
    {
        if (oInit.mons_found[i] == 0)
        {
            oInit.new_mons_found += 1;
            oInit.mons_number_unlocked += 1;
            oInit.mons_found[i] = 1;
            d_ini_write_real("Record", "mons" + string(i), 1);
            d_ini_write_real("Record", "mons_number_unlocked", oInit.mons_number_unlocked);
        }
        else
        {
            oInit.mons_found_temp[i] = 0;
        }
    }
}
d_ini_close();
steam_free();
