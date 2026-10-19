var w1exists = 1;
var w2exists = 2;
if (instance_exists(wurm_1))
{
    wurm_1hp = wurm_1.hp;
    wurm_1maxhp = wurm_1.maxhp;
}
else
{
    wurm_1hp = 0;
    w1exists = 0;
}
if (instance_exists(wurm_2))
{
    wurm_2maxhp = wurm_2.maxhp;
    wurm_2hp = wurm_2.hp;
}
else
{
    wurm_2hp = 0;
    w2exists = 0;
}
if (w1exists == 0 && w2exists == 0 && dead == 0)
{
    instance_create(x, y, oWhiteFlash);
    instance_create(4768, 1152, oBoss3Fake);
    dead = 1;
}
