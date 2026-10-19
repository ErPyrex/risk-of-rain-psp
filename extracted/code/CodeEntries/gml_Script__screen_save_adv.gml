var fname = FS_unique_fname("", ".bmp");
screen_save(fname);
return FS_export_image_adv(fname, argument0, argument1);
