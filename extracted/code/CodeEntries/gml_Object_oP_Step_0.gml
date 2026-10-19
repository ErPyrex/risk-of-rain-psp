switch (class)
{
    case 1:
        step_gunner();
        activity_gunner();
        break;
    case 2:
        step_riot();
        activity_riot();
        break;
    case 3:
        step_cowboy();
        activity_cowboy();
        break;
    case 4:
        step_huntress();
        activity_huntress();
        break;
    case 5:
        step_janitor();
        activity_janitor();
        break;
    case 6:
        step_engi();
        activity_engi();
        break;
    case 7:
        step_miner();
        activity_miner();
        break;
    case 8:
        step_sniper();
        activity_sniper();
        break;
    case 9:
        step_feral();
        activity_feral();
        break;
    case 10:
        step_samurai();
        activity_samurai();
        break;
    case 11:
        step_cons();
        activity_cons();
        break;
    case 12:
        step_chef();
        activity_chef();
        break;
}
ghost_update();
distance_ran += abs(pHspeed);
