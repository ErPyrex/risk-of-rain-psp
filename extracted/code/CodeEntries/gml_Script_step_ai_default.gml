ghost_update();
if ((hp <= 0 || force_death == 1) && elite_tier > 9)
{
    oHUD.boss = -1;
}
npc_death(0, force_death);
if (elite_tier > 9)
{
    if (oHUD.boss != 1)
    {
        oHUD.boss = 1;
        oHUD.boss_id = id;
        oHUD.boss_hp = hp;
        oHUD.boss_maxhp = maxhp;
        oHUD.boss_text1 = "Blighted " + name;
        oHUD.boss_text2 = "Phantasm";
    }
    else if (oHUD.boss_id == id)
    {
        oHUD.boss_hp = hp;
        oHUD.boss_maxhp = maxhp;
    }
}
if (oInit.coop == 2 && sync == 1)
{
    m_id = set_m_id(0);
    sync = 0;
    server_message_send(0, 12, object_index, m_id, x, y);
}
death_timer -= 1;
make_sound = max(0, make_sound - 1);
if (disable_ai == 1)
{
    exit;
}
if ((lastHp > hp && lastHp != -1 && hp > 0) || force_knockback == 1)
{
    s = lastHp - hp;
    lastHp = hp;
    if (((s > knockback_cap || knockback_value > 3 || alarm[7] > 20) && (oInit.coop != 2 || global.host)) || force_knockback == 1)
    {
        force_knockback = 0;
        if (oInit.coop != 2 || global.host)
        {
            image_xscale = sign(lasthit_x - x) * abs(image_xscale);
            if (image_xscale == 0)
            {
                image_xscale = 1;
            }
            if (knockback_value <= 3)
            {
                knockback_value = 3;
            }
            alarm[7] = max(20, alarm[7]);
        }
        if (oInit.coop == 2)
        {
            server_message_send(0, 8, object_index, m_id, round(hp), round(x), round(y), sign(image_xscale), knockback_value, alarm[7]);
        }
        if (alarm[7] != 20 && stunned == 0)
        {
            stunned = 1;
            if (frozen == 0)
            {
                s = instance_create(x, y, oEfStun);
                s.parent = id;
            }
        }
        activity_type = 1;
        activity = 50;
        image_speed = 0;
        if (frozen == 0)
        {
            sprite_index = sprite_death;
            image_index = 0;
        }
    }
    if (make_sound == 0 && oHUD.hit_sound_count < 2 && inside_view(x, y) == 1)
    {
        oHUD.hit_sound_count += 1;
        caster_play(sound_hit, global.volume, hit_pitch);
        make_sound = 5;
    }
    alarm[6] = 360;
}
if (elite != 0 && alarm[7] > 2)
{
    alarm[7] = max(alarm[7] - 1, 2);
}
if (frozen == 1)
{
    frozen = 2;
    with (instance_create(x, y, oEfFlash))
    {
        parent = other.id;
        rate = 0.1;
    }
    caster_play(79, global.volume, 0.9 + random(0.2));
}
else if (frozen == 2)
{
    if (alarm[7] == -1)
    {
        frozen = 0;
    }
    if (random(100) < 10)
    {
        repeat (global.graphics)
        {
            part_particles_create_color(global.above, x - (((sprite_get_width(sprite_index) / 2) - random(sprite_get_width(sprite_index))) * random(1.7) * random(1.7)), y - (((sprite_get_height(sprite_index) / 2) - random(sprite_get_height(sprite_index))) * random(1.7) * random(1.7)), global.pPixelDust, merge_color(c_white, #8EBAC1, random(1)), 1);
        }
    }
}
if (pHspeed == 0)
{
    exit;
}
var xoffset1 = sprite_get_bbox_left(mask_index) - sprite_get_xoffset(mask_index);
var xoffset2 = sprite_get_bbox_right(mask_index) - sprite_get_xoffset(mask_index);
var yoffset1 = sprite_get_bbox_top(mask_index) - sprite_get_yoffset(mask_index);
var yoffset2 = sprite_get_bbox_bottom(mask_index) - sprite_get_yoffset(mask_index);
var xo;
if (image_xscale == 1)
{
    xo = xoffset2;
}
else
{
    xo = xoffset1;
}
if ((get_collision(x + xo + (1 * image_xscale), y + yoffset2 + 2) == 0 && (get_collision(x + xo + (1 * image_xscale), y + yoffset2 + 18) == 0 || can_jump == 0)) && free == 0)
{
    moveLeft = !moveLeft;
    moveRight = !moveRight;
}
