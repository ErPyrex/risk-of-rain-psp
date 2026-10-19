var fname = FS_unique_fname("", "");
buffer_save_ext(argument0, fname, argument2, argument3);
return FS_export_raw(fname, argument1);
