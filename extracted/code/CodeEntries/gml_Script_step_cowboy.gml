var tskill_change = 0;
var tzs = 0;
var txs = 0;
var tcs = 0;
var tvs = 0;
var tui = 0;
step_default();
tui = step_player();
if (darksight == 1)
{
    part_particles_create_color(global.above, (x - 3) + random(6), (y - 6) + random(12), global.pPoison, merge_color(c_white, c_gray, random(1)), 1);
    with (child_poi)
    {
        instance_destroy();
    }
    invincible = max(invincible, 1);
    darksight_timer -= 1;
    if (darksight_timer <= 0)
    {
        child_poi = instance_create(x, y, oPOI);
        child_poi.parent = id;
        caster_play(167, global.volume, 1.5);
        with (instance_create(x, y, oEfBullet2))
        {
            sprite_index = sCowboyShoot3;
            image_yscale = 1;
        }
        fire_explosion(0, x, y + 8, skill[2, 5], 292, 2, -1, 1, 3);
        pHmax -= 0.5;
        bullet.stun = 0.7;
        image_alpha = 1;
        darksight = 0;
    }
}
if ((activity == 0 && alarm[2] == -1 && z_skill == 1) || force_z == 1)
{
    can_fire = 0;
    alarm[2] = (skill[0, 2] * 1.7) / attack_speed;
    activity_var1 = 0;
    activity = 1;
    image_index = 0;
    force_z = 0;
    tzs = 1;
}
if (bonus_count >= 15 && (oInit.coop != 2 || global.my_player == id))
{
    achievement_progress(10, 1);
}
if (z_skill == 0 && can_fire == 0)
{
    can_fire = 1;
    alarm[2] = max(alarm[2] - ((skill[0, 2] * 0.8) / attack_speed), -1);
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
    activity = 4;
    image_index = 0;
    caster_play(59, global.volume, 1);
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
