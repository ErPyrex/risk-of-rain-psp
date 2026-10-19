for (i = 1; i <= body_count; i += 1)
{
    with (body[i])
    {
        instance_destroy();
    }
}
