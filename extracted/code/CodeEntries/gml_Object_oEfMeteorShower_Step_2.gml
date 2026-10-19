if (global.graphics >= 2)
{
    if (done == 0)
    {
        alpha = min(0.2, alpha + 0.005);
    }
    else
    {
        alpha = max(0, alpha - 0.005);
    }
}
if (alpha == 0 && done == 1)
{
    instance_destroy();
}
