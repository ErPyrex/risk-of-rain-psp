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
    sprite_index = choose(sprite_shoot1_1);
    alarm[2] = skill[0, 2] / attack_speed;
    activity_var1 = 0;
    activity = 1;
    image_index = 0;
    force_z = 0;
    tzs = 1;
}
if ((activity == 0 && alarm[3] == -1 && x_skill == 1) || force_x == 1)
{
    pVspeed = min(-pVmax * 1, pVspeed - (pVmax * 0.3));
    alarm[3] = skill[1, 2] * (1 - cdr);
    activity_var1 = 0;
    activity = 2;
    image_index = 0;
    force_x = 0;
    txs = 1;
}
if (dash_again == 0)
{
    skill[2, 4] = 2;
}
else
{
    skill[2, 4] = 3;
}
if ((activity == 0 && (alarm[4] == -1 || dash_again != 0) && c_skill == 1) || force_c == 1)
{
    alarm[4] = skill[2, 2] * (1 - cdr);
    if (dash_again == 2)
    {
        dash_again = 0;
    }
    else if (check_trace(pHmax * 10 * image_xscale * 4, 0) == 1)
    {
        alarm[4] = 30;
        dash_again += 1;
        dash_timer = 0;
    }
    else
    {
        dash_again = 0;
        dash_timer = 0;
    }
    activity_var1 = 0;
    activity = 3;
    image_index = 0;
    force_c = 0;
    tcs = 1;
    dash_timer = 0;
}
if (dash_again > 0)
{
    dash_timer += 1;
    if (dash_timer == 180)
    {
        dash_timer = 0;
        dash_again = 0;
        alarm[4] = skill[2, 2] * (1 - cdr);
    }
}
if ((activity == 0 && alarm[5] == -1 && v_skill == 1) || force_v == 1)
{
    ult_target = instance_nearest_variable(x, y, 321, "team", "enemy");
    if (instance_exists(ult_target))
    {
        if (point_distance(x, y, ult_target.x, ult_target.y) > 100)
        {
            ult_target = -4;
        }
    }
    alarm[5] = skill[3, 2] * (1 - cdr);
    activity_var1 = 0;
    activity = 4;
    image_index = 0;
    force_v = 0;
    tvs = 1;
}
if (tzs == 1 || txs != 0 || tcs == 1 || tvs == 1)
{
    tskill_change = 1;
}
if ((tskill_change || tui) && global.my_player == id)
{
    client_message_send(6, x, y, tzs, txs, tcs, tvs, tui, round((hp / maxhp) * 100));
    server_message_send(0, 6, object_index, m_id, x, y, tzs, txs, tcs, tvs, tui, round((hp / maxhp) * 100));
}
