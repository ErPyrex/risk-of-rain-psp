text1_length = string_length(text1);
text2_length = string_length(text2);
if (alarm[0] == -1)
{
    if (text_current == 1)
    {
        alarm[0] = 4;
        text1_pos += 1;
        if (text1_pos >= text1_length)
        {
            text_current = 2;
            alarm[0] = 60;
        }
        else
        {
            caster_play(41, global.volume, 1);
        }
    }
    else if (text_current == 2)
    {
        alarm[0] = 4;
        text2_pos += 1;
        if (text2_pos >= text2_length)
        {
            text_current = 3;
            alarm[0] = 60;
        }
        else
        {
            caster_play(41, global.volume, 1);
        }
    }
}
