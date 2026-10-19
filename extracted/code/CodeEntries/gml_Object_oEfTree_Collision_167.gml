if (!other.dead && bud)
{
    image_index = 0;
    bud = 0;
    alarm[1] = 360;
    other.hp = min(other.hp + value, other.maxhp);
    draw_damage(x, y, global.handlerDamage, value, 0, 6870916, 6870916);
}
