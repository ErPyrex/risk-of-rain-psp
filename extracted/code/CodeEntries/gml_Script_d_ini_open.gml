switch (os_type)
{
    case os_windows:
        if (!global.disable_fs)
        {
            FS_ini_open(argument0);
        }
        else
        {
            ini_open(argument0);
        }
        break;
    default:
        ini_open(argument0);
        break;
}
