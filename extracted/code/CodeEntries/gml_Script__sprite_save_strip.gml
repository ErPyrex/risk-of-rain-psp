var fname = FS_unique_fname("", ".png");
sprite_save_strip(argument0, fname);
return FS_export_image(fname, argument1);
