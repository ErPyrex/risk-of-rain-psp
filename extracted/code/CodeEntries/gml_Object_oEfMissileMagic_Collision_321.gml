if (other.team != team && (other.team + "proc") != team && hit == 0 && alarm[1] == -1)
{
    fire_bullet(3, other.x, other.y, 0, 1, 5, 292, direction, 1, 1, -1);
    instance_destroy();
}
