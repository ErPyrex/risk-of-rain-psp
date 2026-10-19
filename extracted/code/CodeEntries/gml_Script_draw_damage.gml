if (global.damage_on == 0)
{
    exit;
}
var tx = round(argument0);
var ty = round(argument1);
var tuseless = argument2;
var tdamage_real = real(argument3);
var tdamage = argument3;
var tcrit = argument4;
var tcolor_outside = argument5;
var tcolor_inside = argument6;
if (tcrit)
{
    tdamage = string(tdamage) + ":";
}
if (!(team == "noteam"))
{
    if (team == "enemy" || team == "enemyproc")
    {
        tcolor_outside = 11100540;
        tcolor_inside = tcolor_outside;
    }
    else if ((team == "player" || team == "playerproc") && tdamage_real > oInit.trophy_stats[4])
    {
        oInit.trophy_stats_new[4] = 1;
        oInit.trophy_unlocked += 1;
        oInit.trophy_stats[4] = tdamage_real;
        if (tdamage_real >= 5000)
        {
            achievement_progress(40, 1);
        }
    }
    else if (team == "neutral")
    {
        tcolor_outside = 12093564;
        tcolor_inside = 11100540;
    }
}
with (oParticleEngine)
{
    partHandlerBurst(tx, ty, argument2, tdamage, tcrit, tcolor_outside, tcolor_inside);
}
