with (instance_create(x, y, oWhiteFlash))
{
    rate = 0.01;
}
oHUD.alarm[0] = 120;
with (pEnemy)
{
    hp = 0;
}
with (instance_create(x, y - 40, oBossText))
{
    text1 = choose("How...?", "You.. monster...", "What.. are you..?");
}
achievement_progress(29, 1);
with (oP)
{
    if (class == 10 && global.diff_level == 3)
    {
        achievement_progress(46, 1);
    }
}
achievement_progress(47, 1);
with (oCommand)
{
    instance_create(x, y, oCommandFinal);
    instance_destroy();
}
with (oWallArtifact)
{
    if (active)
    {
        if (oInit.coop != 2 || global.host)
        {
            instance_create(x, y + 48, oArtifact10);
        }
    }
}
