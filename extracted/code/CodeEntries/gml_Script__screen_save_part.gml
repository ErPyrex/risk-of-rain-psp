var fname = FS_unique_fname("", ".bmp");
screen_save_part(fname, argument1, argument2, argument3, argument4);
return FS_export_image(fname, argument0);
