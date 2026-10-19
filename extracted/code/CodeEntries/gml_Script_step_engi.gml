var tskill_change = 0;
var tzs = 0;
var txs = 0;
var tcs = 0;
var tvs = 0;
var tui = 0;
step_default();
tui = step_player();
if (mine_detonate_timer > 0)
{
    mine_detonate_timer -= 1;
    if (mine_detonate_count >= 15)
    {
        achievement_progress(24, 1);
    }
}
else
{
    mine_detonate_count = 0;
}
if (x_stack != x_stack_max)
{
    x_stack_cd += 1;
}
if (x_stack_cd >= (skill[1, 2] * (1 - cdr)))
{
    x_stack_cd = 0;
    x_stack += 1;
}
if (v_stack != v_stack_max)
{
    v_stack_cd += 1;
}
if (v_stack_cd >= (skill[3, 2] * (1 - cdr)))
{
    v_stack_cd = 0;
    v_stack += 1;
}
skill[1, 4] = 1 + x_stack;
skill[3, 4] = 18 + (3 * (scepter != 0)) + v_stack;
if (x_stack == 0)
{
    alarm[3] = (skill[1, 2] * (1 - cdr)) - x_stack_cd;
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
    x_stack -= 1;
    alarm[3] = 20;
    mine_count += 1;
    with (instance_create(x, y, oEngiMine))
    {
        parent = other.id;
    }
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
if (v_stack == 0)
{
    alarm[5] = (skill[3, 2] * (1 - cdr)) - v_stack_cd;
}
if ((activity == 0 && alarm[5] == -1 && v_skill == 1 && v_stack > 0) || force_v == 1)
{
    v_stack -= 1;
    alarm[5] = 30;
    with (instance_create(x, y - 10, oEngiTurret))
    {
        maxhp = other.maxhp * 1.65;
        hp = maxhp;
        parent = other.id;
        armor = max(20, other.armor);
        if (other.scepter == 0)
        {
            sprite_index2 = 174;
            sprite_rotate = 174;
            sprite_shoot1 = 175;
            sprite_idle = 172;
            sprite_index = sEngiTurret1Spawn;
            sprite_base = 173;
        }
        else
        {
            sprite_index2 = 178;
            sprite_rotate = 178;
            sprite_shoot1 = 179;
            sprite_idle = 176;
            sprite_index = sEngiTurret2Spawn;
            sprite_base = 177;
            scepter = other.scepter;
        }
    }
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
