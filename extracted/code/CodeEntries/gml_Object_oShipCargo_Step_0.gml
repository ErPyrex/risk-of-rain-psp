if (trashed)
{
    rate = max(0, rate - 0.01);
    part_particles_create(global.above, x, y + (40 * cos(degtorad(y3))) + random_range(-10, 10), global.pCutsceneSmoke, 1);
    part_particles_create(global.above, x, y + (40 * cos(degtorad(y4))) + random_range(-10, 10), global.pCutsceneSmoke, 1);
}
y1 += (1 * rate);
y2 += (1 * rate);
y3 += (1 * rate);
y4 += (1 * rate);
if (round(y2) == 360)
{
    y1 = 0;
    y2 = 270;
    y3 = 90;
    y4 = 180;
}
oCutsceneControl.shakex = max(1 * max(0, 1 - (abs(x - (view_xview[0] + (view_wview[0] / 2))) / 200)), oCutsceneControl.shakex);
oCutsceneControl.shakey = max(1 * max(0, 1 - (abs(x - (view_xview[0] + (view_wview[0] / 2))) / 200)), oCutsceneControl.shakey);
