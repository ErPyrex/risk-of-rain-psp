if (dead == 1)
{
    sprite_idle = 138;
}
var tskill_change = 0;
var tzs = 0;
var txs = 0;
var tcs = 0;
var tvs = 0;
var tui = 0;
step_default();
tui = step_player();
var tx = x;
var ty = y;
if (attack_speed >= 2 && (oInit.coop != 2 || global.my_player == id))
{
    achievement_progress(21, 1);
}
if (stance == 1)
{
    if ((activity == 0 && alarm[2] == -1 && z_skill == 1) || force_z == 1)
    {
        half = 1;
        image_index2 = 0;
        if (check_trace(300 * image_xscale, 0) == 1)
        {
            image_xscale2 = image_xscale;
        }
        else if (check_trace(-300 * image_xscale, 0) == 1)
        {
            image_xscale2 = -image_xscale;
        }
        else
        {
            image_xscale2 = image_xscale;
        }
        alarm[2] = skill[0, 2] / attack_speed;
        activity_var1 = 0;
        activity = 1;
        force_z = 0;
        tzs = 1;
    }
    if ((activity == 0 && alarm[3] == -1 && x_skill == 1) || force_x == 1)
    {
        half = 1;
        image_index2 = 0;
        if (check_trace(300 * image_xscale, 0) == 1)
        {
            image_xscale2 = image_xscale;
        }
        else if (check_trace(-300 * image_xscale, 0) == 1)
        {
            image_xscale2 = -image_xscale;
        }
        else
        {
            image_xscale2 = image_xscale;
        }
        alarm[3] = skill[1, 2] * (1 - cdr);
        activity_var1 = 0;
        activity = 2;
        force_x = 0;
        txs = 1;
    }
    if ((alarm[4] == -1 && c_skill == 1 && activity != 30) || force_c == 1)
    {
        caster_play(93, global.volume, random_range(0.9, 1.1));
        with (instance_create(x, y, oEfSparks))
        {
            sprite_index = sHuntress1Shoot3;
        }
        move_contact_solid(90 - (90 * image_xscale), 30 * pHmax);
        ghost_x = x;
        ghost_y = y;
        with (instance_create(x, y, oEfSparks))
        {
            sprite_index = sHuntress1Shoot3;
        }
        if (check_trace(300 * image_xscale, 0) == 1)
        {
            image_xscale2 = image_xscale;
        }
        else if (check_trace(-300 * image_xscale, 0) == 1)
        {
            image_xscale2 = -image_xscale;
        }
        else
        {
            image_xscale2 = image_xscale;
        }
        alarm[4] = skill[2, 2] * (1 - cdr);
        force_c = 0;
        tcs = 1;
    }
    if ((activity == 0 && alarm[5] == -1 && v_skill == 1) || force_v == 1)
    {
        half = 1;
        image_index2 = 0;
        if (check_trace(300 * image_xscale, 0) == 1)
        {
            image_xscale2 = image_xscale;
        }
        else if (check_trace(-300 * image_xscale, 0) == 1)
        {
            image_xscale2 = -image_xscale;
        }
        else
        {
            image_xscale2 = image_xscale;
        }
        alarm[5] = skill[3, 2] * (1 - cdr);
        activity_var1 = 0;
        activity = 4;
        force_v = 0;
        tvs = 1;
    }
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
