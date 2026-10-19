active = 1;
with (oArtifactButton)
{
    if (activated == 0)
    {
        other.active = 0;
    }
}
if (active == 1)
{
    caster_play(21, global.volume, 1);
    if (oInit.coop != 2 || global.host)
    {
        switch (room)
        {
            case r1_2_1:
                instance_create(x, y, oArtifact2);
                break;
            case r3_1_1:
                instance_create(x, y, oArtifact5);
                break;
            case r4_1_2:
                instance_create(x, y, oArtifact7);
                break;
        }
    }
    instance_destroy();
}
alarm[0] = 5;
