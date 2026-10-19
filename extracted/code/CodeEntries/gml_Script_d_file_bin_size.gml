switch (os_type)
{
    case os_windows:
        if (!global.disable_fs)
        {
            return FS_file_bin_size(argument0);
        }
        else
        {
            return file_bin_size(argument0);
        }
        break;
    default:
        return file_bin_size(argument0);
        break;
}
