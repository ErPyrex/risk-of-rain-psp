var fname = FS_unique_fname("", "");
script_execute(argument0, fname, argument2);
return FS_export_raw(fname, argument1);
