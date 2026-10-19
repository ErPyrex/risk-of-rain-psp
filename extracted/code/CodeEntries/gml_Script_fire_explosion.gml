bullet = instance_create(argument1, argument2, oExplosion);
bullet.damage_index = argument4;
bullet.alarm[0] = argument5;
bullet.sprite_index = argument6;
var txscale;
if (sign(image_xscale) == 0)
{
    txscale = 1;
}
else
{
    txscale = sign(image_xscale);
}
bullet.image_xscale = argument7 * txscale;
bullet.image_yscale = argument8;
bullet.team = team;
if (argument0 == 1 || argument0 == 3)
{
    bullet.critical = critical;
    bullet.damage = ceil(damage * argument3);
    bullet.damage_fake = bullet.damage;
    bullet.parent = -10;
}
else
{
    damage_default(bullet, argument3);
    bullet.parent = id;
    if (oInit.coop == 2 && object_index == oP.object_index)
    {
        bullet.parent_m_id = m_id;
    }
}
if (argument0 <= 1)
{
    var kk = (random(100) < (knockback * 100)) * 6;
    if (kk != 0)
    {
        bullet.knockback = kk;
        bullet.knockback_glove = 1;
    }
    bullet.snare = snare * (random(100) < 7);
    bullet.horn = horn * (random(100) < 8);
    bullet.blaster = blaster;
    bullet.wolfblood = wolfblood;
    bullet.sticky = sticky * (random(100) < 9);
    bullet.sunder = sunder;
    bullet.crowbar = crowbar;
    bullet.spark = spark * (random(100) < 8);
    bullet.nugget = nugget * (random(100) < 8);
    bullet.thallium = thallium * (random(100) < 10);
    bullet.mortar = mortar * (random(100) < 9);
    if (random(100) < min(1 + ((scope - 1) * 0.5), 3))
    {
        bullet.scope = scope;
    }
    if (plasma_count < plasma)
    {
        bullet.plasma = random(100) < 9;
    }
    bullet.scythe = scythe;
    bullet.axe = axe;
    bullet.bleed = random(100) < (15 * min(bleed, 1));
    if (gold_gun != 0)
    {
        bullet.gold_gun = gold_gun;
        bullet.gold = oHUD.gold;
    }
    bullet.gold_on_hit = gold_on_hit;
    bullet.explosive_shot = explosive_shot;
    bullet.lifesteal = lifesteal;
    bullet.lightning = (random(100) < 20) * lightning;
    bullet.missile = random(100) < (missile * 10);
    bullet.missile_tri = random(100) < (missile_tri * 7);
    var tch = random(100) < (stun * 100);
    bullet.stun = tch;
    bullet.stun_ef = tch;
    bullet.freeze = random(100) < (13 * (freeze > 0));
    bullet.skull_ring = skull_ring;
    bullet.worm_eye = worm_eye;
    bullet.drill = drill;
    bullet.slow_on_hit = slow_on_hit;
    bullet.dynamite_on_hit = dynamite_on_hit;
}
