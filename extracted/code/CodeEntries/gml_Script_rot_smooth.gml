var dir = argument0;
var dest = argument1;
var spd = argument2;
var correct = argument3;
if (correct == 1)
{
    if (dir >= 360)
    {
        dir -= 360;
    }
    if (dir <= 0)
    {
        dir += 360;
    }
}
return dir + (sin(degtorad(dest - dir)) * spd);
