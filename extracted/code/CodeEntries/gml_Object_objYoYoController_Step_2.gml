var tx = 0;
var ty = 0;
global.mouse_emulate = 0;
for (var i = 0; i < 5; i += 1)
{
    if (gamepad_is_connected(i))
    {
        if (gamepad_button_check_pressed(i, gp_face1))
        {
            global.yoyocontrol[12] = 1;
            show_debug_message(string(i));
        }
        else
        {
            global.yoyocontrol[12] = 0;
        }
        if (gamepad_button_check_pressed(i, global.jump_key_gp))
        {
            global.mouse_emulate = 1;
            global.yoyocontrol[0] = 1;
        }
        else
        {
            global.yoyocontrol[0] = 0;
        }
        if (gamepad_button_check_pressed(i, global.v_key_gp))
        {
            global.yoyocontrol[1] = 1;
        }
        else
        {
            global.yoyocontrol[1] = 0;
        }
        if (gamepad_button_check_pressed(i, global.z_key_gp))
        {
            global.yoyocontrol[2] = 1;
        }
        else
        {
            global.yoyocontrol[2] = 0;
        }
        if (gamepad_button_check_pressed(i, global.yes_key_gp))
        {
            global.yoyocontrol[3] = 1;
        }
        else
        {
            global.yoyocontrol[3] = 0;
        }
        if (gamepad_button_check_pressed(i, global.x_key_gp))
        {
            global.yoyocontrol[4] = 1;
        }
        else
        {
            global.yoyocontrol[4] = 0;
        }
        if (gamepad_button_check_pressed(i, global.c_key_gp))
        {
            global.yoyocontrol[5] = 1;
        }
        else
        {
            global.yoyocontrol[5] = 0;
        }
        if (gamepad_button_check_pressed(i, global.use_key_gp))
        {
            global.yoyocontrol[6] = 1;
        }
        else
        {
            global.yoyocontrol[6] = 0;
        }
        if (gamepad_button_check_pressed(i, gp_start))
        {
            global.yoyocontrol[7] = 1;
        }
        else if (gamepad_button_check_pressed(i, gp_select))
        {
            global.yoyocontrol[7] = 1;
        }
        else
        {
            global.yoyocontrol[7] = 0;
        }
        if (gamepad_axis_value(i, gp_axislh) > 0.25)
        {
            global.yoyocontrol[9] = 1 * gamepad_axis_value(i, gp_axislh);
        }
        else if (gamepad_axis_value(i, gp_axislh) < -0.25)
        {
            global.yoyocontrol[8] = 1 * abs(gamepad_axis_value(i, gp_axislh));
        }
        else
        {
            if (gamepad_button_check(i, gp_padl))
            {
                global.yoyocontrol[8] = 0.6;
            }
            else
            {
                global.yoyocontrol[8] = 0;
            }
            if (gamepad_button_check(i, gp_padr))
            {
                global.yoyocontrol[9] = 0.6;
            }
            else
            {
                global.yoyocontrol[9] = 0;
            }
        }
        if (gamepad_axis_value(i, gp_axislv) > 0.25)
        {
            global.yoyocontrol[11] = 1 * gamepad_axis_value(i, gp_axislv);
        }
        else if (gamepad_axis_value(i, gp_axislv) < -0.25)
        {
            global.yoyocontrol[10] = 1 * abs(gamepad_axis_value(i, gp_axislv));
        }
        else
        {
            if (gamepad_button_check(i, gp_padu))
            {
                global.yoyocontrol[10] = 0.6;
            }
            else
            {
                global.yoyocontrol[10] = 0;
            }
            if (gamepad_button_check(i, gp_padd))
            {
                global.yoyocontrol[11] = 0.6;
            }
            else
            {
                global.yoyocontrol[11] = 0;
            }
        }
        if (gamepad_button_check_pressed(i, gp_start))
        {
            with (oMenu)
            {
                event_perform(ev_keypress, vk_escape);
            }
        }
        if (players_alive() == 0)
        {
            if (global.yoyocontrol[8] != 0)
            {
                tx += (-7 * abs(global.yoyocontrol[8]));
            }
            else if (global.yoyocontrol[9] != 0)
            {
                tx += (7 * abs(global.yoyocontrol[9]));
            }
            if (global.yoyocontrol[10] != 0)
            {
                ty += (-7 * abs(global.yoyocontrol[10]));
            }
            else if (global.yoyocontrol[11] != 0)
            {
                ty += (7 * abs(global.yoyocontrol[11]));
            }
        }
        if (global.yoyocontrol[12] != 0)
        {
            with (pMenu)
            {
                event_perform(ev_mouse, ev_global_left_press);
            }
        }
    }
}
if (tx != 0 || ty != 0)
{
    window_mouse_set(window_mouse_get_x() + tx, window_mouse_get_y() + ty);
}
