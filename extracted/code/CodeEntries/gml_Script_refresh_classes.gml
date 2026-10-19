refresh_players();
with (oSelectMult)
{
    for (i = -5; i <= 6; i += 1)
    {
        char_sprite[i + 5, 2] = 0;
        for (t = 1; t <= instance_number(oPrePlayer); t += 1)
        {
            if (instance_find(oPrePlayer, t - 1).class == (i + 5))
            {
                char_sprite[i + 5, 2] += 1;
            }
        }
    }
}
