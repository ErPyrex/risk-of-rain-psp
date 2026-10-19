var tskill_change = 0;
var tzs = 0;
var txs = 0;
var tcs = 0;
var tvs = 0;
var tui = 0;
step_default();
tui = step_player();
if (bunker == 0)
{
    skill[0, 2] = 45;
    shield_timer = 0;
}
else if (dead == 0)
{
    moveUp = 0;
    skill[0, 2] = 32;
    if (oTeleporter.active < 3 && (oInit.coop != 2 || global.my_player == id))
    {
        shield_timer += 1;
    }
    if (shield_timer >= 18000 && !dead)
    {
        achievement_progress(16, 1);
    }
}
if ((activity == 0 && alarm[2] == -1 && z_skill == 1) || force_z == 1)
{
    alarm[2] = skill[0, 2] / attack_speed;
    activity_var1 = 0;
    activity = 1;
    image_index = 0;
    force_z = 0;
    tzs = 1;
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
if ((activity == 0 && alarm[4] == -1 && c_skill == 1) || force_c != 0)
{
    if (bunker == 0 && (force_c == 1 || oInit.coop != 2 || global.my_player == id))
    {
        skill[2, 4] = 3;
        alarm[4] = 60;
        activity_var1 = 0;
        activity = 3.1;
        image_index = 0;
        force_c = 0;
        tcs = 1;
    }
    if (bunker != 0 && (force_c == 2 || oInit.coop != 2 || global.my_player == id))
    {
        skill[2, 4] = 2;
        alarm[4] = skill[2, 2] * (1 - cdr);
        activity_var1 = 0;
        activity = 3.2;
        image_index = 0;
        force_c = 0;
        tcs = 2;
    }
}
if ((activity == 0 && alarm[5] == -1 && v_skill == 1) || force_v == 1)
{
    alarm[5] = skill[3, 2] * (1 - cdr);
    activity_var1 = 0;
    activity = 4;
    image_index = 0;
    force_v = 0;
    tvs = 1;
}
if (tzs == 1 || txs == 1 || tcs != 0 || tvs == 1)
{
    tskill_change = 1;
}
if ((tskill_change || tui) && global.my_player == id)
{
    client_message_send(6, x, y, tzs, txs, tcs, tvs, tui, round((hp / maxhp) * 100));
    server_message_send(0, 6, object_index, m_id, x, y, tzs, txs, tcs, tvs, tui, round((hp / maxhp) * 100));
}
