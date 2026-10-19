with (parent)
{
    fire_explosion(0, other.target.x, other.target.y, skill[3, 5], 292, 2, 155, 3, 3);
}
repeat (12)
{
    with (instance_create(target.x, target.y, oHuntressGrenade))
    {
        image_blend = #CF6666;
        parent = other.parent;
        team = other.team;
        scepter = other.scepter;
    }
}
