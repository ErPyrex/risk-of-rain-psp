switch (os_type)
{
    case os_windows:
        if (!global.disable_fs)
        {
            FS_file_bin_write_byte(argument0, argument1);
        }
        else
        {
            file_bin_write_byte(argument0, argument1);
        }
        break;
    default:
        file_bin_write_byte(argument0, argument1);
        break;
}
