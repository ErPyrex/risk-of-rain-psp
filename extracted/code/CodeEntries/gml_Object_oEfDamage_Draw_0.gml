draw_set_halign(fa_right);
draw_set_valign(fa_top);
if (critical == 0)
{
    draw_set_font(global.fntDamage);
}
else
{
    draw_set_font(global.fntCrit);
}
draw_set_alpha(image_alpha);
draw_set_color(textColor);
draw_text(x, y - climb, damage);
if (critical == 1)
{
    draw_sprite_ext(sDamageCrit, 10, x, y - climb, 1, 1, 0, textColor, image_alpha);
}
draw_set_alpha(1);
