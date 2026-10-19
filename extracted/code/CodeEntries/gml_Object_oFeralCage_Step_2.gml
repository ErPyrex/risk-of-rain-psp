if (active == 1 && floor(image_index) == 16)
{
    active = 2;
    var t = instance_create(x, y, oAcrid);
    t.image_xscale = -1;
    image_index += 1;
}
