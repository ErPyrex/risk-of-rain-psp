s = instance_create(x, y, child);
s.image_xscale = image_xscale;
s.elite = elite;
s.elite_tier = elite_tier;
s.image_blend = image_blend;
s.point_value = point_value;
if (oInit.coop == 2)
{
    s.m_id = m_id;
}
with (s)
{
    init_elite(elite);
}
instance_destroy();
