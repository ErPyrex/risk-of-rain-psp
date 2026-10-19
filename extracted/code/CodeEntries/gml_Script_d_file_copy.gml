switch (os_type)
{
    case os_windows:
        if (!global.disable_fs)
        {
            FS_file_copy(argument0, argument1);
        }
        else
        {
            file_copy(argument0, argument1);
        }
        break;
    default:
        file_copy(argument0, argument1);
        break;
}
