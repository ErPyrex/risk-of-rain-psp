f += 0.015;
yy = round(cos(f) * 3);
if (global.graphics >= 2)
{
    if (random(100) < 50)
    {
        part_particles_create(global.above, view_xview[0] + random(view_wview[0]), (y + yy) - 3, global.pBubble, 1);
    }
}
with (pEnemyClassic)
{
    if (y > other.y && (y != yprevious || x != xprevious))
    {
        if (global.graphics >= 2)
        {
            part_particles_create(global.above, x - (((sprite_get_width(sprite_index) / 2) - random(sprite_get_width(sprite_index))) * random(1.3) * random(1.3)), y - (((sprite_get_height(sprite_index) / 2) - random(sprite_get_height(sprite_index))) * random(1.3) * random(1.3)), global.pBubble, 1);
        }
        pVspeed = min(pVspeed, pVspeed * 0.8);
        pHspeed = max(0, abs(pHspeed) - 0.04) * sign(pHspeed);
    }
}
with (oP)
{
    if (y > other.y && (y != yprevious || x != xprevious))
    {
        if (global.graphics >= 2)
        {
            part_particles_create(global.above, x - (((sprite_get_width(sprite_index) / 2) - random(sprite_get_width(sprite_index))) * random(1.3) * random(1.3)), y - (((sprite_get_height(sprite_index) / 2) - random(sprite_get_height(sprite_index))) * random(1.3) * random(1.3)), global.pBubble, 1);
        }
        pVspeed = min(pVspeed, pVspeed * 0.8);
        pHspeed = max(0, abs(pHspeed) - 0.04) * sign(pHspeed);
    }
}
