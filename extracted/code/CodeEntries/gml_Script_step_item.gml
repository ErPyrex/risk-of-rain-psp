icount -= 1;
pVspeed = min(pVspeed + pGravity, 5);
y += pVspeed;
f += 0.05;
yy = cos(f) * 2;
if (place_meeting(x, y, pBlock) == 1)
{
    y = yprevious;
    pGravity = 0;
    pVspeed = 0;
}
if (sound_played == 0 && yo != 0)
{
    if (oInit.coop != 2 || global.my_player == owner)
    {
        caster_play(132, global.volume, 1);
    }
    sound_played = 1;
}
time -= 1;
if ((time <= 0 && (tier == "or" || oInit.coop != 2)) && tier != "p")
{
    image_alpha -= 0.1;
    if (image_alpha <= 0)
    {
        instance_destroy();
    }
}
if (oInit.coop == 2 && !global.host && force_pickup != -5)
{
    var tid = find_object(167, force_pickup);
    if (instance_exists(tid))
    {
        x = tid.x;
        y = tid.y;
    }
}
