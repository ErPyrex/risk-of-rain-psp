switch (os_type)
{
    case os_windows:
        if (!global.disable_fs)
        {
            return FS_ini_read_real(argument0, argument1, argument2);
        }
        else
        {
            return ini_read_real(argument0, argument1, argument2);
        }
        break;
    default:
        return ini_read_real(argument0, argument1, argument2);
        break;
}
