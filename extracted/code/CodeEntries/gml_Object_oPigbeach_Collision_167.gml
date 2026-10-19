if (oInit.coop == 0 && teleporting == 0 && room != rPigbeach)
{
    with (oP)
    {
        if (control(global.up_key, 3, 0) == 1)
        {
            other.hold += 1;
            if (other.hold >= 40)
            {
                oInit.current_level = 2;
                other.teleporting = 1;
                caster_play(125, global.volume, 1);
                with (instance_create(x, y, oFadeToBlack))
                {
                    des_room = 30;
                }
            }
        }
        else
        {
            hold = 0;
        }
    }
}
