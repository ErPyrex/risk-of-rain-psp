if (alarm[0] == -1 && used == 0)
{
    other.hero[3] += 1;
    other.hp = max(other.hp, other.maxhp * 0.35);
    used = 1;
    collide_item();
}
