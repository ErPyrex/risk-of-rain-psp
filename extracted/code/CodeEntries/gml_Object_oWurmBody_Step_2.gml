if (lastHp > hp && instance_exists(head))
{
    caster_play(171, global.volume * 0.8, 1);
    head.hp += hp - lastHp;
    lastHp = hp;
}
