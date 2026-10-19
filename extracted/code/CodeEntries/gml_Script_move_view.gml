with (oHUD)
{
    var prev_x = ceil(view_xview[0]);
    var prev_y = ceil(view_yview[0]);
    if (oInit.coop != 1)
    {
        var tarx, tary;
        if (oInit.player[1, 2].dead == 0)
        {
            tarx = ceil(oInit.player[1, 2].x);
            tary = ceil(oInit.player[1, 2].y);
        }
        else if (oInit.coop == 2 && instance_exists(oInit.player[1, 2].following_player) && players_alive() > 0)
        {
            tarx = ceil(oInit.player[1, 2].following_player.x);
            tary = ceil(oInit.player[1, 2].following_player.y);
        }
        else
        {
            tarx = ceil(oInit.player[1, 2].dead_body.x);
            tary = ceil(oInit.player[1, 2].dead_body.y);
        }
        x += ((tarx - x) / 3);
        y += ((tary - y) / 3);
    }
    else
    {
        t_count_last = t_count;
        tx_last = tx;
        ty_last = ty;
        t_count = 0;
        if (oInit.player_number > 0)
        {
            tx = 0;
            ty = 0;
        }
        max_x = 0;
        min_x = 90000;
        with (oP)
        {
            if (dead == 0)
            {
                other.tx += x;
                other.ty += y;
                other.t_count += 1;
                if (x > other.max_x)
                {
                    other.max_x = x;
                }
                if (x < other.min_x)
                {
                    other.min_x = x;
                }
            }
        }
        if (t_count == 0)
        {
            t_count = 1;
        }
        if (t_count != t_count_last)
        {
            transitioning = 1;
        }
        if (transitioning == 1)
        {
            tx = ((tx / t_count) + (tx_last * 6)) / 7;
            ty = ((ty / t_count) + (ty_last * 6)) / 7;
            if (abs((tx / t_count) - tx_last) < 2 && abs((ty / t_count) - ty_last) < 2)
            {
                transitioning = 0;
            }
        }
        else
        {
            tx /= t_count;
            ty /= t_count;
        }
        x = round((tx - shake) + random(2 * shake));
        y = round((ty - shake) + random(2 * shake));
    }
    view_xview[0] = ceil(min(room_width - view_wview[0], max((x - (view_wview[0] / 2) - shake) + random(2 * shake), 0)));
    view_yview[0] = ceil(min(room_height - view_hview[0], max(0, (y - (view_hview[0] / 2) - shake) + random(2 * shake))));
    oInit.x += (view_xview[0] - prev_x);
    oInit.y += (view_yview[0] - prev_y);
}
