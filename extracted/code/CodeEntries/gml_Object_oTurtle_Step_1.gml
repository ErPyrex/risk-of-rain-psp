if (elite == 1)
{
    if (image_blend == c_white && not_client() == 1)
    {
        image_blend = #87D6DA;
    }
    elite = 2;
    hp *= 2.1;
    maxhp *= 2.1;
    damage *= 1.3;
    switch (image_blend)
    {
        case #87D6DA:
            lightning = 1;
            bullets_cooldown = 90;
            max_bullets = 3;
            break;
        case c_orange:
            break;
    }
}
