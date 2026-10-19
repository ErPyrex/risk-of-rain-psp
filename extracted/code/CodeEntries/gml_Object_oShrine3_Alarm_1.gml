if (minions_dead == (2 + (oInit.player_number * 3)))
{
    minions = 0;
    minions_dead = 0;
    image_index = 0;
    active = 0;
    cost = floor(cost * 1.7);
}
else
{
    alarm[1] = 1;
}
