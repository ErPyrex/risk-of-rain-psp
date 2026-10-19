expyy = 0;
maxexp *= 1.55;
level += 1;
switch (class)
{
    case 1:
        armor += 2;
        maxhp += ((1 - (global.artifact_glass * 0.75)) * 32);
        maxhp_base += ((1 - (global.artifact_glass * 0.75)) * 32);
        hp += ((1 - (global.artifact_glass * 0.75)) * 32);
        damage += (((global.artifact_glass * 4) + 1) * 3);
        hp_regen += 0.002;
        break;
    case 2:
        armor += 2;
        maxhp += ((1 - (global.artifact_glass * 0.75)) * 34);
        maxhp_base += ((1 - (global.artifact_glass * 0.75)) * 34);
        hp += ((1 - (global.artifact_glass * 0.75)) * 34);
        damage += (((global.artifact_glass * 4) + 1) * 3);
        hp_regen += 0.002;
        break;
    case 3:
        armor += 2;
        maxhp += ((1 - (global.artifact_glass * 0.75)) * 34);
        hp += ((1 - (global.artifact_glass * 0.75)) * 34);
        maxhp_base += ((1 - (global.artifact_glass * 0.75)) * 34);
        damage += (((global.artifact_glass * 4) + 1) * 3.5);
        hp_regen += 0.0025;
        critical_chance += 0.015;
        break;
    case 4:
        armor += 2;
        maxhp += ((1 - (global.artifact_glass * 0.75)) * 32);
        maxhp_base += ((1 - (global.artifact_glass * 0.75)) * 32);
        hp += ((1 - (global.artifact_glass * 0.75)) * 32);
        damage += (((global.artifact_glass * 4) + 1) * 3);
        hp_regen += 0.002;
        attack_speed += 0.025;
        break;
    case 5:
        armor += 3;
        maxhp += ((1 - (global.artifact_glass * 0.75)) * 44);
        hp += ((1 - (global.artifact_glass * 0.75)) * 44);
        maxhp_base += ((1 - (global.artifact_glass * 0.75)) * 44);
        damage += (((global.artifact_glass * 4) + 1) * 3);
        hp_regen += 0.003;
        break;
    case 6:
        armor += 2;
        maxhp += ((1 - (global.artifact_glass * 0.75)) * 34);
        maxhp_base += ((1 - (global.artifact_glass * 0.75)) * 34);
        hp += ((1 - (global.artifact_glass * 0.75)) * 34);
        damage += (((global.artifact_glass * 4) + 1) * 3);
        hp_regen += 0.003;
        break;
    case 7:
        armor += 3;
        maxhp += ((1 - (global.artifact_glass * 0.75)) * 36);
        maxhp_base += ((1 - (global.artifact_glass * 0.75)) * 36);
        hp += ((1 - (global.artifact_glass * 0.75)) * 36);
        damage += (((global.artifact_glass * 4) + 1) * 3.2);
        attack_speed += 0.025;
        hp_regen += 0.0025;
        break;
    case 8:
        armor += 2;
        maxhp += ((1 - (global.artifact_glass * 0.75)) * 33);
        hp += ((1 - (global.artifact_glass * 0.75)) * 33);
        maxhp_base += ((1 - (global.artifact_glass * 0.75)) * 33);
        damage += (((global.artifact_glass * 4) + 1) * 4);
        hp_regen += 0.004;
        break;
    case 9:
        armor += 3;
        maxhp += ((1 - (global.artifact_glass * 0.75)) * 36);
        maxhp_base += ((1 - (global.artifact_glass * 0.75)) * 36);
        hp += ((1 - (global.artifact_glass * 0.75)) * 36);
        damage += (((global.artifact_glass * 4) + 1) * 3);
        hp_regen += 0.004;
        break;
    case 10:
        armor += 3;
        maxhp += ((1 - (global.artifact_glass * 0.75)) * 36);
        maxhp_base += ((1 - (global.artifact_glass * 0.75)) * 36);
        hp += ((1 - (global.artifact_glass * 0.75)) * 36);
        damage += (((global.artifact_glass * 4) + 1) * 3);
        attack_speed += 0.025;
        hp_regen += 0.003;
        break;
    case 11:
        armor += 3;
        maxhp += ((1 - (global.artifact_glass * 0.75)) * 42);
        hp += ((1 - (global.artifact_glass * 0.75)) * 42);
        maxhp_base += ((1 - (global.artifact_glass * 0.75)) * 42);
        damage += (((global.artifact_glass * 4) + 1) * 3);
        hp_regen += 0.005;
        break;
    case 12:
        armor += 3;
        maxhp += ((1 - (global.artifact_glass * 0.75)) * 35);
        maxhp_base += ((1 - (global.artifact_glass * 0.75)) * 35);
        hp += ((1 - (global.artifact_glass * 0.75)) * 35);
        damage += (((global.artifact_glass * 4) + 1) * 3);
        hp_regen += 0.004;
        break;
}
s = instance_create(x, y - sprite_yoffset - 58, oEfLevel);
s.level = level;
s.parent = id;
if (warbanner != 0)
{
    apply_buff(id, 10, 180 + (60 * warbanner));
    caster_play(109, global.volume, 1);
    with (instance_create(x, y, oEfWarbanner))
    {
        range = 50 + (20 * other.warbanner);
    }
    s.sprite_index = sEfLevelUpWar;
}
else
{
    caster_play(108, global.volume, 1);
}
