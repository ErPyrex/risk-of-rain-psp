var tglow_total = 0;
for (i = 0; i < (global.artifact_number - 1); i += 1)
{
    var tglow = 0;
    draw_sprite_ext(sprite_index, i, (x - ((global.artifact_number / 2) * 18)) + (i * 18), y, 1, 1, 0, c_white, 1);
    switch (i)
    {
        case 0:
            if (global.artifact_elite)
            {
                tglow = 1;
            }
            break;
        case 1:
            if (global.artifact_crew)
            {
                tglow = 1;
            }
            break;
        case 2:
            if (global.artifact_lock)
            {
                tglow = 1;
            }
            break;
        case 3:
            if (global.artifact_death)
            {
                tglow = 1;
            }
            break;
        case 4:
            if (global.artifact_glass)
            {
                tglow = 1;
            }
            break;
        case 5:
            if (global.artifact_use)
            {
                tglow = 1;
            }
            break;
        case 6:
            if (global.artifact_loot)
            {
                tglow = 1;
            }
            break;
        case 7:
            if (global.artifact_command)
            {
                tglow = 1;
            }
            break;
        case 8:
            if (global.artifact_speed)
            {
                tglow = 1;
            }
            break;
    }
    if (tglow)
    {
        tglow_total += 1;
        draw_sprite_ext(sprite_index, i + global.artifact_number, (x - ((global.artifact_number / 2) * 18)) + (i * 18), y, 1, 1, 0, c_white, image_alpha);
    }
}
if (tglow_total == 9)
{
    active = 1;
}
else
{
    active = 0;
}
