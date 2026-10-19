if (instance_exists(parent))
{
    if (parent.activity != 1)
    {
        instance_destroy();
    }
}
else
{
    instance_destroy();
}
