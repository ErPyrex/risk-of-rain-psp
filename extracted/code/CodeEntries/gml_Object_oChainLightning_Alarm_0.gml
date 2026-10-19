var ttarget_index;
switch (team)
{
    case "enemyproc":
        ttarget_index = 176;
        var tteam = "enemy";
        break;
    case "playerproc":
        ttarget_index = 321;
        var tteam = "player";
        break;
    default:
        ttarget_index = 321;
        var tteam = "player";
        break;
}
var tx = x;
var ty = y;
var tc = 0;
with (ttarget_index)
{
    if (team != other.team && point_distance(x, y, tx, ty) < 50 && tc < other.bounce && !invincible)
    {
        if (other.critical == 1)
        {
            caster_play(63, global.volume, 1);
        }
        caster_play(40, global.volume, 1);
        other.target[tc, 1] = x;
        other.target[tc, 2] = y;
        lastHp = hp;
        hp -= other.damage;
        tx = x;
        ty = y;
        tc++;
        s = instance_create(x, y, oEfDamage);
        s.team = "";
        s.textColor = other.blend;
        s.damage = string(other.damage);
        s.critical = other.critical;
    }
}
