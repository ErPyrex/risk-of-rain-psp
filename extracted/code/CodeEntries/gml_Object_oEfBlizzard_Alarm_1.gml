alarm[1] = 20;
with (pEnemyClassic)
{
    if (inside_view(x, y) == 1 && random(100) < 20)
    {
        frozen = 1;
        alarm[7] = 90;
        apply_buff(id, 7, 180);
    }
}
