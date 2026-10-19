for (i = 0; i < 2; i++)
{
    for (s = 0; s < 7; s++)
    {
        CreateCollision(x + (i * 16), y - (s * 16), get_collision(x + (i * 16), y - (s * 16)) - 1);
    }
}
