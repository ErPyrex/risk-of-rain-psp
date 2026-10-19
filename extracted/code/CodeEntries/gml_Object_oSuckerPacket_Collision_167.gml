caster_play(158, global.volume, 1);
switch (image_index)
{
    case 0:
        apply_buff(other.id, 6, 180);
        break;
    case 1:
        apply_buff(other.id, 5, 180);
        break;
    case 2:
        apply_buff(other.id, 28, 180);
        break;
}
instance_destroy();
