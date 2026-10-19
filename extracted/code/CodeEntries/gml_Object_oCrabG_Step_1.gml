if (elite == 1)
{
    if (image_blend == c_white && not_client() == 1)
    {
        image_blend = choose(c_orange, c_yellow, #87D6DA, c_red);
    }
    elite = 2;
    hp *= 2.1;
    maxhp *= 2.1;
    damage *= 1.3;
    switch (image_blend)
    {
        case c_yellow:
            attack_speed = 1.5;
            pHmax *= 2;
            break;
        case #87D6DA:
            lightning = 1;
            max_spawns = 7;
            spawns = 7;
            break;
        case c_orange:
            max_spawns = 2;
            spawns = 2;
            break;
    }
}
