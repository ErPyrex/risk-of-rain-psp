following_player_index = -10;
ready = 0;
hp = maxhp;
switch (class)
{
    case 2:
        if (bunker == 1)
        {
            bunker = 0;
            sprite_idle = 199;
            sprite_shoot1 = 204;
            sprite_walk = 211;
            walk_speed_coeff = 1;
            image_speed = 0;
            pHmax += 0.7;
            pHspeed = 0;
            activity = 0;
            activity_type = 0;
            skill[2, 4] = 2;
        }
    case 5:
        x_stack = 0;
        break;
    case 8:
        with (instance_create(x, y, oSniperDrone))
        {
            master = other.id;
            other.drone = id;
        }
        break;
    case 11:
        cleaver_count = 0;
        break;
}
if (!instance_exists(child_poi))
{
    child_poi = instance_create(x, y, oPOI);
    child_poi.parent = id;
}
