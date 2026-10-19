with (instance_create(x, y, oEfCircle))
{
    image_blend = #7EB686;
    radius = 12;
}
with (pFriend)
{
    if (point_distance(x, y, other.x, other.y) < 50)
    {
        with (instance_create(x, y, oEfDamage))
        {
            team = "heal";
            damage = ceil(other.maxhp * 0.3);
        }
        hp += (maxhp * 0.3);
    }
}
