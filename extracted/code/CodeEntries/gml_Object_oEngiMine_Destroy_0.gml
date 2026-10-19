if (instance_exists(parent))
{
    if (parent.mine_detonate_timer == 0)
    {
        parent.mine_detonate_timer = 300;
    }
    parent.mine_detonate_count += 1;
}
