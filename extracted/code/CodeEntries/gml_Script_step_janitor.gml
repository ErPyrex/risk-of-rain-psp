var tskill_change = 0;
var tzs = 0;
var txs = 0;
var tcs = 0;
var tvs = 0;
var tui = 0;
step_default();
tui = step_player();
if (hp < (maxhp * 0.7))
{
    above_70_health = 0;
}
if (oHUD.minute == 25 && above_70_health && (oInit.coop != 2 || global.my_player == id))
{
    achievement_progress(19, 1);
}
image_angle2 -= 2;
if (instance_exists(gauge) == 1)
{
    gauge.x = x - 30;
    gauge.y = y - 30;
}
skill[1, 4] = x_stack + 3;
if ((activity == 0 && alarm[2] == -1 && z_skill == 1) || force_z == 1)
{
    caster_play(99, global.volume, 1);
    alarm[2] = skill[0, 2] / attack_speed;
    activity_var1 = 0;
    activity = 1;
    image_index = 0;
    force_z = 0;
    tzs = 1;
}
if (x_stack == 0)
{
    alarm[3] = 1;
}
if ((alarm[3] == -1 && x_skill == 1) && x_stack != 0)
{
    txs = 1;
}
if ((alarm[4] == -1 && c_skill == 1) || force_c == 1)
{
    caster_play(167, global.volume, 1.3);
    oHUD.alarm[0] = 10;
    alarm[4] = skill[2, 2] * (1 - cdr);
    gauge = instance_create(x, y, oJanitorGauge);
    gauge.parent = id;
    attack_speed += 0.3;
    stun += 0.3;
    sprite_idle = 97;
    sprite_walk = 101;
    sprite_jump = 99;
    sprite_shoot1 = 103;
    if (scepter == 0)
    {
        sprite_shoot4 = 105;
    }
    else
    {
        sprite_shoot4 = 107;
    }
    sprite_climb = 95;
    apply_buff(id, 5, 60);
    force_c = 0;
    tcs = 1;
}
if ((activity == 0 && alarm[5] == -1 && v_skill == 1) || force_v == 1)
{
    caster_play(103, global.volume, 1);
    alarm[5] = skill[3, 2];
    activity_var1 = 0;
    activity = 4;
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
    client_message_send(6, x, y, tzs, txs, tcs, tvs, tui, round((hp / maxhp) * 100));
    server_message_send(0, 6, object_index, m_id, x, y, tzs, txs, tcs, tvs, tui, round((hp / maxhp) * 100));
}
