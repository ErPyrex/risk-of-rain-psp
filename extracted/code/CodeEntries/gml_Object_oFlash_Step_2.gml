alpha = max(0, alpha - 0.005);
if (alpha == 0 && done == 1)
{
    instance_destroy();
}
