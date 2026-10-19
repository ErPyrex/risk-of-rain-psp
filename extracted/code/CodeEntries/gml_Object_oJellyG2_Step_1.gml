dot_immune = max(0, dot_immune - 1);
if (elite == 1)
{
    if (image_blend == c_white)
    {
        image_blend = choose(c_orange, c_yellow, #87D6DA, #CF6666);
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
            max_bullets = 5;
            bullets = 5;
            break;
    }
}
