var tskill_change = 0;
var tzs = 0;
var txs = 0;
var tcs = 0;
var tvs = 0;
var tui = 0;
step_default();
tui = step_player();
if (cleaver_count == 20)
{
    achievement_progress(51, 1);
}
if ((activity == 0 && alarm[2] == -1 && z_skill == 1) || force_z == 1)
{
    alarm[2] = skill[0, 2] / attack_speed;
    activity_var1 = 0;
    if (!empower)
    {
        activity = 1.1;
    }
    else
    {
        activity = 1.2;
        empower--;
    }
    image_index = 0;
    force_z = 0;
    tzs = 1;
}
if ((activity == 0 && alarm[3] == -1 && x_skill == 1) || force_x == 1)
{
    alarm[3] = skill[1, 2] * (1 - cdr);
    activity_var1 = 0;
    if (!empower)
    {
        activity = 2.1;
    }
    else
    {
        activity = 2.2;
        empower--;
    }
    image_index = 0;
    force_x = 0;
    txs = 1;
}
if ((activity == 0 && alarm[4] == -1 && c_skill == 1) || force_c == 1)
{
    alarm[4] = skill[2, 2] * (1 - cdr);
    activity_var1 = 0;
    if (!empower)
    {
        activity = 3.1;
    }
    else
    {
        activity = 3.2;
        empower--;
    }
    image_index = 0;
    force_c = 0;
    tcs = 1;
}
if ((activity == 0 && alarm[5] == -1 && v_skill == 1) || force_v == 1)
{
    if (scepter)
    {
        empower = 2;
    }
    else
    {
        empower = 1;
    }
    force_v = 0;
    tvs = 1;
    caster_play(70, global.volume, 1.7);
    with (instance_create(x, y, oEfFlash))
    {
        image_blend = make_color_rgb(222, 214, 54);
        rate = 0.06;
        parent = other.id;
    }
    with (instance_create(x, y - 32, oEfSparks))
    {
        image_speed = 0.25;
        sprite_index = sChefUltFlash;
        image_yscale = 1;
    }
}
if (empower == 0)
{
    skill[0, 0] = "DICE";
    skill[0, 1] = "THROW CLEAVER TOWARDS CUSTOMERS FOR 100% DAMAGE. BOOMERANGS BACK.";
    skill[0, 3] = 269;
    skill[1, 0] = "SEAR";
    skill[1, 1] = "COOK CUSTOMERS FOR 260% UNTIL GOLDEN BROWN, KNOCKING THEM AWAY.";
    skill[1, 3] = 269;
    skill[2, 0] = "GLAZE";
    skill[2, 1] = "RIDE ON A WAVE OF OIL, SLOWING CUSTOMERS. SEARING GLAZED CUSTOMERS STUNS THEM AND DEALS +78% DAMAGE.";
    skill[2, 3] = 269;
}
else
{
    alarm[5] = skill[3, 2] * (1 - cdr);
    skill[0, 0] = "MINCE";
    skill[0, 1] = "THROW 9 CLEAVERS IN A CIRCLE FOR 9x100% DAMAGE. BOOMERANGS BACK.";
    skill[0, 3] = 270;
    skill[1, 0] = "FLAMBE";
    skill[1, 1] = "COOK CUSTOMERS FOR 420% UNTIL INCINERATED, KNOCKING THEM AWAY.";
    skill[1, 3] = 270;
    skill[2, 0] = "MARINATE";
    skill[2, 1] = "RIDE ON A WAVE OF OIL, SLOWING CUSTOMERS. SEARING GLAZED CUSTOMERS STUNS THEM AND DEALS +78% DAMAGE.";
    skill[2, 3] = 270;
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
