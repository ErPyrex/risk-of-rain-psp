if (elite == 1)
{
    if (image_blend == c_white && not_client() == 1)
    {
        image_blend = choose(c_orange, c_yellow, #87D6DA);
    }
    elite = 2;
    hp *= 2.1;
    maxhp *= 2.1;
    damage *= 1.3;
    switch (image_blend)
    {
        case c_yellow:
            attack_speed = 1.5;
            pHmax *= 1.3;
            break;
        case #87D6DA:
            lightning = 1;
            break;
        case c_orange:
            explosive_shot = 1;
            break;
    }
}
