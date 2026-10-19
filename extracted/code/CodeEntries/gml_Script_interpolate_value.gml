vO = argument0;
vF = argument1;
minS = argument2;
maxS = argument3;
int_speed = min(max(abs(vO - (abs(vF + (vO * 3)) / 4)), minS), maxS);
vO += (int_speed * sign(vF - vO));
if (abs(vO - vF) <= argument2)
{
    vO = argument1;
}
return vO;
