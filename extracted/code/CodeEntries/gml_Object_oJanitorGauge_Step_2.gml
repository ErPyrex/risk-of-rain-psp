if (instance_exists(parent) == 1)
{
    steam -= 0.5;
    if (steam <= 0)
    {
        instance_destroy();
    }
    parent.alarm[4] = parent.skill[2, 2] * (1 - parent.cdr);
}
else
{
    instance_destroy();
}
