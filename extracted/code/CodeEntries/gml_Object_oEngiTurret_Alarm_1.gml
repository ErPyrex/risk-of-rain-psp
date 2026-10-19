if (bullets == 0)
{
    bullets = bullets_max;
    alarm[1] = 45 / parent.attack_speed;
}
else
{
    bullets -= 1;
}
