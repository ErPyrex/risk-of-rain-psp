switch (argument1)
{
    case 111:
        if (gamepad_axis_value(argument0, gp_axislh) <= -0.25 || gamepad_button_check(argument0, gp_padl))
        {
            return 1;
        }
        break;
    case 112:
        if (gamepad_axis_value(argument0, gp_axislh) >= 0.25 || gamepad_button_check(argument0, gp_padr))
        {
            return 1;
        }
        break;
    case 113:
        if (gamepad_axis_value(argument0, gp_axislv) <= -0.25 || gamepad_button_check(argument0, gp_padu))
        {
            return 1;
        }
        break;
    case 114:
        if (gamepad_axis_value(argument0, gp_axislv) >= 0.25 || gamepad_button_check(argument0, gp_padd))
        {
            return 1;
        }
        break;
    case 115:
        if (gamepad_axis_value(argument0, gp_axisrh) <= -0.25 || gamepad_button_check(argument0, gp_padl))
        {
            return 1;
        }
        break;
    case 116:
        if (gamepad_axis_value(argument0, gp_axisrh) >= 0.25 || gamepad_button_check(argument0, gp_padr))
        {
            return 1;
        }
        break;
    case 117:
        if (gamepad_axis_value(argument0, gp_axisrv) <= -0.25 || gamepad_button_check(argument0, gp_padu))
        {
            return 1;
        }
        break;
    case 118:
        if (gamepad_axis_value(argument0, gp_axisrv) >= 0.25 || gamepad_button_check(argument0, gp_padd))
        {
            return 1;
        }
        break;
}
return 0;
