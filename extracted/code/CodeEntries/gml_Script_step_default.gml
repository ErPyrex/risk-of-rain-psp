if (image_xscale == 0)
{
    image_xscale = 1;
}
whip_cd = max(0, whip_cd - 1);
if (disable_ai == 1)
{
    exit;
}
if (poison_speed_boost == 1)
{
    pHmax += 0.4;
    poison_speed_boost = -1;
    if (global.graphics >= 2 && random(100) < 20)
    {
        part_particles_create(global.below, x, (y - 5) + random(10), global.pSpeedPoison, 1);
    }
}
if (whip != 0 && whip_cd == 0)
{
    pHmax += 0.6;
    if (random(100) < 65 && global.graphics >= 2 && pHspeed != 0)
    {
        part_particles_create(global.below, x, (y - 5) + random(10), global.pSpeed, 1);
    }
}
instance_activate_region(x - (view_wview[0] / 2) - 200, y - (view_hview[0] / 2), x + (view_wview[0] / 2) + 200, y + (view_hview[0] / 2), true);
for (i = 0; i < buff_count; i += 1)
{
    buff[i, 1] -= 1;
    if (buff[i, 1] == 0)
    {
        buff_count -= 1;
        if (buff[i, 0] == 8)
        {
            armor -= 100;
        }
        if (buff[i, 0] == 29)
        {
            armor = 10;
            attack_speed = 1;
        }
        if (buff[i, 0] == 10)
        {
            attack_speed -= 0.4;
            damage -= 4;
            pHmax -= 0.3;
        }
        if (buff[i, 0] == 28)
        {
            attack_speed -= 0.4;
        }
        if (buff[i, 0] >= 11 && buff[i, 0] <= 16)
        {
            critical_chance -= ((5 + (3 * (dice - 1))) * (buff[i, 0] - 10));
        }
        if (buff[i, 0] >= 20 && buff[i, 0] <= 24)
        {
            armor += (5 * (buff[i, 0] - 19));
        }
        if (buff[i, 0] >= 25 && buff[i, 0] <= 27)
        {
            attack_speed -= ((10 + wolfblood) * 0.01 * (buff[i, 0] - 24));
        }
        for (t = i; t < buff_count; t += 1)
        {
            buff[t, 0] = buff[t + 1, 0];
            buff[t, 1] = buff[t + 1, 1];
        }
        buff[buff_count + 1, 0] = -1;
        buff[buff_count + 1, 1] = -1;
        i -= 1;
    }
    else
    {
        switch (buff[i, 0])
        {
            case 32:
                instance_create(x, y - 4, oChefOil);
                buff_oil = 1;
                pHmax += 0.4;
                break;
            case 31:
                if (!stun_immune)
                {
                    pHmax -= 0.9;
                }
                break;
            case 19:
                poison_trail += 1;
                break;
            case 18:
                pHmax += 10;
                break;
            case 1:
                if (!stun_immune)
                {
                    pHmax -= 0.5;
                }
                break;
            case 7:
                if (!stun_immune)
                {
                    pHmax -= 0.8;
                }
                break;
            case 5:
                pHmax += min(1 * buff[i, 1] * 0.016666666666666666, 1);
                break;
            case 30:
                pHmax += min(2 * buff[i, 1] * 0.016666666666666666, 1);
                break;
            case 6:
                if (((buff[i, 1] + 1) / 60) == round((buff[i, 1] + 1) / 60))
                {
                    if (global.graphics == 3)
                    {
                        with (instance_create(x, y, oEfFlash))
                        {
                            parent = other.id;
                            image_blend = #7EB686;
                        }
                    }
                    hp += (maxhp * 0.05);
                    f = instance_create(x + 5, y - 10, oEfDamage);
                    f.damage = floor(maxhp * 0.05);
                    f.team = "heal";
                }
                break;
            case 0:
                pHmax += 0.3;
                fire_trail += 0.5;
                break;
            case 8:
                break;
            case 9:
                pHmax -= (1.5 * (1 - (buff[i, 1] / 180)));
                if (((buff[i, 1] + 1) / 30) == round((buff[i, 1] + 1) / 30))
                {
                    hp -= (damage * 0.6 * (1 - (buff[i, 1] / 180)));
                    f = instance_create(x + 5, y - 10, oEfDamage);
                    f.damage = ceil(damage * 3 * (1 - (buff[i, 1] / 180)));
                    f.textColor = 8388736;
                }
                break;
            case 17:
                pHmax -= 200;
                break;
            case 10:
                if (((buff[i, 1] + 1) / 60) == round((buff[i, 1] + 1) / 60))
                {
                    hp += (maxhp * 0.01);
                    f = instance_create(x + 5, y - 10, oEfDamage);
                    f.damage = floor(maxhp * 0.01);
                    f.team = "heal";
                }
                break;
        }
    }
}
hp = min(hp, maxhp);
dot_immune = max(0, dot_immune - 1);
invincible = max(0, invincible - 1);
if (free == 0 && activity != 30 && inside_view(x, y) == 1)
{
    if (fire_trail != 0)
    {
        for (i = 0; i <= ceil((xprevious - x) / 24); i += 1)
        {
            if (instance_place(x, y, oFireTrail) == -4)
            {
                s = instance_create(x + (i * ceil((xprevious - x) / 14)), y, oFireTrail);
                s.team = team;
                damage_default(s, 0.35 + (0.2 * (fire_trail - 1)));
            }
        }
    }
    if (poison_trail != 0)
    {
        for (i = 0; i <= ceil((xprevious - x) / 24); i += 1)
        {
            var ti = instance_place(x, y + 2, oPoisonTrail);
            if (ti == -4)
            {
                s = instance_create(x + (i * ceil((xprevious - x) / 14)), y, oPoisonTrail);
                s.team = team;
                damage_default(s, 0.9);
            }
            else
            {
                ti.alarm[1] = 780;
            }
        }
    }
}
if (global.time_stop == 0 || object_index == oP)
{
    move();
}
else
{
    image_speed = 0;
}
for (i = 0; i < buff_count; i += 1)
{
    switch (buff[i, 0])
    {
        case 29:
            break;
        case 32:
            buff_oil = 0;
            pHmax -= 0.4;
            break;
        case 31:
            if (!stun_immune)
            {
                pHmax += 0.9;
            }
            break;
        case 19:
            poison_trail -= 1;
            break;
        case 18:
            pHmax -= 10;
            break;
        case 1:
            if (!stun_immune)
            {
                pHmax += 0.5;
            }
            break;
        case 7:
            if (!stun_immune)
            {
                pHmax += 0.8;
            }
            break;
        case 5:
            pHmax -= min(1 * buff[i, 1] * 0.016666666666666666, 1);
            break;
        case 30:
            pHmax -= min(2 * buff[i, 1] * 0.016666666666666666, 1);
            break;
        case 0:
            pHmax -= 0.3;
            fire_trail -= 0.5;
            break;
        case 8:
            break;
        case 9:
            pHmax += (1.5 * (1 - (buff[i, 1] / 180)));
            break;
        case 17:
            pHmax += 200;
            break;
    }
}
if (poison_speed_boost == -1)
{
    pHmax -= 0.4;
    poison_speed_boost = 0;
}
if (whip != 0 && whip_cd == 0)
{
    pHmax -= 0.6;
}
if (lastHp > hp || z_skill || x_skill || c_skill || v_skill)
{
    whip_cd = 120;
}
