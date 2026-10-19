if (parent != -1)
{
    if (parent.time == 0 && not_client() == 1)
    {
        hp = 0;
    }
}
if (oInit.coop != 2)
{
    if (oP.x > x)
    {
        moveLeft = 1;
        moveRight = 0;
    }
    else
    {
        moveRight = 1;
        moveLeft = 0;
    }
    if (inside_view(x, y) == 0)
    {
        moveLeft = 0;
        moveRight = 0;
    }
}
if ((place_meeting(x + (3 * image_xscale), y, pBlock) == 1 && place_meeting(x + (3 * image_xscale), y - 20, pBlock) == 0 && can_jump == 1) || (random(100) < 1 && oInit.coop != 2))
{
    moveUp = 1;
}
if ((place_meeting(x + 8, y + 4, pBlock) == 0 && (place_meeting(x + 8, y + 18, pBlock) == 0 || can_jump == 0) && moveRight == 1) || ((place_meeting(x - 8, y + 5, pBlock) == 0 && (place_meeting(x - 8, y + 18, pBlock) == 0 || can_jump == 0) && moveLeft == 1) && free == 0))
{
    moveUp = 1;
}
step_default();
make_sound = max(0, make_sound - 1);
if (lastHp > hp && lastHp != -1)
{
    s = lastHp - hp;
    lastHp = hp;
    if (s > knockback_cap || knockback_value > 3 || alarm[7] > 20)
    {
        image_xscale = sign(lasthit_x - x);
        if (image_xscale == 0)
        {
            image_xscale = 1;
        }
        if (knockback_value <= 3)
        {
            knockback_value = 3;
        }
        alarm[7] = max(20, alarm[7]);
        if (alarm[7] != 20 && stunned == 0)
        {
            stunned = 1;
            s = instance_create(x, y, oEfStun);
            s.parent = id;
        }
        activity_type = 1;
        activity = 50;
        sprite_index = sprite_death;
        image_index = 0;
        image_speed = 0;
    }
    if (make_sound == 0)
    {
        caster_play(sound_hit, global.volume, 1.3);
        make_sound = 5;
    }
    alarm[6] = 360;
}
npc_death(0, force_death);
ghost_update();
