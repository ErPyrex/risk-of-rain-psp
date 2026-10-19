blast = -1;
if (argument0 == 1)
{
    elite = 2;
    if (elite_tier <= 9)
    {
        if (!global.artifact_elite)
        {
            hp *= 2.6;
            maxhp *= 2.6;
        }
        else
        {
            hp *= 1.5;
            maxhp *= 1.5;
        }
        cdr = 0.3;
        damage *= 1.7;
        knockback_cap *= 3;
        switch (elite_tier)
        {
            case 0:
                image_blend = c_red;
                fire_trail = 0.1;
                break;
            case 1:
                image_blend = c_yellow;
                attack_speed = 1.3;
                pHmax *= 1.25;
                break;
            case 2:
                image_blend = c_green;
                lifesteal = 20;
                break;
            case 3:
                image_blend = #87D6DA;
                lightning = 1;
                break;
            case 4:
                image_blend = c_orange;
                explosive_shot = 1;
                break;
            case 5:
                image_blend = #F3A556;
                explosive_shot = 2;
                break;
            case 6:
                image_blend = #7C88B8;
                lightning = 2;
                break;
            case 7:
                image_blend = #7EB686;
                lifesteal = 35;
                break;
            case 8:
                image_blend = #EFD27B;
                attack_speed = 1.3;
                pHmax *= 1.25;
                break;
            case 9:
                image_blend = #CF6666;
                fire_trail = 0.5;
                pHmax *= 1.2;
                break;
        }
    }
    else
    {
        image_blend = c_black;
        hp *= 7;
        maxhp *= 7;
        cdr = 0.5;
        damage *= 3.2;
        pHmax *= 1.1;
        knockback_cap *= 15;
        if ((elite_tier % 3) == 0)
        {
            fire_trail = 0.1;
        }
        if ((elite_tier % 5) == 0)
        {
            attack_speed = 1.3;
            pHmax *= 1.25;
        }
        if ((elite_tier % 7) == 0)
        {
            lifesteal = 50;
        }
        if ((elite_tier % 11) == 0)
        {
            lightning = 2;
        }
        if ((elite_tier % 13) == 0)
        {
            explosive_shot = 2;
        }
    }
}
