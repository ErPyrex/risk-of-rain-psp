mouse_cd = max(0, mouse_cd - 1);
if (list_active != list_controls && list_active != list_gp)
{
    change_key = -1;
}
if (change_key != -1 && list_active == list_controls)
{
    switch (change_key)
    {
        case 4:
            if (keyboard_lastkey != -1)
            {
                global.left_key = keyboard_lastkey;
                change_key = -1;
                d_ini_open("Prefs.ini");
                d_ini_write_real("Key", "left_key", global.left_key);
                d_ini_close();
            }
            break;
        case 5:
            if (keyboard_lastkey != -1)
            {
                global.right_key = keyboard_lastkey;
                change_key = -1;
                d_ini_open("Prefs.ini");
                d_ini_write_real("Key", "right_key", global.right_key);
                d_ini_close();
            }
            break;
        case 6:
            if (keyboard_lastkey != -1)
            {
                global.up_key = keyboard_lastkey;
                change_key = -1;
                d_ini_open("Prefs.ini");
                d_ini_write_real("Key", "up_key", global.up_key);
                d_ini_close();
            }
            break;
        case 7:
            if (keyboard_lastkey != -1)
            {
                global.down_key = keyboard_lastkey;
                change_key = -1;
                d_ini_open("Prefs.ini");
                d_ini_write_real("Key", "down_key", global.down_key);
                d_ini_close();
            }
            break;
        case 8:
            if (keyboard_lastkey != -1)
            {
                global.jump_key = keyboard_lastkey;
                change_key = -1;
                d_ini_open("Prefs.ini");
                d_ini_write_real("Key", "jump_key", global.jump_key);
                d_ini_close();
            }
            break;
        case 9:
            if (keyboard_lastkey != -1)
            {
                global.z_key = keyboard_lastkey;
                change_key = -1;
                d_ini_open("Prefs.ini");
                d_ini_write_real("Key", "z_key", global.z_key);
                d_ini_close();
            }
            break;
        case 10:
            if (keyboard_lastkey != -1)
            {
                global.x_key = keyboard_lastkey;
                change_key = -1;
                d_ini_open("Prefs.ini");
                d_ini_write_real("Key", "x_key", global.x_key);
                d_ini_close();
            }
            break;
        case 11:
            if (keyboard_lastkey != -1)
            {
                global.c_key = keyboard_lastkey;
                change_key = -1;
                d_ini_open("Prefs.ini");
                d_ini_write_real("Key", "c_key", global.c_key);
                d_ini_close();
            }
            break;
        case 12:
            if (keyboard_lastkey != -1)
            {
                global.v_key = keyboard_lastkey;
                change_key = -1;
                d_ini_open("Prefs.ini");
                d_ini_write_real("Key", "v_key", global.v_key);
                d_ini_close();
            }
            break;
        case 13:
            if (keyboard_lastkey != -1)
            {
                global.use_key = keyboard_lastkey;
                change_key = -1;
                d_ini_open("Prefs.ini");
                d_ini_write_real("Key", "use_key", global.use_key);
                d_ini_close();
            }
            break;
        case 14:
            if (keyboard_lastkey != -1)
            {
                global.yes_key = keyboard_lastkey;
                change_key = -1;
                d_ini_open("Prefs.ini");
                d_ini_write_real("Key", "yes_key", global.yes_key);
                d_ini_close();
            }
            break;
        case 15:
            if (keyboard_lastkey != -1)
            {
                global.swap_key = keyboard_lastkey;
                change_key = -1;
                d_ini_open("Prefs.ini");
                d_ini_write_real("Key", "swap_key", global.swap_key);
                d_ini_close();
            }
            break;
    }
}
else if (change_key != -1 && list_active == list_gp)
{
    switch (change_key)
    {
        case 46:
            var tgp = gamepad_lastkey();
            if (tgp != -1)
            {
                global.swap_key_gp = tgp;
                change_key = -1;
                d_ini_open("Prefs.ini");
                d_ini_write_real("Key", "z_key_gp", global.swap_key_gp);
                d_ini_close();
                mouse_cd = 15;
            }
            break;
        case 45:
            var tgp = gamepad_lastkey();
            if (tgp != -1)
            {
                global.yes_key_gp = tgp;
                change_key = -1;
                d_ini_open("Prefs.ini");
                d_ini_write_real("Key", "yes_key_gp", global.yes_key_gp);
                d_ini_close();
                mouse_cd = 15;
            }
            break;
        case 44:
            var tgp = gamepad_lastkey();
            if (tgp != -1)
            {
                global.use_key_gp = tgp;
                change_key = -1;
                d_ini_open("Prefs.ini");
                d_ini_write_real("Key", "use_key_gp", global.use_key_gp);
                d_ini_close();
                mouse_cd = 15;
            }
            break;
        case 43:
            var tgp = gamepad_lastkey();
            if (tgp != -1)
            {
                global.v_key_gp = tgp;
                change_key = -1;
                d_ini_open("Prefs.ini");
                d_ini_write_real("Key", "v_key_gp", global.v_key_gp);
                d_ini_close();
                mouse_cd = 15;
            }
            break;
        case 42:
            var tgp = gamepad_lastkey();
            if (tgp != -1)
            {
                global.c_key_gp = tgp;
                change_key = -1;
                d_ini_open("Prefs.ini");
                d_ini_write_real("Key", "c_key_gp", global.c_key_gp);
                d_ini_close();
                mouse_cd = 15;
            }
            break;
        case 41:
            var tgp = gamepad_lastkey();
            if (tgp != -1)
            {
                global.x_key_gp = tgp;
                change_key = -1;
                d_ini_open("Prefs.ini");
                d_ini_write_real("Key", "x_key_gp", global.x_key_gp);
                d_ini_close();
                mouse_cd = 15;
            }
            break;
        case 40:
            var tgp = gamepad_lastkey();
            if (tgp != -1)
            {
                global.z_key_gp = tgp;
                change_key = -1;
                d_ini_open("Prefs.ini");
                d_ini_write_real("Key", "z_key_gp", global.z_key_gp);
                d_ini_close();
                mouse_cd = 15;
            }
            break;
        case 39:
            var tgp = gamepad_lastkey();
            if (tgp != -1)
            {
                global.jump_key_gp = tgp;
                change_key = -1;
                d_ini_open("Prefs.ini");
                d_ini_write_real("Key", "jump_key_gp", global.jump_key_gp);
                d_ini_close();
                mouse_cd = 15;
            }
            break;
    }
}
