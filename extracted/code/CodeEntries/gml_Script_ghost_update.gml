var g_dist = 5;
var yg_dist = 15;
if (oInit.coop == 2 && global.my_player != id)
{
    ghost_x += (min(g_dist, abs(ghost_x - x)) * sign(x - ghost_x));
    if (ghost_y < (y - yg_dist))
    {
        ghost_y += yg_dist;
    }
    else if (ghost_y > (y + yg_dist))
    {
        ghost_y -= yg_dist;
    }
    else
    {
        ghost_y = y;
    }
}
else
{
    ghost_x = x;
    ghost_y = y;
}
