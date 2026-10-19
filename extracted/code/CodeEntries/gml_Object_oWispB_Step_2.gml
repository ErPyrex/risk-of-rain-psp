activity_wispB();
for (i = 0; i <= ceil((xprevious - x) / 24); i += 1)
{
    if (xprevious != x)
    {
        s = instance_create(x + (i * ceil((xprevious - x) / 14)), y - 30, oFireTrail);
        s.team = team;
        damage_default(s, 0.35);
        s.sprite_index = sEfFireTrail2;
        with (s)
        {
            if (place_meeting(x, y, oFireTrail) == 1)
            {
                instance_destroy();
            }
        }
    }
}
step_boss(0);
step_wispB();
step_ai_default();
