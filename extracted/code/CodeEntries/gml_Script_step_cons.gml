var tskill_change = 0;
var tzs = 0;
var txs = 0;
var tcs = 0;
var tvs = 0;
var tui = 0;
step_default();
tui = step_player();
if (!z_skill)
{
    z_released = 1;
}
shield_dur -= 1;
var tcount = 0;
with (oConsRod)
{
    if (parent == other.id)
    {
        tcount++;
    }
}
var toffset;
if (scepter == 0)
{
    toffset = 0;
}
else
{
    toffset = 2;
}
switch (tcount)
{
    case 0:
        skill[3, 4] = 3 + toffset;
        skill[3, 2] = 120;
        break;
    case 1:
        skill[3, 4] = 4 + toffset;
        skill[3, 2] = 600;
        break;
    case 2:
        skill[3, 4] = 4 + toffset;
        skill[3, 2] = 120;
        alarm[5] = 600;
        break;
}
if (shield_dur != 0)
{
    shield_dur = max(0, shield_dur - 1);
    if (shield_dur == 0)
    {
        if (invincible < 3000)
        {
            invincible = 0;
        }
    }
}
if ((z_skill && z_released) || force_z == 1)
{
    if (activity == 0 && alarm[2] == -1)
    {
        z_released = 0;
        alarm[2] = skill[0, 2] / attack_speed;
        activity_var1 = 0;
        activity = 1;
        image_index = 0;
        force_z = 0;
        z_skill = 0;
    }
    tzs = 1;
}
if ((alarm[3] == -1 && x_skill == 1) || force_x == 1)
{
    with (instance_create(x, y, oEfSparks))
    {
        sprite_index = sConsExplode;
        image_yscale = 1;
    }
    caster_play(35, global.volume, 2.3);
    apply_buff(id, 30, 30);
    shield_dur = 240;
    invincible = 3000;
    alarm[3] = skill[1, 2] * (1 - cdr);
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
if ((alarm[5] == -1 && v_skill == 1) || force_v == 1)
{
    alarm[5] = skill[3, 2] * (1 - cdr);
    with (instance_create(x, y, oConsRod))
    {
        parent = other.id;
        if (other.scepter != 0)
        {
            sprite_index = sConsRodSpawn2;
        }
    }
    force_v = 0;
    tvs = 1;
}
if (tzs != 0 || txs != 0 || tcs == 1 || tvs == 1)
{
    tskill_change = 1;
}
if ((tskill_change || tui) && global.my_player == id)
{
    client_message_send(6, x, y, tzs, txs, tcs, tvs, tui, round((hp / maxhp) * 100));
    server_message_send(0, 6, object_index, m_id, x, y, tzs, txs, tcs, tvs, tui, round((hp / maxhp) * 100));
}
