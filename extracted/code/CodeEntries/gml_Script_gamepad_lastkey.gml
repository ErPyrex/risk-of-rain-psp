for (ii = 32769; ii < 32780; ii++)
{
    if (gamepad_button_check_pressed(0, ii) == 1)
    {
        return ii;
    }
}
return -1;
