if (partner == -4)
{
    with (oConsRod)
    {
        if (parent == other.parent && id != other.id)
        {
            partner = other.id;
            other.partner = id;
            alarm[0] = 540;
            alarm[1] = 1;
            other.alarm[0] = 540;
        }
    }
}
else
{
}
