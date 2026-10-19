switch (os_type)
{
    case os_windows:
        if (!global.disable_fs)
        {
            FS_file_bin_close(argument0);
        }
        else
        {
            file_bin_close(argument0);
        }
        break;
    default:
        file_bin_close(argument0);
        break;
}
