switch (readshort())
{
    case 1:
        var icx = readdouble();
        var icy = readdouble();
        var tproc = instance_create(icx, icy, oWispBMine);
        tproc.damage = readdouble();
        tproc.alarm[0] = 50 + (readshort() * 5);
        tproc.team = readstring(bytesleft(), 0);
        break;
    case 3:
        var v1 = readdouble();
        var v2 = readshort();
        var ttarget = find_object(v1, v2);
        if (instance_exists(ttarget) == 0)
        {
            exit;
        }
        var v3 = readshort();
        var v4 = readshort();
        apply_buff(ttarget, v3, v4);
        break;
    case 4:
        var icx = readdouble();
        var icy = readdouble();
        var tproc = instance_create(icx, icy, oEfMortar);
        tproc.damage = readdouble();
        tproc.direction = readshort();
        break;
    case 5:
        var icx = readdouble();
        var icy = readdouble();
        var tproc = instance_create(icx, icy, oEfScope);
        var v1 = readdouble();
        var v2 = readshort();
        tproc.target = find_object(v1, v2);
        if (instance_exists(tproc.target) == 0)
        {
            with (tproc)
            {
                instance_destroy();
            }
            exit;
        }
        break;
    case 6:
        var tproc = instance_create(x, y, oEfChain);
        with (tproc)
        {
            var v1 = readshort();
            var v2 = readdouble();
            var v3 = readshort();
            parent = find_object(0, v1);
            target = find_object(v2, v3);
            if (instance_exists(target) == 0)
            {
                instance_destroy();
                exit;
            }
            coeff = readshort();
        }
        break;
    case 8:
        var tproc = instance_create(x, y, oDot);
        var v1 = readdouble();
        var v2 = readshort();
        tproc.parent = find_object(v1, v2);
        if (instance_exists(tproc.parent) == 0)
        {
            with (tproc)
            {
                instance_destroy();
            }
            exit;
        }
        tproc.damage = readshort();
        tproc.ticks = 4;
        with (instance_create(tproc.parent.x, tproc.parent.y, oEfBullet2))
        {
            sprite_index = sEfSlash;
            image_yscale = 1;
        }
        break;
    case 9:
        var icx = readdouble();
        var icy = readdouble();
        var tproc = instance_create(icx, icy, oChainLightning);
        tproc.damage = readshort();
        tproc.team = readstring(bytesleft(), 0);
        break;
    case 10:
        var icx = readdouble();
        var icy = readdouble();
        var tproc = instance_create(icx, icy, oEfMissile);
        tproc.damage = readshort();
        tproc.direction = readshort();
        tproc.alarm[2] = readshort();
        break;
    case 11:
        var icx = readshort();
        var icy = readshort();
        var tproc = instance_create(icx, icy, readshort());
        tproc.damage = readshort();
        var sp = readshort();
        if (tproc.object_index == oEfPoisonMine)
        {
            tproc.poison = sp;
        }
        break;
    case 12:
        var icx = readdouble();
        var icy = readdouble();
        var tproc = instance_create(icx, icy, oEfMissileEnemy);
        tproc.damage = readshort();
        tproc.direction = readshort();
        tproc.alarm[2] = readshort();
        break;
    case 13:
        var tproc = instance_create(x, y, oEfSticky);
        var v1 = readshort();
        var v2 = readshort();
        tproc.parent = find_object(v1, v2);
        tproc.damage = readshort();
        if (instance_exists(tproc.parent) == 0)
        {
            with (tproc)
            {
                instance_destroy();
            }
            exit;
        }
        tproc.xx = random_range(-5, 5);
        tproc.yy = random_range(-5, 5);
        break;
    case 14:
        var icx = readdouble();
        var icy = readdouble();
        var tproc = instance_create(icx, icy, oEfSmite);
        break;
    case 15:
        var icx = readdouble();
        var icy = readdouble();
        var tproc = instance_create(icx, icy, oEfBomb);
        tproc.value = readdouble();
        break;
    case 16:
        var tx = readdouble();
        var ty = readdouble();
        oHUD.alarm[0] = 2;
        fire_explosion(3, tx, ty - 50, 1, 528, 3, -1, 1.4, 12);
        x = bullet.x;
        y = bullet.y;
        caster_play(167, global.volume * 0.7, 1.3);
        bullet.knockup = 6;
        bullet.damage = readdouble();
        bullet.damage_fake = bullet.damage;
        bullet.critical = readbyte();
        bullet.team = "player";
        var ff = instance_create(tx, ty, oEfSparks);
        ff.image_yscale = 1;
        ff.sprite_index = sEfPillar;
        ff.image_speed = 0.3;
        break;
    case 17:
        var icx = readdouble();
        var icy = readdouble();
        var t = instance_create(icx, icy, oIfritBullet);
        t.direction = readbyte();
        t.image_xscale = (90 - direction) / 90;
        t.damage = readdouble();
        t.team = "player";
        t.speed = 4;
        break;
    case 18:
        var icx = readdouble();
        var icy = readdouble();
        var tproc = instance_create(icx, icy, oEfFirework);
        tproc.damage = readshort();
        tproc.direction = readshort();
        tproc.alarm[2] = readshort();
        break;
}
