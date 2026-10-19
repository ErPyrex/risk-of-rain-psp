switch (os_type)
{
    case os_windows:
        if (!global.disable_fs)
        {
            FS_ini_write_real(argument0, argument1, argument2);
        }
        else
        {
            ini_write_real(argument0, argument1, argument2);
        }
        break;
    default:
        ini_write_real(argument0, argument1, argument2);
        break;
}
