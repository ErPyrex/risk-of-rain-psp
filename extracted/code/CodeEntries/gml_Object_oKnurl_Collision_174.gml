if (alarm[0] == -1 && used == 0)
{
    other.maxhp_base += 40;
    other.hp += 40;
    other.hp_regen += 0.02;
    other.armor += 5;
    used = 1;
    collide_item();
}
