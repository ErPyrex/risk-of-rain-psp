if (global.debug == 1)
{
    draw_set_font(global.fntMedium);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_text(view_xview[0] + 16, view_yview[0] + 66, points);
    draw_text(view_xview[0] + 16, view_yview[0] + 32, string(card[spawn[card_choice, 0], 0]));
    draw_text(view_xview[0] + 16, view_yview[0] + 48, "Chest: " + string(instance_number(pChest) + instance_number(pDroneItem)));
}
if (global.artifact_crew == 1)
{
    var tsprite;
    if (card[spawn[global.artifact_crew_choice, 0], 1] == 0)
    {
        tsprite = object_get_sprite(card[spawn[global.artifact_crew_choice, 0], 4]);
    }
    else
    {
        tsprite = object_get_sprite(card[spawn[global.artifact_crew_choice, 0], 3]);
    }
    var tx = (view_xview[0] + view_wview[0]) - 42;
    var ty = view_yview[0] + 67;
    var tcolor = 4210752;
    draw_sprite(sHUDArtifactCrew, 1, tx, ty);
    draw_sprite_part_ext(tsprite, 0, max(sprite_get_xoffset(tsprite) - 16, 0), 0, min(32, sprite_get_width(tsprite)), min(32, sprite_get_height(tsprite)), tx + (16 - min(sprite_get_xoffset(tsprite), 16)), ty + (16 - min(sprite_get_yoffset(tsprite), 16)), 1, 1, c_white, 1);
    draw_sprite(sHUDArtifactCrew, 0, tx, ty);
}
