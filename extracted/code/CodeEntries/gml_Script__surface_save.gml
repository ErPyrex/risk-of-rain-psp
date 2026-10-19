var fname = FS_unique_fname("", ".bmp");
surface_save(argument0, fname);
return FS_export_image(fname, argument1);
