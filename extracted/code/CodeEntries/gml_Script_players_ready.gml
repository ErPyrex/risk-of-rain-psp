for (ii = 0; ii < instance_number(oP); ii += 1)
{
    if (instance_find(oP, ii).ready == 0)
    {
        return 0;
    }
}
return 1;
