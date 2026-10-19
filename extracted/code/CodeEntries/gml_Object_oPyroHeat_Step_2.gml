if (instance_exists(oP))
{
    x = round(oP.x);
    y = round(oP.y) - 20;
    heat_cd = max(0, heat_cd - 1);
    if (heat_cd == 0)
    {
        heat = max(0, heat - 0.5);
        image_index = 0;
    }
}
else
{
    instance_destroy();
}
