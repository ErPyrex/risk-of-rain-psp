if (other.team != "player" && alarm[0] == -1)
{
    var ttarget = other.id;
    with (parent)
    {
        fire_explosion(2, ttarget.x, ttarget.y, 0.33, 293, 2, -1, 0.7, 3);
        bullet.team = "playerproc";
    }
    alarm[0] = 20;
}
