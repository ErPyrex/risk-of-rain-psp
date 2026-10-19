if (jelly == 0)
{
    s = instance_create(x, y, oEfMissile);
    s.sync = sync;
    s.team = parent.team + "proc";
    s.damage = parent.damage * co;
    s.parent = parent;
    alarm[0] = 8;
    bullets -= 1;
    if (bullets == 0)
    {
        instance_destroy();
    }
}
else
{
    s = instance_create(x, y, oJellyMissileFriendly);
    s.damage = parent.damage * co;
    s.parent = parent.id;
    s.team = parent.team + "proc";
    s.critical = 0;
    s.alarm[0] = 60;
    alarm[0] = 8;
    bullets -= 1;
    if (bullets == 0)
    {
        instance_destroy();
    }
}
