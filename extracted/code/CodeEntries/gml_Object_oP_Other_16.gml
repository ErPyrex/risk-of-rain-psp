if (hippo == 0)
{
    if (oInit.coop != 2 || (id == global.my_player && use[0] != -1))
    {
        if (ds_map_exists(oInit.use_list, use[0]) == 1)
        {
            ds_map_replace(oInit.use_list, use[0], ds_map_find_value(oInit.use_list, use[0]) + use_item_held);
        }
        else
        {
            ds_map_add(oInit.use_list, use[0], use_item_held);
        }
    }
    if (oInit.coop == 2 && global.my_player == id)
    {
        add_chat_system(0, "'" + user_name + "' has died.");
    }
    if (oInit.coop != 2 || global.my_player == id)
    {
        achievement_progress(35, 1);
    }
    activity = 99;
    activity_type = 1;
    visible = false;
    dead = 1;
    dead_body = instance_create(x, y, oEfPlayerDead);
    dead_body.sprite_index = sprite_dead;
    if (global.my_player == id)
    {
        dead_body.true_player = 1;
    }
    else
    {
        dead_body.true_player = 0;
    }
    dead_body.image_xscale = image_xscale;
    dead_body.hspeed = -2 * image_xscale;
    dead_body.class = class;
    dead_body.player_index = sprite_idle;
    dead_body.player_name = name;
    pHspeed = 0;
    pVspeed = 0;
    oInit.player_number -= 1;
    with (child_poi)
    {
        instance_destroy();
    }
    if (class == 5)
    {
        s = instance_create(x, y, oBody);
        s.image_speed = 0.2;
        s.sprite_index = sJanitorDeath;
        s.image_xscale = image_xscale;
        with (s)
        {
            move_contact_solid(270, -1);
        }
    }
}
else
{
    hippo = 0;
    invincible = 120;
    hp = maxhp * 0.4;
    oHUD.alarm[0] = 60;
    caster_play(139, global.volume, 1);
    with (instance_create(x, y, oEfFlash))
    {
        parent = other.id;
        rate = 0.009;
    }
    with (instance_create(x, y - 32, oEfSparks))
    {
        image_yscale = 1;
        sprite_index = sEfRevive;
        image_speed = 0.2;
    }
    for (i = 0; i <= item_count; i += 1)
    {
        if (item[i, 0] == 776)
        {
            item[i, 0] = 777;
            item[i, 2] = "He's used up.";
            break;
        }
    }
    force_death = 0;
}
if (oInit.coop == 2)
{
    if (id == global.my_player)
    {
        client_message_send(9);
        server_message_send(0, 9, object_index, m_id);
    }
}
