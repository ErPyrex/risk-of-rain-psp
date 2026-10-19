alarm[0] = 60;
with (oP)
{
    if (place_meeting(x, y, other) == 1)
    {
        hp += other.value;
        f = instance_create(x + 5, y - 10, oEfDamage);
        f.damage = other.value;
        f.team = "heal";
    }
}
