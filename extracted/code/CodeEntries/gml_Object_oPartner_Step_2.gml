if (class == 1)
{
    step_gunner();
}
if (class == 2)
{
    step_miner();
}
if (class == 1)
{
    activity_gunner();
}
if (class == 2)
{
    activity_miner();
}
pVspeed = 0;
if (oP.activity != 30)
{
    x = oP.x - (10 * oP.image_xscale);
}
else
{
    x = oP.x;
}
y = oP.yprevious;
