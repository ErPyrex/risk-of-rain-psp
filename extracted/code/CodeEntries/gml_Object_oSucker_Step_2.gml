if (instance_exists(master))
{
    pHmax = master.pHmax;
}
else
{
    instance_destroy();
}
if (sprite_index != sprite_buff)
{
    if (moveLeft == 1 && moveRight == 1)
    {
        moveLeft = 0;
        moveRight = 0;
    }
    if (moveLeft == 1)
    {
        sprite_index = sprite_walk;
        pHspeed = max(0, pHmax);
        image_speed = 0.2 * pHmax;
        image_xscale = -1;
    }
    else if (moveRight == 1)
    {
        sprite_index = sprite_walk;
        pHspeed = max(0, pHmax);
        image_speed = 0.2 * pHmax;
        image_xscale = 1;
    }
    else
    {
        if (sprite_index != sprite_love)
        {
            image_speed = 0;
            image_index = 0;
            sprite_index = sprite_idle;
            if (random(100) < 1)
            {
                image_speed = 0.2;
                sprite_index = sprite_love;
            }
        }
        pHspeed = 0;
    }
}
else
{
    if (floor(image_index) == 4 && (round(image_speed * 100) / 100) == 0.3)
    {
        image_speed = 0.28;
        instance_create(x, y, oSuckerPacket);
    }
    if (floor(image_index) == (sprite_get_number(sprite_index) - 1))
    {
        sprite_index = sprite_idle;
    }
}
if (alarm[7] == -1)
{
    if (place_meeting(x + ((1 + pHspeed) * image_xscale), y, pBlock) == 0)
    {
        x += (pHspeed * image_xscale);
    }
}
else if (place_meeting(x + (knockback_value * -image_xscale), y, pBlock) == 0)
{
    x += (knockback_value * -image_xscale);
}
var v = pVspeed;
if (moveUp == 1 && free == 0)
{
    pVspeed = -pVmax;
}
if (place_meeting(x, y + 1, pBlock) == 0)
{
    free = 1;
}
else
{
    free = 0;
}
if (free == 1)
{
    image_speed = 0;
    image_index = 0;
    sprite_index = sprite_jump;
    if (moveUpHold == 1)
    {
        pVspeed = min(15, pVspeed + pGravity2);
    }
    else
    {
        pVspeed = min(15, pVspeed + pGravity1);
    }
    if (place_meeting(x, y - 1, pBlock) == 1)
    {
        pVspeed = max(pVspeed, 0.1);
    }
}
else
{
    pVspeed = min(pVspeed, 0);
}
var c = collision_point(x, (y - sprite_get_yoffset(sprite_idle)) + sprite_get_height(sprite_idle) + ((4 * sign(pVspeed)) + pVspeed), oBMove, 0, 1);
if (place_meeting(x, y + pVspeed + sign(pVspeed), pBlock) == 0 && c < 0)
{
    y += round(pVspeed);
}
else if (c > 0)
{
    free = 0;
    pVspeed = 0;
    y = ((c.y + sprite_get_yoffset(sprite_idle)) - sprite_get_height(sprite_idle)) + (1 * sign(c.fall_speed));
}
else
{
    if (pVspeed < 0)
    {
        dir = 90;
    }
    else
    {
        dir = 270;
    }
    move_contact_solid(dir, abs(pVspeed) + 0.1);
}
