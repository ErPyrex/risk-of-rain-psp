with (parent)
{
    fire_explosion(0, other.target.x, other.target.y, skill[3, 5], 292, 2, 155, 3, 3);
}
repeat (6)
{
    with (instance_create(target.x, target.y, oHuntressGrenade))
    {
        parent = other.parent;
        team = other.team;
    }
}
