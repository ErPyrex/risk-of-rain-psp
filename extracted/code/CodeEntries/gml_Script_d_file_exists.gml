switch (os_type)
{
    case os_windows:
        if (!global.disable_fs)
        {
            FS_file_exists(argument0);
        }
        else
        {
            file_exists(argument0);
        }
        break;
    default:
        file_exists(argument0);
        break;
}
