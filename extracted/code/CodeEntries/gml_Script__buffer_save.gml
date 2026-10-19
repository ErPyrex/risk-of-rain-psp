var fname = FS_unique_fname("", "");
buffer_save(argument0, fname);
return FS_export_raw(fname, argument1);
