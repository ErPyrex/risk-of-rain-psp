switch (os_type)
{
    case os_windows:
        if (!global.disable_fs)
        {
            FS_ini_close();
        }
        else
        {
            ini_close();
        }
        break;
    default:
        ini_close();
        break;
}
