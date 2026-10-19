can_activate = 1;
with (other)
{
    if (control(global.yes_key, 11, 1) == 1)
    {
        with (other)
        {
            if (active == 0)
            {
                image_speed = 0.25;
                active = 1;
            }
        }
    }
}
