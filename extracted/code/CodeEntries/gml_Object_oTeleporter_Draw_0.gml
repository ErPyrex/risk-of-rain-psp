draw_set_alpha(1);
draw_sprite(sprite_index, -1, x, y);
if (can_activate == 1 && active == 0)
{
    draw_set_halign(fa_left);
    draw_set_valign(fa_bottom);
    draw_set_font(global.fntTinyAlt);
    draw_set_color(c_white);
    if (global.joystick_on == 0)
    {
        if (epic == 1)
        {
            draw_ctext(x - 104, y - 32, "Press &y&'" + string_key(global.yes_key) + "'&!& to activate the divine teleporter. Are you ready?");
        }
        else
        {
            draw_ctext(x - 104, y - 32, "Press &y&'" + string_key(global.yes_key) + "'&!& to activate teleporter. Are you ready?");
        }
    }
    else if (epic == 1)
    {
        draw_ctext(x - 104, y - 32, "Press '" + string_key(global.yes_key_gp) + "' to activate the divine teleporter. Are you ready?");
    }
    else
    {
        draw_ctext(x - 104, y - 32, "Press '" + string_key(global.yes_key_gp) + "' to activate teleporter. Are you ready?");
    }
}
if (can_activate == 1 && active == 3)
{
    draw_set_halign(fa_left);
    draw_set_valign(fa_bottom);
    draw_set_font(global.fntTinyAlt);
    draw_set_color(c_white);
    if (global.joystick_on == 0)
    {
        if (epic == 1)
        {
            draw_ctext(x - 104, y - 40, "Press &r&'" + string_key(global.swap_key) + "'&!& to teleport to the final level.");
            draw_ctext(x - 104, y - 32, "Press &y&'" + string_key(global.yes_key) + "'&!& to revisit previous levels.");
        }
        else
        {
            draw_ctext(x - 104, y - 32, "Press &y&'" + string_key(global.yes_key) + "'&!& to teleport to the next level.");
        }
    }
    else if (epic == 1)
    {
        draw_ctext(x - 104, y - 40, "Press '" + string_key(global.swap_key_gp) + "' to teleport to the final level.");
        draw_ctext(x - 104, y - 32, "Press '" + string_key(global.yes_key_gp) + "' to revisit previous levels.");
    }
    else
    {
        draw_ctext(x - 104, y - 32, "Press '" + string_key(global.yes_key_gp) + "' to teleport to the next level.");
    }
}
if (active == 1)
{
    if (floor(time / 60) == (time / 60))
    {
        s = instance_create(x, y, oEfCircle);
    }
    if (random(100) < 40)
    {
        part_particles_create_color(global.below, x, y, global.pHeal, 12750215, 1);
    }
    draw_rectangle_color(x - 21, y - sprite_yoffset - 3, x + 21, y - sprite_yoffset - 7, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 0);
    draw_rectangle_color(x - 20, y - sprite_yoffset - 4, x + 20, y - sprite_yoffset - 6, c_black, c_black, c_black, c_black, 0);
    draw_set_color(#878DC2);
    draw_rectangle(x - 20, y - sprite_yoffset - 4, (x - 20) + (40 * (time / maxtime)), y - sprite_yoffset - 6, false);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_font(global.fntTinyAlt);
    draw_set_color(c_white);
    draw_text(x, y - 44, "STAY ALIVE..!");
    if (oInit.coop != 1)
    {
        with (oInit.player[1, 2])
        {
            draw_text(ceil(x), ceil(y - 24), string(ceil(other.time / 60)) + "/" + string(other.maxtime / 60) + " seconds");
        }
        oHUD.objective_text = "Stay alive!";
    }
    else
    {
        oHUD.objective_text = string(ceil(time / 60)) + "/" + string(maxtime / 60) + " seconds";
    }
}
if (active == 2)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_font(global.fntTinyAlt);
    draw_set_color(c_white);
    if (oInit.coop != 1)
    {
        with (oInit.player[1, 2])
        {
            draw_text(ceil(x), ceil(y - 24), "Remaining enemies: " + string((instance_number(pEnemy) - global.director.ghost_count) + global.director.deactivated_count));
        }
        oHUD.objective_text = "Kill remaining enemies";
    }
    else
    {
        oHUD.objective_text = "Remaining enemies: " + string((instance_number(pEnemy) - global.director.ghost_count) + global.director.deactivated_count);
    }
    if (instance_number(pEnemy) != 0)
    {
        if (oInit.coop == 1)
        {
            with (oP)
            {
                if (dead == 0)
                {
                    var d = point_direction(x, y, instance_nearest(x, y, pEnemy).x, instance_nearest(x, y, pEnemy).y);
                    draw_sprite_ext(sArrow, 1, ceil(x) + lengthdir_x(19, d), ceil(y) + lengthdir_y(19, d), 1, 1, d, c_white, 0.9);
                }
            }
        }
        else
        {
            with (oInit.player[1, 2])
            {
                if (dead == 0)
                {
                    var tclosest = instance_nearest_variable(x, y, 321, "team", "enemy");
                    if (instance_exists(tclosest))
                    {
                        var d = point_direction(x, y, tclosest.x, tclosest.y);
                        draw_sprite_ext(sArrow, 1, ceil(x) + lengthdir_x(19, d), ceil(y) + lengthdir_y(19, d), 1, 1, d, c_white, 0.9);
                    }
                }
            }
        }
    }
    else if (global.director.deactivated_count > 0)
    {
        f = instance_nearest(x, y, oP);
        var d = point_direction(f.x, f.y, global.director.deactivated_x, global.director.deactivated_y);
        draw_sprite_ext(sArrow, 1, ceil(f.x) + lengthdir_x(15, d), ceil(f.y) + lengthdir_y(15, d), 1, 1, d, c_white, 0.6);
        draw_sprite_ext(sArrow, 1, ceil(f.x) + lengthdir_x(15, d), ceil(f.y) + lengthdir_y(15, d), 1.1, 1.1, d, c_white, 0.3);
    }
}
if (active == 3)
{
    if (!sync_active3)
    {
        sync_active3 = 1;
        server_message_send(0, 14, object_index, m_id, 1, 1);
        with (pEnemy)
        {
            instance_destroy();
        }
        with (oDancingGolem)
        {
            instance_destroy();
        }
    }
    oHUD.objective_text = "Go to the teleporter to advance to the next level!";
    with (oP)
    {
        if (dead == 0 && inside_view(x, y))
        {
            var d = point_direction(x, y, other.x, other.y);
            draw_sprite_ext(sArrow, 0, ceil(x) + lengthdir_x(15, d), ceil(y) + lengthdir_y(15, d), 1, 1, d, c_white, 0.8);
        }
    }
}
if (active == 4 || active == 6)
{
    if (oHUD.minute < 5 && oInit.current_level == 1)
    {
        achievement_progress(1, 1);
    }
    if (exp_cd == 0 && floor(oHUD.gold) != 0)
    {
        s = instance_create(view_xview[0] + 30, view_yview[0] + 30, oEfExp);
        s.direction = random(360);
        s.speed = random_range(1, 3);
        caster_play(55, global.volume, 1);
        exp_cd = 5;
        if (oHUD.gold >= 10000)
        {
            s.value = ceil(oHUD.gold * 0.05);
            oHUD.gold = max(0, oHUD.gold - ceil(oHUD.gold * 0.05));
            s.sprite_index = sEfExp4;
            s.alarm[0] = 1;
        }
        else if (oHUD.gold >= 2000)
        {
            oHUD.gold = max(0, oHUD.gold - 500);
            s.value = 100;
            s.sprite_index = sEfExp3;
            s.alarm[0] = 1;
        }
        else
        {
            oHUD.gold = max(0, oHUD.gold - 50);
            s.value = 10;
            s.sprite_index = sEfExp2;
            s.alarm[0] = 1;
        }
        if (oInit.coop == 2)
        {
            s.target = global.my_player;
        }
    }
    if (floor(oHUD.gold) < 50 && instance_number(oEfExp) == 0)
    {
        if (oInit.coop != 2)
        {
            active += 1;
            caster_play(157, global.volume, 1);
            alarm[0] = 60;
            with (oP)
            {
                s = instance_create(x, y + 6, oEfBullet2);
                s.sprite_index = sEfRecall;
                s.image_yscale = 1;
                visible = false;
                activity = 99;
                activity_type = 3;
                pHspeed = 0;
                pVspeed = 0;
            }
        }
        else if (!global.my_player.ready)
        {
            global.my_player.ready = 1;
            server_message_send(0, 1, global.my_player.object_index, global.my_player.m_id, 1);
            client_message_send(1, 1);
        }
        else if (players_ready() == 1)
        {
            active += 1;
            caster_play(157, global.volume, 1);
            if (global.host)
            {
                alarm[0] = 60;
            }
            with (oP)
            {
                s = instance_create(x, y + 6, oEfBullet2);
                s.sprite_index = sEfRecall;
                s.image_yscale = 1;
                visible = false;
                activity = 99;
                activity_type = 3;
                pHspeed = 0;
                pVspeed = 0;
            }
        }
    }
}
if (oInit.coop == 2 && active >= 4)
{
    with (oP)
    {
        var w = string_width(user_name);
        if (ready == 0)
        {
            draw_sprite_ext(sLockedIn, 0, ceil(ghost_x), ceil(ghost_y) + 5 + 24, 1, 1, 0, oInit.player_color[player_id], 1);
        }
        else
        {
            draw_sprite(sLockedIn, 1, ceil(ghost_x), ceil(ghost_y) + 5 + 24);
        }
    }
}
