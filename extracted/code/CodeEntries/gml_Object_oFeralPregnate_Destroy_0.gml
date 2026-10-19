if (instance_exists(parent))
{
    if (object_get_parent(parent) != 323)
    {
        parent.hp = 0;
        with (instance_create(parent.x, parent.y - sprite_get_yoffset(parent.sprite_idle) - 1, oEfDamage))
        {
            damage = ceil(other.parent.maxhp);
            team = "player";
        }
    }
}
repeat (area / 50)
{
    with (instance_create(x, y, oFeralNugget))
    {
        value = 5;
    }
}
if (instance_exists(master))
{
    master.hp = min(((area / 3000) * master.maxhp) + master.hp, master.maxhp);
    f = instance_create(x + 5, y - 10, oEfDamage);
    f.damage = min(ceil((area / 3000) * master.maxhp), master.maxhp);
    f.team = "heal";
}
