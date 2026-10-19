var xoffset1 = round((sprite_get_bbox_left(mask_index) - sprite_get_xoffset(mask_index)) * abs(image_xscale));
var xoffset2 = round((sprite_get_bbox_right(mask_index) - sprite_get_xoffset(mask_index)) * abs(image_xscale));
var yoffset2 = round((sprite_get_bbox_top(mask_index) - sprite_get_yoffset(mask_index)) * abs(image_yscale));
var yoffset1 = round((sprite_get_bbox_bottom(mask_index) - sprite_get_yoffset(mask_index)) * abs(image_yscale));
var tfactor = 1;
if (global.artifact_speed)
{
    tfactor = 1 + max(0, 2 * (1 - (hp / maxhp)));
}
facing_wall = 0;
knockback_value = max(abs(knockback_value - (0.5 - (0.3 * (frozen != 0)))), 0) * sign(knockback_value);
if (moveLeft == 1 && moveRight == 1)
{
    moveLeft = 0;
    moveRight = 0;
}
if (moveLeft == 1 && (activity_type == 0 || activity_type == 4))
{
    sprite_index = sprite_walk;
    pHspeed = min(0, -pHmax);
    image_speed = 0.2 * pHmax * walk_speed_coeff * tfactor;
    if (activity_type != 4)
    {
        image_xscale = abs(image_xscale) * -1;
    }
    else
    {
        image_speed = image_speed * image_xscale * sign(pHspeed);
    }
}
else if (moveRight == 1 && (activity_type == 0 || activity_type == 4))
{
    sprite_index = sprite_walk;
    pHspeed = max(0, pHmax);
    image_speed = 0.2 * pHmax * walk_speed_coeff * tfactor;
    if (activity_type != 4)
    {
        image_xscale = abs(image_xscale);
    }
    else
    {
        image_speed = image_speed * image_xscale * sign(pHspeed);
    }
}
else if (activity_type == 0 || activity_type == 4 || activity_type == 5)
{
    sprite_index = sprite_idle;
    image_speed = 0.2;
    pHspeed = 0;
}
if (alarm[7] != -1)
{
    pHspeed = knockback_value * -sign(image_xscale);
}
var v = pVspeed;
if (moveUp == 1 && (free == 0 || jump_count < feather) && activity_type < 3)
{
    if (jump_count == 0 && (!free || activity == 30))
    {
        pVspeed = -pVmax;
    }
    else if (feather != 0)
    {
        jump_count = max(jump_count, 1);
        pVspeed = min(pVspeed, -pVmax * 1.5);
        with (instance_create(x, y, oEfSparks))
        {
            sprite_index = sEfFeather;
            image_xscale = choose(1, -1);
            image_yscale = 1;
            image_speed = 0.25;
        }
    }
    jump_count += 1;
    moveUp = 0;
}
if (free == 1 && activity_type != 2)
{
    if (activity_type == 0)
    {
        sprite_index = sprite_jump;
    }
    if (moveUpHold == 1)
    {
        if (jetpack != 0 && pVspeed >= -2)
        {
            if (jetpack_fuel >= 2)
            {
                jetpack_cd = 20;
                jetpack_fuel = max(0, jetpack_fuel - 2);
                pVspeed = min(pVspeed, max(pVspeed - 0.2, -2));
                var vvv = point_direction(xprevious, yprevious, x, y);
                part_particles_create(global.above, x - 3, y, global.pMortar, 1);
                part_particles_create(global.above, x + 3, y, global.pMortar, 1);
            }
            else
            {
                pVspeed = min(15, pVspeed + pGravity2);
            }
        }
        else
        {
            pVspeed = min(15, pVspeed + pGravity2);
        }
    }
    else
    {
        pVspeed = min(15, pVspeed + pGravity1);
    }
    if (get_collision(x, (y + yoffset2) - 1) > 0)
    {
        pVspeed = max(pVspeed, 0.1);
    }
}
if (get_collision(x - xoffset1, y + yoffset1 + 1) > 0 || get_collision(x - xoffset2, y + yoffset1 + 1) > 0)
{
    free = 0;
}
else
{
    free = 1;
}
pHspeed *= tfactor;
CheckCollision_Horizontal(pHspeed);
CheckCollision_Vertical(pVspeed);
if (v >= 5 && pVspeed == 0 && stompers != 0)
{
    oHUD.alarm[0] = 7;
    with (instance_create(x, y, oEfSparks))
    {
        move_contact_solid(270, 16);
        image_yscale = 1;
        image_speed = 0.2;
        sprite_index = sEfStompers1;
    }
    fire_explosion(2, x, y, (power(v, 2.3) * (1 + ((stompers - 1) * 0.3))) / 100, 292, 2, -1, 1, 1);
    bullet.team = "playerproc";
}
if (v >= 13 && pVspeed == 0 && invincible == 0)
{
    s = instance_create(x, y, oEfDamage);
    s.team = "enemy";
    s.damage = ceil((hp * v) / 100);
    hp -= ceil((hp * v) / 100);
}
if (xprevious == x && activity_type == 0)
{
    if (!free)
    {
        sprite_index = sprite_idle;
        image_speed = 0.2;
    }
    pHspeed = 0;
}
pHspeed /= tfactor;
