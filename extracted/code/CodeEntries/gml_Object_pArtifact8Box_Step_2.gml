var tcount;
switch (object_index)
{
    case oArtifact8Box1:
        tcount = global.director.tier1_count;
        break;
    case oArtifact8Box2:
        tcount = global.director.tier2_count;
        break;
    case oArtifact8Box3:
        tcount = global.director.tier3_count;
        break;
    case oArtifact8BoxUse:
        tcount = global.director.use_count;
        break;
}
select_cd = max(0, select_cd - 1);
switch (active)
{
    case 1:
        fade_alpha = min(fade_alpha + 0.03, 0.3);
        break;
    case 2:
        fade_alpha = max(fade_alpha - 0.03, 0);
        if (fade_alpha == 0)
        {
            instance_destroy();
        }
        break;
    case 3:
        fade_alpha = max(fade_alpha - 0.03, 0);
        if (instance_exists(owner))
        {
            with (owner)
            {
                activity_type = 0;
                activity = 0;
            }
        }
        if (fade_alpha == 0)
        {
            if (oInit.coop != 2 || (global.host && owner == global.my_player))
            {
                switch (type)
                {
                    case 1:
                        instance_create(x, y - 24, global.director.item_tier1[selection, 0]);
                        break;
                    case 2:
                        instance_create(x, y - 24, global.director.item_tier2[selection, 0]);
                        break;
                    case 3:
                        instance_create(x, y - 24, global.director.item_tier3[selection, 0]);
                        break;
                    case 4:
                        instance_create(x, y - 24, global.director.item_use[selection, 0]);
                        break;
                }
            }
            else if (owner == global.my_player && oInit.coop == 2)
            {
                switch (type)
                {
                    case 1:
                        client_message_send(46, x, y - 24, global.director.item_tier1[selection, 0]);
                        break;
                    case 2:
                        client_message_send(46, x, y - 24, global.director.item_tier2[selection, 0]);
                        break;
                    case 3:
                        client_message_send(46, x, y - 24, global.director.item_tier3[selection, 0]);
                        break;
                    case 4:
                        client_message_send(46, x, y - 24, global.director.item_use[selection, 0]);
                        break;
                }
            }
            instance_destroy();
        }
        break;
}
if (active == 1)
{
    if (instance_exists(owner))
    {
        with (owner)
        {
            if (!dead)
            {
                switch (other.active)
                {
                    case 1:
                        moveLeft = 0;
                        moveRight = 0;
                        pHspeed = 0;
                        activity_type = 1;
                        activity = 95;
                        if (other.select_cd == 0)
                        {
                            if (control(global.left_key, 1, 0) == 1)
                            {
                                other.selection -= 1;
                                other.select_cd = 10;
                            }
                            if (control(global.right_key, 2, 0) == 1)
                            {
                                other.selection += 1;
                                other.select_cd = 10;
                            }
                            if (control(global.up_key, 3, 0) == 1)
                            {
                                if (other.selection >= 10)
                                {
                                    other.selection -= 10;
                                }
                                other.select_cd = 10;
                            }
                            if (control(global.down_key, 4, 0) == 1)
                            {
                                if (other.selection <= (tcount - 9))
                                {
                                    other.selection += 10;
                                }
                                other.select_cd = 10;
                            }
                        }
                        if (control(global.yes_key, 11, 1) == 1 && other.alarm[0] == -1)
                        {
                            with (other)
                            {
                                active = 3;
                                if (oInit.coop == 2)
                                {
                                    client_message_send(19, other.x, other.y, object_index, m_id, 3);
                                    server_message_send(0, 19, other.object_index, other.m_id, other.x, other.y, object_index, m_id, 3, 1);
                                }
                            }
                        }
                        break;
                    case 3:
                        break;
                }
            }
            else
            {
                other.active = 2;
            }
        }
    }
    else
    {
        active = 2;
    }
}
switch (type)
{
    case 1:
        count = global.director.tier1_count;
        break;
    case 2:
        count = global.director.tier2_count;
        break;
    case 3:
        count = global.director.tier3_count;
        break;
    case 4:
        count = global.director.use_count;
        break;
}
selection = min(max(0, selection), count);
