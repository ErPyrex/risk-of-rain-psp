if (used == 0)
{
    other.hp = min(other.hp + value, other.maxhp);
    image_index = 0;
    used = 1;
    draw_damage(x, y, global.handlerDamage, value, 0, 6870916, 6870916);
    instance_destroy();
}
