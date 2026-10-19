var tskill_change = 0;
var tzs = 0;
var txs = 0;
var tcs = 0;
var tvs = 0;
var tui = 0;
step_default();
tui = step_player();
if ((activity == 0 && alarm[2] == -1 && z_skill == 1) || force_z == 1)
{
    activity_var2 = instance_create(x, y, oCustomBar);
    with (activity_var2)
    {
        parent = other.id;
        time = ceil(90 / other.attack_speed);
        maxtime = ceil(90 / other.attack_speed);
        image_index = 4;
        barColor = 6710991;
        charge = 1;
    }
    activity_var1 = 0;
    activity = 1.1;
    image_index = 0;
    force_z = 0;
    tzs = 1;
}
else if ((activity == 1.1 && alarm[2] == -1 && control(global.z_key, 6, 0) == 0 && (oInit.coop != 2 || global.my_player == id)) || force_z == 2)
{
    alarm[2] = skill[0, 2] * (1 - cdr);
    activity = 1.2;
    image_index = 0;
    force_z = 0;
    tzs = 2;
}
if ((activity == 0 && alarm[3] == -1 && x_skill == 1) || force_x == 1)
{
    alarm[3] = skill[1, 2] * (1 - cdr);
    activity_var1 = 0;
    activity = 2;
    image_index = 0;
    force_x = 0;
    txs = 1;
}
if ((activity == 0 && alarm[4] == -1 && c_skill == 1) || force_c == 1)
{
    alarm[4] = skill[2, 2] * (1 - cdr);
    activity_var1 = 0;
    activity = 3;
    image_index = 0;
    force_c = 0;
    tcs = 1;
}
if ((activity == 0 && alarm[5] == -1 && v_skill == 1) || force_v == 1)
{
    alarm[5] = skill[3, 2] * (1 - cdr);
    activity_var1 = 0;
    if (check_trace(300, 0) == 1 && check_trace(300, 180) == 1)
    {
        activity = 4.1;
    }
    else
    {
        activity = 4.2;
    }
    image_index = 0;
    force_v = 0;
    tvs = 1;
}
if (tzs == 1 || txs == 1 || tcs == 1 || tvs == 1)
{
    tskill_change = 1;
}
if ((tskill_change || tui) && global.my_player == id)
{
    client_message_send(6, x, y, tzs, txs, tcs, tvs, tui);
    server_message_send(0, 6, object_index, m_id, x, y, tzs, txs, tcs, tvs, tui);
}
