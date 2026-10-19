dot_immune = max(0, dot_immune - 1);
if (white_alpha != 0)
{
    white_alpha = max(0, white_alpha - 0.1);
}
if (elite == 1)
{
    if (image_blend == c_white)
    {
        image_blend = choose(c_orange, c_yellow, #87D6DA, c_red);
    }
    elite = 2;
    hp *= 2.8;
    maxhp *= 2.8;
    damage *= 1.3;
    switch (image_blend)
    {
        case c_yellow:
            attack_speed = 1.5;
            max_speed *= 2;
            break;
        case #87D6DA:
            lightning = 1;
            break;
        case c_orange:
            max_bullets = 10;
            bullets = 10;
            break;
    }
}
