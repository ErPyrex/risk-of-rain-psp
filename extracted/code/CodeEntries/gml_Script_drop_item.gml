var tyo = 0;
if (oInit.coop != 2 || global.host)
{
    ds_list_shuffle(oDirectorControl.use_list);
    ds_list_shuffle(oDirectorControl.tier1_list);
    ds_list_shuffle(oDirectorControl.tier2_list);
    ds_list_shuffle(oDirectorControl.tier3_list);
    var use, tier3, tier1, tier2;
    if (!global.artifact_command)
    {
        if (!global.artifact_use)
        {
            use = ds_list_find_value(oDirectorControl.use_list, 0);
        }
        else
        {
            use = 457;
        }
        tier1 = ds_list_find_value(oDirectorControl.tier1_list, 0);
        tier2 = ds_list_find_value(oDirectorControl.tier2_list, 0);
        tier3 = ds_list_find_value(oDirectorControl.tier3_list, 0);
    }
    else
    {
        tyo = 20;
        if (!global.artifact_use)
        {
            use = 461;
        }
        else
        {
            use = 457;
        }
        tier1 = 458;
        tier2 = 459;
        tier3 = 460;
    }
    i = irandom(100);
    switch (argument0)
    {
        case 0.3:
            if (i <= 15)
            {
                instance_create(x, (y - 20) + tyo, use);
            }
            break;
        case 0.1:
            if (i <= 2)
            {
                instance_create(x, (y - 20) + tyo, tier3);
            }
            else if (i <= 15)
            {
                instance_create(x, (y - 20) + tyo, use);
            }
            else if (i > 15 && i <= 30)
            {
                instance_create(x, (y - 20) + tyo, tier3);
            }
            else if (i > 30 && i <= 55)
            {
                instance_create(x, (y - 20) + tyo, tier1);
            }
            else if (i > 55 && i <= 70)
            {
                repeat (irandom_range(12, 14))
                {
                    s = instance_create(x, y - 30, oEfExp);
                    s.direction = random(360);
                    s.speed = random_range(1, 3);
                    s.sprite_index = sEfExp2;
                    s.value = 6;
                    return 1;
                }
            }
            else
            {
                return 1;
            }
            break;
        case 0.2:
            if (i <= 2)
            {
                for (i = -1; i <= 1; i += 2)
                {
                    instance_create(x + (i * 15), (y - 20) + tyo, tier3);
                }
            }
            else if (i <= 17)
            {
                for (i = -1; i <= 1; i += 2)
                {
                    instance_create(x + (i * 15), (y - 20) + tyo, tier2);
                }
            }
            else if (i > 17 && i <= 55)
            {
                for (i = -1; i <= 1; i += 2)
                {
                    instance_create(x + (i * 15), (y - 20) + tyo, tier1);
                }
            }
            else if (i > 55 && i <= 70)
            {
                repeat (irandom_range(2, 4))
                {
                    s = instance_create(x, y - 30, oEfExp);
                    s.direction = random(360);
                    s.speed = random_range(1, 3);
                    s.sprite_index = sEfExp2;
                    s.value = 6;
                    return 1;
                }
            }
            else
            {
                return 1;
            }
            break;
        case 0:
            if (i <= 2)
            {
                instance_create(x, (y - 20) + tyo, tier3);
            }
            else if (i <= 15)
            {
                instance_create(x, (y - 20) + tyo, use);
            }
            else if (i > 15 && i <= 30)
            {
                instance_create(x, (y - 20) + tyo, tier2);
            }
            else if (i > 30 && i <= 55)
            {
                instance_create(x, (y - 20) + tyo, tier1);
            }
            else if (i > 55 && i <= 70)
            {
                repeat (irandom_range(2, 4))
                {
                    s = instance_create(x, y - 30, oEfExp);
                    s.direction = random(360);
                    s.speed = random_range(1, 3);
                    s.sprite_index = sEfExp2;
                    s.value = 6;
                    return 1;
                }
            }
            else
            {
                return 1;
            }
            break;
        case 1:
            if (i <= 1)
            {
                instance_create(x, (y - 20) + tyo, tier3);
            }
            else if (i <= 15)
            {
                instance_create(x, (y - 20) + tyo, use);
            }
            else if (i > 15 && i <= 30)
            {
                instance_create(x, (y - 20) + tyo, tier2);
            }
            else
            {
                instance_create(x, (y - 20) + tyo, tier1);
            }
            break;
        case 2:
            if (i <= 20)
            {
                instance_create(x, (y - 20) + tyo, tier3);
            }
            else
            {
                instance_create(x, (y - 20) + tyo, tier2);
            }
            break;
        case 3:
            instance_create(x, (y - 20) + tyo, tier3);
            break;
    }
    return 0;
}
return 0;
