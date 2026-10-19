var tpo = 15;
var tpl = 167;
var z = 2;
if (room == rSelectMult)
{
    tpo = oSelectMult.object_index;
    tpl = 210;
}
with (tpo)
{
    for (iii = 1; iii <= 10; iii += 1)
    {
        player[iii, 0] = -1;
        player[iii, 3] = 0;
        player[iii, 2] = -10;
        player[iii, 4] = -1;
        player[iii, 5] = -1;
        player[iii, 6] = "";
    }
    for (t = 0; t < instance_number(tpl); t += 1)
    {
        var vinst = instance_find(tpl, t);
        if (vinst == -4)
        {
            continue;
        }
        if (vinst != global.my_player)
        {
            player[z, 0] = vinst.class;
            player[z, 2] = vinst.id;
            player[z, 3] = vinst.ready;
            player[z, 4] = vinst.sock;
            player[z, 5] = vinst.m_id;
            player[z, 6] = vinst.user_name;
            z += 1;
        }
        else
        {
            player[1, 0] = vinst.class;
            player[1, 2] = vinst.id;
            player[1, 3] = vinst.ready;
            player[1, 4] = vinst.sock;
            player[1, 5] = vinst.m_id;
            player[1, 6] = vinst.user_name;
        }
    }
    player_max_chosen = instance_number(tpl);
}
