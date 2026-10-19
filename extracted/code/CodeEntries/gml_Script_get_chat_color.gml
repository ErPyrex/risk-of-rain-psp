var tpo = 167;
var tio = 15;
if (room == rSelectMult)
{
    tpo = 210;
    tio = 480;
}
var tc = 16777215;
if (argument0 == global.my_player.m_id)
{
    tc = oInit.player_color[1];
}
for (u = 1; u < instance_number(tpo); u += 1)
{
    if (tio.player[u + 1, 5] == argument0)
    {
        tc = oInit.player_color[u + 1];
        u = instance_number(tpo);
    }
}
return tc;
