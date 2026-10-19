var fname = FS_unique_fname("", ".png");
sprite_save(argument0, argument1, fname);
return FS_export_image(fname, argument2);
