if (landed == 0)
{
    angle += 3;
    if (place_meeting(x, y, pBlock) == 1)
    {
        image_speed = 0;
        x = xprevious;
        y = yprevious;
        speed = 0;
        gravity = 0;
        move_contact_solid(direction, -1);
        sprite_index = sEfNuggetIdle;
        landed = 1;
        if (place_meeting(x, y + 1, pBlock) == 1)
        {
            angle = 0;
        }
        else if (place_meeting(x, y - 1, pBlock) == 1)
        {
            angle = 180;
        }
        else if (place_meeting(x + 1, y, pBlock) == 1)
        {
            angle = 90;
        }
        else
        {
            angle = 270;
        }
        move_contact_solid(angle - 90, -1);
        sprite_index = sFeral2Splat;
        image_index = random(4);
        image_speed = 0;
    }
}
