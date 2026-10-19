if (landed == 0)
{
    angle += 3;
    if (place_meeting(x, y, pBlock) == 1)
    {
        alarm[0] = 300;
        image_speed = 0;
        x = xprevious;
        y = yprevious;
        speed = 0;
        gravity = 0;
        move_contact_solid(direction, -1);
        sprite_index = sEfNuggetIdle;
        landed = 1;
        if (get_collision(x, y + 3) > 0)
        {
            angle = 0;
        }
        else if (get_collision(x, y - 3) > 0)
        {
            angle = 180;
        }
        else if (get_collision(x + 3, y) > 0)
        {
            angle = 90;
        }
        else
        {
            angle = 270;
        }
        move_contact_solid(angle - 90, -1);
    }
}
