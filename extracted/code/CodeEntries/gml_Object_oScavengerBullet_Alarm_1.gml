if (instance_exists(parent))
{
    with (parent)
    {
        t = instance_create(other.x, other.y + 15, oChainLightning);
        t.team = team + "proc";
        t.damage = ceil(damage / 3) * (other.critical + 1);
        t.critical = other.critical;
    }
}
alarm[1] = 5;
