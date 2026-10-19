var tc = choose(make_color_rgb(235, 148, 150), make_color_rgb(253, 255, 168), make_color_rgb(130, 226, 255), make_color_rgb(167, 255, 130));
var ts = random_range(3, 5);
repeat (8)
{
    with (instance_create(x, y, oEfFireworkDust))
    {
        speed = ts;
        color = tc;
    }
}
