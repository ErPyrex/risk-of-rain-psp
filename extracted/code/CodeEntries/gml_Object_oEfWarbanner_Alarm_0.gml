alarm[0] = 60;
with (oP)
{
    if (distance_to_object(other.id) < other.range)
    {
        apply_buff(id, 10, 120);
    }
}
