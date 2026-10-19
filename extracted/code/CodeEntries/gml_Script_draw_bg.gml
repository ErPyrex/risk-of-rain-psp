if (global.level_name == "Desolate Forest" || global.level_name == "Dried Lake")
{
    background_x[0] = view_xview[0];
    background_y[0] = view_yview[0];
    background_x[1] = view_xview[0] + (view_wview[0] * (2/3));
    background_y[1] = view_yview[0] + (view_hview[0] * 0.14285714285714285);
    background_x[2] = (view_xview[0] / 1.1) + 140;
    background_y[2] = (view_yview[0] / 1.07) + 60;
    background_x[3] = view_xview[0] / 1.2;
    background_y[3] = (view_yview[0] / 1.1) + 106;
    background_x[4] = view_xview[0];
    background_y[4] = (view_yview[0] + view_hview[0]) - 153;
}
if (global.level_name == "Damp Caverns")
{
    background_x[2] = view_xview[0];
    background_y[2] = view_yview[0];
    background_x[3] = view_xview[0] / 1.2;
    background_y[3] = view_yview[0] / 1.2;
    background_x[4] = view_xview[0] / 1.4;
    background_y[4] = view_yview[0] / 1.4;
}
if (global.level_name == "Magma Barracks")
{
    background_y[0] = view_yview[0] / 1.02;
    background_x[0] = view_xview[0] / 1.1;
    background_y[1] = ((view_yview[0] / 1.05) + view_hview[0]) - 240;
    background_x[1] = view_xview[0] / 1.2;
    background_y[2] = ((view_yview[0] / 1.13) + view_hview[0]) - 140;
    background_x[2] = view_xview[0] / 1.3;
}
if (global.level_name == "Ancient Valley" || global.level_name == "Boar Beach")
{
    if (global.graphics >= 2 && global.level_name != "Boar Beach")
    {
        part_particles_create(global.above, (view_xview[0] - (view_wview[0] / 2)) + random(view_wview[0] * 1.5), view_yview[0] - 5, global.pSnow, 1);
    }
    background_x[0] = view_xview[0];
    background_y[0] = (view_yview[0] / 1.01) + 60;
    background_x[1] = view_xview[0] / 1.02;
    background_y[1] = (view_yview[0] / 1.01) - 90;
    background_x[2] = view_xview[0] + 140;
    background_y[2] = view_yview[0];
    background_x[3] = view_xview[0] / 1.05;
    background_y[3] = view_yview[0];
}
if (global.level_name == "Sunken Tombs")
{
    background_x[0] = view_xview[0] / 1.1;
    background_y[0] = view_yview[0];
    background_x[1] = view_xview[0] / 1.2;
    background_y[1] = view_yview[0];
}
if (global.level_name == "Sky Meadow")
{
    background_x[0] = view_xview[0];
    background_y[0] = view_yview[0];
    background_x[1] = (view_xview[0] / 1.01) + 100;
    background_y[1] = view_yview[0];
    background_x[2] = view_xview[0] / 1.1;
    background_y[2] = view_yview[0];
    background_x[3] += 0.3;
    background_x[4] += 0.6;
}
if (global.level_name == "Temple of the Elders")
{
    if (global.graphics >= 2)
    {
        part_particles_create(global.above, (view_xview[0] - (view_wview[0] / 2)) + random(view_wview[0] * 1.5), view_yview[0] + random(view_hview[0]), global.pTempleSnow, global.graphics - 1);
    }
    background_x[0] = view_xview[0];
    background_y[0] = view_yview[0];
    background_x[1] = view_xview[0] / 1.02;
    background_y[1] = view_yview[0];
    background_x[2] = view_xview[0] / 1.05;
    background_y[2] = view_yview[0];
    background_x[3] = view_xview[0] / 1.1;
    background_y[3] = max((view_yview[0] / 1.05) + 200, (view_yview[0] + view_hview[0]) - 286);
    background_x[4] = (view_xview[0] / 1.1) + 350;
    background_y[4] = background_y[3] - 46;
}
if (global.level_name == "Hive Cluster")
{
    background_x[2] = view_xview[0] / 1.1;
    background_y[2] = view_yview[0] / 1.1;
    background_x[3] = view_xview[0] / 1.2;
    background_y[3] = view_yview[0] / 1.2;
    background_x[4] = view_xview[0] / 1.3;
    background_y[4] = view_yview[0] / 1.3;
}
if (global.level_name == "Risk of Rain")
{
    switch (global.graphics)
    {
        case 3:
            repeat (2)
            {
                part_particles_create(very_below, (view_xview[0] - (view_wview[0] / 2)) + random(view_wview[0] * 1.5), view_yview[0] - 30, global.pRain2, 1);
            }
            break;
        case 2:
            part_particles_create(very_below, (view_xview[0] - (view_wview[0] / 2)) + random(view_wview[0] * 1.5), view_yview[0] - 30, global.pRain2, 1);
            break;
        case 1:
            break;
    }
    background_x[0] = view_xview[0] - ((640 - view_wview[0]) / 2);
    background_y[0] = (view_yview[0] + view_hview[0]) - 396;
    background_x[4] = (view_xview[0] / 1.1) + 140;
    background_y[4] = (view_yview[0] / 1.07) + 60;
    background_x[5] = view_xview[0] / 1.2;
    background_y[5] = (view_yview[0] / 1.1) + 106;
    background_y[6] = (view_yview[0] + 240) / 1.1;
    background_x[6] = view_xview[0] / 1.1;
    background_y[7] = (view_yview[0] + 340) / 1.2;
    background_x[7] = view_xview[0] / 1.2;
}
background_x[0] = round(background_x[0]);
background_x[1] = round(background_x[1]);
background_x[2] = round(background_x[2]);
background_x[3] = round(background_x[3]);
background_x[4] = round(background_x[4]);
background_x[5] = round(background_x[5]);
background_x[6] = round(background_x[6]);
background_x[7] = round(background_x[7]);
background_y[0] = round(background_y[0]);
background_y[1] = round(background_y[1]);
background_y[2] = round(background_y[2]);
background_y[3] = round(background_y[3]);
background_y[4] = round(background_y[4]);
background_y[5] = round(background_y[5]);
background_y[6] = round(background_y[6]);
background_y[7] = round(background_y[7]);
