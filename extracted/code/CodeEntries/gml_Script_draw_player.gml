draw_buff();
var trx = ceil(x);
var try = ceil(y);
draw_set_alpha(1);
for (i = 0; i <= item_count; i += 1)
{
    switch (item[i, 0])
    {
        case 733:
            if ((random(100) < 25 && hp != maxhp) || (random(100) < 5 && global.graphics >= 2))
            {
                part_particles_create(global.below, x, y, global.pHeal, 1);
            }
            break;
        case 739:
            draw_sprite(sEfCrosshair, 0, trx, try - 5);
            break;
        case 771:
            draw_sprite(sEfCrosshair, 1, trx, try - 5);
            break;
        case 787:
            if (random(100) < 5 && global.graphics == 3)
            {
                s = instance_create((x - 5) + random(10), (y - 5) + random(10), oEfFlies);
                s.target = id;
            }
            break;
        case 761:
            if (control(global.jump_key, 5, 1) == 1 && free == 0 && activity != 30)
            {
                s = instance_create(x, y, oEfJetpack);
            }
            break;
        case 735:
            draw_sprite_ext(sprite_index, -1, (x - 1) + random(2), y, (image_xscale - 0.25) + random(0.7), (image_yscale - 0.25) + random(0.7), 0, c_yellow, 0.4);
            break;
        case 762:
            draw_set_alpha(0.6);
            p = 2924734;
            draw_rectangle_color(trx - 8, try - 20, trx - 12, try, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 0);
            draw_rectangle_color(trx - 9, try - 19, trx - 11, try - 1, c_black, c_black, c_black, c_black, 0);
            draw_rectangle_color(trx - 9, try - 1 - (18 * min((oHUD.gold * gold_gun) / (700 * power(global.enemy_buff, global.hp_co)), 1)), trx - 11, try - 1, c_white, c_white, p, p, 0);
            draw_set_alpha(1);
            break;
        case 760:
            if (random(100) < 4 && global.graphics >= 3)
            {
                part_particles_create_color(global.above, x, y, global.pDust2, 255, 1);
            }
            break;
        case 764:
            if (random(100) < 4 && global.graphics >= 3)
            {
                part_particles_create_color(global.above, x, y, global.pSpark, 12892302, 1);
            }
            break;
        case 737:
            if (pHspeed != 0 && random(100) < 20 && global.graphics >= 2)
            {
                part_particles_create(global.below, x, (y - 5) + random(10), global.pSpeed, 1);
            }
            break;
        case 766:
            if (shield > 0)
            {
                draw_sprite(sEfShield, 0, trx + 11, try - 11);
            }
            break;
        case 759:
            if (random(100) < 4)
            {
                part_particles_create(global.below, (x - 10) + random(20), (y - 10) + random(20), global.pSmoke, 1);
            }
            break;
        case 731:
            if (shield_cooldown == 0)
            {
                draw_sprite_ext(sEfEgg, 0, trx, try, 1, 1, 0, c_white, 0.3);
                if (random(100) < 20)
                {
                    part_particles_create_color(global.below, (ceil(x) - 10) + random(20), (ceil(y) - 10) + random(20), global.pHeal, 65535, 1);
                }
            }
            break;
        case 856:
            if (hp <= (maxhp * 0.3))
            {
                if (random(100) < 70)
                {
                    d = random(360);
                    part_particles_create_color(global.below, x + lengthdir_x(10, d), y + lengthdir_y(10, d), global.pHero, 8114927, 1);
                }
            }
            break;
        case 859:
            if (hp <= (maxhp * 0.3))
            {
                if (random(100) < 70)
                {
                    d = random(360);
                    part_particles_create_color(global.below, x + lengthdir_x(5, d), y + lengthdir_y(5, d), global.pHero, 6710991, 1);
                }
            }
            break;
        case 857:
            if (hp <= (maxhp * 0.3))
            {
                if (random(100) < 70)
                {
                    d = random(360);
                    part_particles_create_color(global.below, x + lengthdir_x(2, d), y + lengthdir_y(2, d), global.pHero, 12093564, 1);
                }
            }
            break;
        case 728:
            if (random(100) < 5 && global.graphics >= 2)
            {
                part_particles_create(global.below, x, y, global.pLeaf, 3);
            }
            break;
        case 796:
            if (random(100) < 10 && global.graphics >= 2)
            {
                part_particles_create_color(global.above, x - (((sprite_get_width(sprite_index) / 2) - random(sprite_get_width(sprite_index))) * random(1.7) * random(1.7)), y - (((sprite_get_height(sprite_index) / 2) - random(sprite_get_height(sprite_index))) * random(1.7) * random(1.7)), global.pPixelDust, merge_color(c_white, #8EBAC1, random(1)), 1);
            }
            break;
        case 725:
            if (medkit_timer != 14)
            {
                draw_sprite(sMedkitBar, medkit_timer, trx + 10, try - 10);
            }
            break;
        case 780:
            for (ii = 0; ii < 6; ii += 1)
            {
                draw_sprite_ext(sReflectorCharge, ii < reflector_charge, trx + lengthdir_x(20, 90 + (60 * ii)), try + lengthdir_y(20, 90 + (60 * ii)), 1, 1, 0, c_white, 0.7);
            }
            break;
        case 754:
            draw_set_blend_mode(bm_add);
            draw_sprite_ext(sprite_index, -1, (x - 1) + random(2), y, (image_xscale - 0.25) + random(0.7), (image_yscale - 0.25) + random(0.7), 0, c_teal, 1 - (hp / maxhp));
            draw_set_blend_mode(bm_normal);
            break;
        case 755:
            if (random(100) < 5 && global.graphics >= 2)
            {
                part_particles_create(global.above, x, y, global.pRadioactive, 3);
            }
            break;
    }
}
if (reflecting != 0)
{
    draw_sprite_ext(sEfReflector, current_time * 0.05, x, y, 1, 1, current_time * 4, c_white, 0.9);
}
if (jetpack != 0 && jetpack_fuel != (100 + (50 * (jetpack - 1))))
{
    draw_sprite(sJetpackFuel, 0, trx + 11, try + 6);
    draw_sprite_part(sJetpackFuel, 1, 0, sprite_get_height(sJetpackFuel), sprite_get_width(sJetpackFuel), -sprite_get_height(sJetpackFuel) * (jetpack_fuel / (100 + (50 * (jetpack - 1)))), trx + 11, try + 6);
}
