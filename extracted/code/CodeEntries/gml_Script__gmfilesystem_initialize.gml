var exename = _guess_project_filename();
var location;
if (argument0)
{
    location = "%localappdata%";
}
else
{
    location = "%appdata%";
}
FS_set_gm_save_area(location + "/" + exename);
FS_set_working_directory(location + "/" + exename);
return 0;
