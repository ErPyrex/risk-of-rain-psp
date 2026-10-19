moveUp = 0;
if (elite == 1)
{
    if (image_blend == c_white && not_client() == 1)
    {
        image_blend = choose(c_orange, c_yellow, c_red);
    }
    elite = 2;
    hp *= 2.1;
    maxhp *= 2.1;
    damage *= 1.3;
    switch (image_blend)
    {
        case c_yellow:
            attack_speed = 2;
            pHmax *= 1.3;
            break;
        case c_orange:
            max_bullets = 8;
            break;
    }
}
