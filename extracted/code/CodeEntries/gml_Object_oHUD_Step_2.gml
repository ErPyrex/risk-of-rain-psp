graphics_cd = max(0, graphics_cd - 1);
if (global.time_stop == 0)
{
    audio_stop_sound(wWatch);
    if (global.music_id != -1)
    {
        audio_resume_sound(global.music_id);
    }
}
if (instance_exists(boss_id) == 0)
{
    boss = -1;
}
if (oP.use[0] != -1 && tutorial_use == 0 && oInit.coop == 1)
{
    tutorial_use = 1;
    alarm[2] = 420;
}
if (alarm[0] != -1)
{
    shake = 2;
}
else
{
    shake = 0;
}
for (i = 0; i < oInit.player_max_chosen; i += 1)
{
    if (round(hpLast[i]) != round(oInit.player[i + 1, 2].hp) && hpRecedeTimer[i] == -1)
    {
        hpRecedeTimer[i] = 45;
    }
    if (hpRecedeTimer[i] != -1)
    {
        hpRecedeTimer[i] = max(hpRecedeTimer[i] - 1, 0);
    }
    if (hpRecedeTimer[i] == 0)
    {
        hpLast[i] = max(oInit.player[i + 1, 2].hp, hpLast[i] - 1);
        if (round(oInit.player[i + 1, 2].hp) == round(hpLast[i]))
        {
            hpRecedeTimer[i] = -1;
        }
    }
}
ssecond = string(second);
sminute = string(minute);
shour = string(hour);
if (second >= 60)
{
    second = 0;
    minute += 1;
}
if (string_length(ssecond) == 1)
{
    ssecond = "0" + ssecond;
}
if (string_length(sminute) == 1)
{
    sminute = "0" + sminute;
}
var dd = difficulty;
switch (floor(minute / (9 / global.diff_level)))
{
    case 0:
        difficulty = "Very Easy";
        break;
    case 1:
        difficulty = "Easy";
        break;
    case 2:
        difficulty = "Medium";
        break;
    case 3:
        difficulty = "Hard";
        break;
    case 4:
        difficulty = "Very Hard";
        break;
    case 5:
        difficulty = "Insane";
        break;
    case 6:
        difficulty = "Impossible";
        break;
    case 7:
        difficulty = "I SEE YOU";
        break;
    case 8:
        difficulty = "IM COMING FOR YOU";
        break;
    case 9:
        difficulty = "HAHAHAHA";
        break;
}
if (dd != difficulty)
{
    caster_play(68, global.volume, 1);
    white_glow = 1;
}
white_glow = max(0, white_glow - 0.006);
