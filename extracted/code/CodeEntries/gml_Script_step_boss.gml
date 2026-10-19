elite_tier = elite_tier_from_blend(image_blend);
if (ceil((hp / maxhp) * 10) < health_tier && oInit.coop == 2)
{
    health_tier -= 1;
    server_message_send(0, 38, object_index, m_id, ceil(hp));
}
if (oHUD.boss != 1)
{
    if (argument0 == 0)
    {
        oHUD.boss_hp_color = 4802996;
    }
    if (argument0 == 2)
    {
        oHUD.boss_hp_color = 10833558;
    }
    oHUD.boss = 1;
    oHUD.boss_id = id;
    oHUD.boss_hp = hp;
    oHUD.boss_maxhp = maxhp;
    oHUD.boss_text2 = name2;
}
else if (oHUD.boss_id == id)
{
    switch (image_blend)
    {
        case c_orange:
            oHUD.boss_text1 = "Volatile " + name;
            break;
        case #F3A556:
            oHUD.boss_text1 = "Volatile " + name;
            break;
        case c_yellow:
            oHUD.boss_text1 = "Frenzied " + name;
            break;
        case #EFD27B:
            oHUD.boss_text1 = "Frenzied " + name;
            break;
        case #87D6DA:
            oHUD.boss_text1 = "Overloading " + name;
            break;
        case #7C88B8:
            oHUD.boss_text1 = "Overloading " + name;
            break;
        case #DB4A31:
            oHUD.boss_text1 = "Blazing " + name;
            break;
        case c_red:
            oHUD.boss_text1 = "Blazing " + name;
            break;
        case #CF6666:
            oHUD.boss_text1 = "Blazing " + name;
            break;
        case c_green:
            oHUD.boss_text1 = "Leeching " + name;
            break;
        case #7EB686:
            oHUD.boss_text1 = "Leeching " + name;
            break;
        case c_black:
            oHUD.boss_text1 = "Blighted " + name;
            break;
        default:
            oHUD.boss_text1 = name;
            break;
    }
    oHUD.boss_hp = hp;
    oHUD.boss_maxhp = maxhp;
}
