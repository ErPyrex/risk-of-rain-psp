var tskill_change = 0;
var tzs = 0;
var txs = 0;
var tcs = 0;
var tvs = 0;
var tui = 0;
step_default();
tui = step_player();
if (consecutive_kills >= 2)
{
    achievement_progress(31, 1);
}
if (z_skill == 0 && can_fire == 0)
{
    can_fire = 1;
}
if ((activity == 0 && alarm[2] == -1 && z_skill == 1 && can_fire == 1) || force_z == 1)
{
    if (bullet_ready == 1)
    {
        can_fire = 0;
        bullet_ready = 0;
        activity_var1 = 0;
        activity = 1.1;
        image_index = 0;
        force_z = 0;
        tzs = 1;
    }
    else if (instance_exists(sniper_bar))
    {
        with (sniper_bar)
        {
            moving = 0;
            if (position <= 13 && position >= 9)
            {
                caster_play(138, global.volume, 1);
                other.sniper_bonus = 0.6;
                other.consecutive_bonus += 1;
                if (other.consecutive_bonus >= 15 && (oInit.coop != 2 || global.my_player == id))
                {
                    achievement_progress(30, 1);
                }
            }
            else if (position >= 14 && position <= 20)
            {
                caster_play(138, global.volume * 0.4, 1);
                other.sniper_bonus = 0.3;
                other.consecutive_bonus = 0;
            }
            else
            {
                other.consecutive_bonus = 0;
            }
        }
        can_fire = 0;
        activity_var1 = 0;
        activity = 1.2;
        image_index = 0;
        force_z = 0;
        tzs = 1;
    }
    else
    {
        bullet_ready = 1;
        activity = 0;
    }
}
if ((activity == 0 && alarm[4] == -1 && c_skill == 1) || force_c == 1)
{
    alarm[4] = skill[2, 2] * (1 - cdr);
    activity_var1 = 0;
    activity = 3.1;
    image_index = 0;
    force_c = 0;
    tcs = 1;
}
if ((activity == 0 && alarm[3] == -1 && x_skill == 1 && bullet_ready == 1) || force_x == 1)
{
    pHspeed = 0;
    moveLeft = 0;
    moveRight = 0;
    bullet_ready = 0;
    activity_type = 5;
    activity_var2 = instance_create(x, y, oCustomBar);
    with (activity_var2)
    {
        parent = other.id;
        time = ceil(150 / other.attack_speed);
        maxtime = ceil(150 / other.attack_speed);
        image_index = 4;
        barColor = 6710991;
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
if ((alarm[5] == -1 && v_skill == 1) || force_v == 1)
{
    if (skill[3, 4] == 4 || skill[3, 4] == 6)
    {
        alarm[5] = 30;
        force_v = 0;
        tvs = 1;
        var test_hp = 0;
        var test_id = -5;
        var test_distance = 9999;
        with (pEnemy)
        {
            var dis = point_distance(x, y, other.x, other.y);
            if ((maxhp > test_hp || (test_distance > dis && test_hp == maxhp)) && team == "enemy" && dis < 480)
            {
                test_id = id;
                test_hp = maxhp;
                test_distance = dis;
            }
        }
        if (test_id != -5)
        {
            with (drone)
            {
                other.skill[3, 4] = 5;
                caster_play(70, global.volume, 0.6);
                tt = test_id;
                alarm[0] = 30;
            }
        }
        else
        {
            caster_play(75, global.volume, 1);
            alarm[5] = 30;
        }
    }
    else
    {
        if (scepter == 0)
        {
            skill[3, 4] = 4;
        }
        else
        {
            skill[3, 4] = 6;
        }
        drone.tt = -6;
    }
}
if (tzs != 0 || txs != 0 || tcs != 0 || tvs != 0)
{
    tskill_change = 1;
}
if ((tskill_change || tui) && global.my_player == id)
{
    client_message_send(6, x, y, tzs, txs, tcs, tvs, tui, round((hp / maxhp) * 100));
    server_message_send(0, 6, object_index, m_id, x, y, tzs, txs, tcs, tvs, tui, round((hp / maxhp) * 100));
}
