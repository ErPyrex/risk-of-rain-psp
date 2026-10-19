if (team == "enemy" || team == "enemyproc")
{
    textColor = 11100540;
    gravity = 0.05;
    direction = 77 + random(6);
    speed = 1 + random(0.3);
}
else if (team == "player")
{
    textColor = 16777215;
    if (real(damage) > oInit.trophy_stats[4])
    {
        oInit.trophy_stats_new[4] = 1;
        oInit.trophy_unlocked += 1;
        oInit.trophy_stats[4] = real(damage);
    }
}
else if (team == "playerproc")
{
    textColor = 3585993;
    if (real(damage) > oInit.trophy_stats[4])
    {
        oInit.trophy_stats[4] = real(damage);
    }
}
else if (team == "laser")
{
    textColor = 8421376;
}
else if (team == "rage")
{
    textColor = 4341673;
    gravity = 0;
    speed = 0;
}
else if (team == "heal")
{
    textColor = 6870916;
    gravity = 0;
    direction = 90;
    speed = 0.31 + random(0.1);
}
