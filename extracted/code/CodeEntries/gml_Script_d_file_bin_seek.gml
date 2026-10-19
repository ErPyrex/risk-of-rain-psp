switch (os_type)
{
    case os_windows:
        if (!global.disable_fs)
        {
            return FS_file_bin_seek(argument0, argument1);
        }
        else
        {
            return file_bin_seek(argument0, argument1);
        }
        break;
    default:
        return file_bin_seek(argument0, argument1);
        break;
}
