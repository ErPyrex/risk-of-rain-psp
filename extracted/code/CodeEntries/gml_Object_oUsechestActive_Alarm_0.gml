if (oInit.coop != 2 || global.host)
{
    ds_list_shuffle(oDirectorControl.use_list);
    var tuse;
    if (!global.artifact_use)
    {
        tuse = ds_list_find_value(oDirectorControl.use_list, 0);
    }
    else
    {
        tuse = 457;
    }
    instance_create(x, y - 20, tuse);
}
oP.opened_chests += 1;
part_particles_create_color(global.below, x, y, global.pHeal, 65535, 30);
alarm[1] = 7200;
