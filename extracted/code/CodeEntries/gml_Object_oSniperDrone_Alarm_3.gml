firing = 0;
if (instance_exists(master))
{
    if (master.scepter == 0)
    {
        master.skill[3, 4] = 4;
    }
    else
    {
        master.skill[3, 4] = 6;
    }
    master.skill[2, 4] = 3;
    master.alarm[4] = master.skill[2, 2] * (1 - master.cdr);
}
