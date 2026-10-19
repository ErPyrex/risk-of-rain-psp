var fname = FS_unique_fname("", ".txt");
d3d_model_save(argument0, fname);
return FS_export_raw(fname, argument1);
