alarm[1] = 10;
if (floor(image_index) != 9 || sprite_index != sBoss1ShootX1)
{
    s = instance_create(x, y, oEfTrail);
    s.ghost = 1;
    s.rate = 0.03;
    s.image_index = image_index;
    s.sprite_index = sprite_index;
    s.image_xscale = image_xscale;
}
