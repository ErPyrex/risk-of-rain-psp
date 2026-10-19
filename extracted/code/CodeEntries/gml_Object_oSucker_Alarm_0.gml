if (!instance_exists(master))
{
    exit;
}
if (abs(master.x - x) > tether_range)
{
    if (master.x < x)
    {
        moveLeft = 1;
        moveRight = 0;
    }
    else
    {
        moveRight = 1;
        moveLeft = 0;
    }
}
else
{
    moveLeft = 1 * (random(100) < 5);
    moveRight = 1 * (random(100) < 5);
}
alarm[0] = random_range(5, 40);
if (point_distance(x, y, master.x, master.y) > 150 && master.activity != 30 && master.free == 0)
{
    with (instance_create(x, y, oEfFlash))
    {
        parent = other.id;
    }
    y = master.y - 1;
    x = master.x;
}
if (place_meeting(x + (3 * image_xscale), y - 3, pBlock) == 1)
{
    moveUp = 1;
}
else
{
    moveUp = 0;
}
