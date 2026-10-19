var tskill_change = 0;
var tzs = 0;
var txs = 0;
var tcs = 0;
var tvs = 0;
var tui = 0;
step_default();
tui = step_player();
if (hp < (maxhp * 0.5) && oTeleporter.active > 0)
{
    above_50_health = 0;
}
if (oTeleporter.active >= 3 && above_50_health && (oInit.coop != 2 || global.my_player == id))
{
    achievement_progress(27, 1);
}
if (level >= 10 && last_hit_number <= 1 && (oInit.coop != 2 || global.my_player == id))
{
    achievement_progress(28, 1);
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
    activity_var2 = instance_create(x, y, oCustomBar);
    with (activity_var2)
    {
        parent = other.id;
        time = ceil(90 / other.attack_speed);
        maxtime = ceil(90 / other.attack_speed);
        image_index = 2;
        barColor = 4044510;
        charge = 1;
    }
    activity_var1 = 0;
    activity = 2.1;
    image_index = 0;
    force_x = 0;
    txs = 1;
}
else if ((activity == 2.1 && alarm[3] == -1 && control(global.x_key, 7, 0) == 0 && (oInit.coop != 2 || global.my_player == id)) || force_x == 2)
{
    alarm[3] = skill[1, 2] * (1 - cdr);
    activity = 2.2;
    image_index = 0;
    force_x = 0;
    txs = 2;
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
    activity = 4;
    pVspeed = min(-pVmax * 1.5, pVspeed - (pVmax * 1));
    sprite_index = sprite_jump;
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
