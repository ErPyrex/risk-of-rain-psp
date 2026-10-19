if (!place_meeting(x, y + 1, pBlock))
{
    move_contact_solid(270 - (180 * (sign(pVspeed) == -1)), abs(pVspeed));
    pVspeed += 0.2;
}
else if (landed == 0 || hp < 0)
{
    caster_play(156, global.volume, random_range(0.8, 1.15));
    hp = 0;
    landed = 1;
    yscale *= 0.8;
    xscale *= 1.3;
}
yscale = (yscale + 1) / 2;
xscale = ((xscale * 3) + 1) / 4;
