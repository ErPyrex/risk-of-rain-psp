if (image_blend != c_white && instance_exists(head))
{
    alarm[1] = 10 + random(70);
    t = instance_create((x - 10) + random(20), (y - 10) + random(20), oChainLightning);
    t.team = "enemyproc";
    t.damage = ceil(head.damage / 6);
}
