if (inside_view(x, y) == 1 && sound_spawn != -1)
{
    caster_play(sound_spawn, global.volume, 1);
}
visible = true;
image_speed = 0.23;
if (elite_tier != -1)
{
    switch (elite_tier)
    {
        case 0:
            image_blend = c_red;
            break;
        case 1:
            image_blend = c_yellow;
            break;
        case 2:
            image_blend = c_green;
            break;
        case 3:
            image_blend = #87D6DA;
            break;
        case 4:
            image_blend = c_orange;
            break;
        case 5:
            image_blend = #F3A556;
            break;
        case 6:
            image_blend = #7C88B8;
            break;
        case 7:
            image_blend = #7EB686;
            break;
        case 8:
            image_blend = #EFD27B;
            break;
        case 9:
            image_blend = #CF6666;
            break;
        default:
            image_blend = c_black;
    }
}
