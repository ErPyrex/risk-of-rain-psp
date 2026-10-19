alarm[0] = 60;
if (global.time_stop == 0)
{
    time_start += 1;
    var tpoints = 2 + (floor(((min(global.diff_level - 0.2, 1) * time_start) / 69) * max(1, power(players_alive(), 1.1))) * max(1, 1.7 * (global.diff_level == 3)));
    points += tpoints;
    oHUD.second += 1;
}
var tlive = 0;
with (oP)
{
    if (dead == 0)
    {
        tlive = 1;
    }
}
if (oHUD.minute == 40 && tlive)
{
    achievement_progress(8, 1);
}
if ((time_start / 60) == round(time_start / 60))
{
    if (global.artifact_imp && ((time_start / 60) % 10) == 0 && (oInit.coop != 2 || global.host))
    {
        with (instance_find(oP, random(instance_number(oP) - 1)))
        {
            instance_create(x, y - 32, oImpPortal);
        }
    }
    with (oP)
    {
        if (global.artifact_lock && (oInit.coop != 2 || global.my_player == id) && !dead)
        {
            if (class != 8)
            {
                artifact_lock_choice = irandom(3);
            }
            else
            {
                artifact_lock_choice = irandom(2) + 1;
            }
            if (oInit.coop != 1)
            {
                with (instance_create(x, y, oArtifactSkillFlash))
                {
                    target_x = ((view_wview[0] / 2) - 46) + (other.artifact_lock_choice * 23);
                    target_y = view_hview[0] - 64;
                }
            }
        }
    }
    if (oInit.coop != 2)
    {
        switch (global.diff_level)
        {
            case 1:
                global.enemy_buff += 0.06;
                break;
            case 2:
                global.enemy_buff += 0.12;
                break;
            case 3:
                global.enemy_buff += 0.16;
                break;
        }
    }
    else if (global.host)
    {
        switch (global.diff_level)
        {
            case 1:
                global.enemy_buff += (0.008 * players_alive());
                break;
            case 2:
                global.enemy_buff += (0.017 * players_alive());
                break;
            case 3:
                global.enemy_buff += (0.022 * players_alive());
                break;
        }
        server_message_send(0, 34, 0, 0, global.enemy_buff, oHUD.minute, oHUD.second);
    }
}
