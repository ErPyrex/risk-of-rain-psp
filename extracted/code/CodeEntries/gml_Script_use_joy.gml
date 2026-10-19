var ti = argument0;
var tkey = -1;
switch (argument1)
{
    case global.jump_key:
        tkey = global.jump_key_gp;
        break;
    case global.v_key:
        tkey = global.v_key_gp;
        break;
    case global.z_key:
        tkey = global.z_key_gp;
        break;
    case global.yes_key:
        tkey = global.yes_key_gp;
        break;
    case global.x_key:
        tkey = global.x_key_gp;
        break;
    case global.c_key:
        tkey = global.c_key_gp;
        break;
    case global.use_key:
        tkey = global.use_key_gp;
        break;
    case global.swap_key:
        tkey = global.swap_key_gp;
        break;
    case 27:
        tkey = 32778;
        break;
    case global.left_key:
        tkey = global.left_key_gp;
        break;
    case global.right_key:
        tkey = global.right_key_gp;
        break;
    case global.up_key:
        tkey = global.up_key_gp;
        break;
    case global.down_key:
        tkey = global.down_key_gp;
        break;
}
var ttype = argument2;
switch (ttype)
{
    case 0:
        if (gamepad_button_check(ti, tkey) || axis_return(ti, tkey))
        {
            return 1;
        }
        else
        {
            return 0;
        }
        break;
    case 1:
        if (gamepad_button_check_pressed(ti, tkey) || axis_return(ti, tkey))
        {
            return 1;
        }
        else
        {
            return 0;
        }
        break;
    case 2:
        if (gamepad_button_check_released(ti, tkey) || axis_return(ti, tkey))
        {
            return 1;
        }
        else
        {
            return 0;
        }
        break;
}
