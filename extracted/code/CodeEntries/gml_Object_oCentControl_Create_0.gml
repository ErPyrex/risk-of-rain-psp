cent[0] = instance_create(x, y, oCent);
cent[0].parent = cent[0];
for (i = 1; i <= 20; i += 1)
{
    cent[i] = instance_create(x + (i * 10), y, oCent);
    cent[i].parent = cent[i - 1];
}
