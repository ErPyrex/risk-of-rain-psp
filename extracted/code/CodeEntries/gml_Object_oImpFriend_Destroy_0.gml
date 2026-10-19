if (instance_exists(parent) == 1)
{
    parent.tentacle_cd = max(0, 3600 - (600 * (parent.tentacle - 1)));
}
