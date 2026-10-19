var fname = FS_unique_fname("", ".png");
background_save(argument0, fname);
return FS_export_image_adv(fname, argument1, argument2);
