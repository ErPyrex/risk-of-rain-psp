var fname = FS_unique_fname("", "");
script_execute(argument1, fname);
return FS_export_raw(fname, argument0);
