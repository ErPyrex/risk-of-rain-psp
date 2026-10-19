ttx = 0;
tty = 0;
draw_set_alpha(1);
if (is_undefined(ds_map_find_value(global.Pal_Map, argument[0])))
{
    var _spr = argument[0];
    var _colors = sprite_get_height(_spr);
    var _palettes = ds_list_create();
    ds_map_add(global.Pal_Map, _spr, _palettes);
    var _num;
    if (sprite_get_width(_spr) > 1)
    {
        _num = sprite_get_width(_spr);
        draw_sprite(_spr, 0, ttx, tty);
    }
    else
    {
        _num = sprite_get_number(_spr);
        for (var i = 0; i < _num; i++)
        {
            draw_sprite(_spr, i, ttx + i, tty);
        }
    }
    for (var i = 0; i < _num; i++)
    {
        switch (_spr)
        {
            case 634:
                var _pal = ds_list_create();
                ds_list_add(_pal, 10405116);
                ds_list_add(_pal, 4551629);
                ds_list_add(_pal, 1916346);
                ds_list_add(_pal, 1316734);
                ds_list_add(_pal, 1381152);
                ds_list_add(_pal, 1332930);
                ds_list_add(_palettes, _pal);
                _pal = ds_list_create();
                ds_list_add(_pal, 16777215);
                ds_list_add(_pal, 2486759);
                ds_list_add(_pal, 1488060);
                ds_list_add(_pal, 1266000);
                ds_list_add(_pal, 995127);
                ds_list_add(_pal, 1488060);
                ds_list_add(_palettes, _pal);
                _pal = ds_list_create();
                ds_list_add(_pal, 10354604);
                ds_list_add(_pal, 8038502);
                ds_list_add(_pal, 4490792);
                ds_list_add(_pal, 4678448);
                ds_list_add(_pal, 1452311);
                ds_list_add(_pal, 2347334);
                ds_list_add(_palettes, _pal);
                _pal = ds_list_create();
                ds_list_add(_pal, 15662967);
                ds_list_add(_pal, 12951910);
                ds_list_add(_pal, 11435048);
                ds_list_add(_pal, 8078359);
                ds_list_add(_pal, 4203566);
                ds_list_add(_pal, 11435048);
                ds_list_add(_palettes, _pal);
                _pal = ds_list_create();
                ds_list_add(_pal, 11205119);
                ds_list_add(_pal, 4557005);
                ds_list_add(_pal, 1924026);
                ds_list_add(_pal, 1523067);
                ds_list_add(_pal, 1185313);
                ds_list_add(_pal, 1332930);
                ds_list_add(_palettes, _pal);
                _pal = ds_list_create();
                ds_list_add(_pal, 11205119);
                ds_list_add(_pal, 4557005);
                ds_list_add(_pal, 1924026);
                ds_list_add(_pal, 1523067);
                ds_list_add(_pal, 1185313);
                ds_list_add(_pal, 1332930);
                ds_list_add(_palettes, _pal);
                _pal = ds_list_create();
                ds_list_add(_pal, 15662967);
                ds_list_add(_pal, 12951910);
                ds_list_add(_pal, 11435048);
                ds_list_add(_pal, 8078359);
                ds_list_add(_pal, 4203566);
                ds_list_add(_pal, 11435048);
                ds_list_add(_palettes, _pal);
                _pal = ds_list_create();
                ds_list_add(_pal, 10354604);
                ds_list_add(_pal, 8038502);
                ds_list_add(_pal, 4490792);
                ds_list_add(_pal, 4678448);
                ds_list_add(_pal, 1452311);
                ds_list_add(_pal, 2347334);
                ds_list_add(_palettes, _pal);
                _pal = ds_list_create();
                ds_list_add(_pal, 16777215);
                ds_list_add(_pal, 2486759);
                ds_list_add(_pal, 1488060);
                ds_list_add(_pal, 1266000);
                ds_list_add(_pal, 995127);
                ds_list_add(_pal, 1488060);
                ds_list_add(_palettes, _pal);
                _pal = ds_list_create();
                ds_list_add(_pal, 10405116);
                ds_list_add(_pal, 4551629);
                ds_list_add(_pal, 1916346);
                ds_list_add(_pal, 1316734);
                ds_list_add(_pal, 1381152);
                ds_list_add(_pal, 1332930);
                ds_list_add(_palettes, _pal);
                break;
            case 441:
                var _pal = ds_list_create();
                ds_list_add(_pal, 12055540);
                ds_list_add(_pal, 0);
                ds_list_add(_pal, 8082284);
                ds_list_add(_pal, 6966080);
                ds_list_add(_pal, 4334126);
                ds_list_add(_palettes, _pal);
                break;
            case 471:
                var _pal = ds_list_create();
                ds_list_add(_pal, 5657786);
                ds_list_add(_pal, 9331816);
                ds_list_add(_pal, 5654081);
                ds_list_add(_pal, 5125688);
                ds_list_add(_pal, 4007723);
                ds_list_add(_palettes, _pal);
                break;
            case 525:
                var _pal = ds_list_create();
                ds_list_add(_pal, 16777215);
                ds_list_add(_pal, 6934995);
                ds_list_add(_pal, 2513288);
                ds_list_add(_pal, 1521235);
                ds_list_add(_palettes, _pal);
                break;
            case 544:
                var _pal = ds_list_create();
                ds_list_add(_pal, 16777215);
                ds_list_add(_pal, 13866676);
                ds_list_add(_pal, 14319274);
                ds_list_add(_pal, 9842272);
                ds_list_add(_palettes, _pal);
                break;
            case 531:
                var _pal = ds_list_create();
                ds_list_add(_pal, 16777215);
                ds_list_add(_pal, 12512209);
                ds_list_add(_pal, 7000727);
                ds_list_add(_pal, 2525286);
                ds_list_add(_pal, 1521235);
                ds_list_add(_palettes, _pal);
                break;
            case 551:
                var _pal = ds_list_create();
                ds_list_add(_pal, 0);
                ds_list_add(_pal, 4622246);
                ds_list_add(_pal, 0);
                ds_list_add(_pal, 5069431);
                ds_list_add(_pal, 3949915);
                ds_list_add(_palettes, _pal);
                break;
            case 562:
                var _pal = ds_list_create();
                ds_list_add(_pal, make_color_rgb(191, 74, 78));
                ds_list_add(_pal, make_color_rgb(125, 45, 47));
                ds_list_add(_pal, make_color_rgb(64, 64, 87));
                ds_list_add(_pal, make_color_rgb(54, 54, 54));
                ds_list_add(_pal, make_color_rgb(41, 41, 41));
                ds_list_add(_palettes, _pal);
                break;
            case 590:
                var _pal = ds_list_create();
                ds_list_add(_pal, 9687259);
                ds_list_add(_pal, 4960450);
                ds_list_add(_pal, 4603233);
                ds_list_add(_pal, 4735040);
                ds_list_add(_palettes, _pal);
                break;
            case 604:
                var _pal = ds_list_create();
                ds_list_add(_pal, 7655638);
                ds_list_add(_pal, 5398193);
                ds_list_add(_pal, 3223944);
                ds_list_add(_pal, 3487050);
                ds_list_add(_pal, 1579045);
                ds_list_add(_palettes, _pal);
                break;
            case 609:
                var _pal = ds_list_create();
                ds_list_add(_pal, 8966350);
                ds_list_add(_pal, 6056837);
                ds_list_add(_pal, 4737894);
                ds_list_add(_pal, 3945550);
                ds_list_add(_pal, 3813425);
                ds_list_add(_palettes, _pal);
                break;
            case 623:
                var _pal = ds_list_create();
                ds_list_add(_pal, 149693);
                ds_list_add(_pal, 117);
                ds_list_add(_pal, 8027515);
                ds_list_add(_pal, 7758416);
                ds_list_add(_pal, 3945779);
                ds_list_add(_palettes, _pal);
                break;
            case 667:
                var _pal = ds_list_create();
                ds_list_add(_pal, 10736083);
                ds_list_add(_pal, 9680283);
                ds_list_add(_pal, 9995126);
                ds_list_add(_pal, 7693189);
                ds_list_add(_pal, 3288110);
                ds_list_add(_palettes, _pal);
                break;
            case 685:
                var _pal = ds_list_create();
                ds_list_add(_pal, 12055540);
                ds_list_add(_pal, 0);
                ds_list_add(_pal, 0);
                ds_list_add(_pal, 4334126);
                ds_list_add(_pal, 0);
                ds_list_add(_palettes, _pal);
                break;
            case 698:
                var _pal = ds_list_create();
                ds_list_add(_pal, 12055540);
                ds_list_add(_pal, 8487381);
                ds_list_add(_pal, 4613050);
                ds_list_add(_pal, 5203632);
                ds_list_add(_pal, 3888271);
                ds_list_add(_palettes, _pal);
                break;
            case 708:
                var _pal = ds_list_create();
                ds_list_add(_pal, 6865111);
                ds_list_add(_pal, 10255513);
                ds_list_add(_pal, 9069190);
                ds_list_add(_pal, 7491667);
                ds_list_add(_pal, 4863298);
                ds_list_add(_palettes, _pal);
                break;
            case 652:
                var _pal = ds_list_create();
                ds_list_add(_pal, 0);
                ds_list_add(_pal, 14285565);
                ds_list_add(_pal, 7319788);
                ds_list_add(_pal, 1337763);
                ds_list_add(_pal, 0);
                ds_list_add(_palettes, _pal);
                break;
            case 639:
                var _pal = ds_list_create();
                ds_list_add(_pal, 5719127);
                ds_list_add(_pal, 5917515);
                ds_list_add(_pal, 4863800);
                ds_list_add(_pal, 3418409);
                ds_list_add(_pal, 0);
                ds_list_add(_palettes, _pal);
                break;
            case 520:
                var _pal = ds_list_create();
                ds_list_add(_pal, 16777215);
                ds_list_add(_pal, 14076361);
                ds_list_add(_pal, 11111821);
                ds_list_add(_palettes, _pal);
                break;
            case 458:
                var _pal = ds_list_create();
                ds_list_add(_pal, make_color_rgb(244, 243, 183));
                ds_list_add(_pal, make_color_rgb(147, 145, 102));
                ds_list_add(_pal, make_color_rgb(121, 114, 85));
                ds_list_add(_pal, make_color_rgb(99, 71, 95));
                ds_list_add(_pal, make_color_rgb(68, 49, 70));
                ds_list_add(_palettes, _pal);
                break;
            case 485:
                var _pal = ds_list_create();
                ds_list_add(_pal, make_color_rgb(255, 242, 0));
                ds_list_add(_pal, 0);
                ds_list_add(_pal, make_color_rgb(190, 203, 202));
                ds_list_add(_pal, make_color_rgb(162, 176, 196));
                ds_list_add(_pal, make_color_rgb(105, 108, 150));
                ds_list_add(_palettes, _pal);
                break;
            case 509:
                var _pal = ds_list_create();
                ds_list_add(_pal, make_color_rgb(187, 205, 160));
                ds_list_add(_pal, make_color_rgb(214, 153, 41));
                ds_list_add(_pal, make_color_rgb(162, 148, 128));
                ds_list_add(_pal, make_color_rgb(153, 121, 111));
                ds_list_add(_pal, make_color_rgb(73, 112, 67));
                ds_list_add(_palettes, _pal);
                break;
            case 1031:
                var _pal = ds_list_create();
                ds_list_add(_pal, make_color_rgb(235, 180, 12));
                ds_list_add(_pal, make_color_rgb(141, 84, 64));
                ds_list_add(_pal, make_color_rgb(96, 55, 55));
                ds_list_add(_pal, make_color_rgb(71, 41, 41));
                ds_list_add(_palettes, _pal);
                break;
        }
    }
    show_debug_message(string(_num) + " palettes added to the system from sprite: " + sprite_get_name(_spr));
}
else
{
    show_debug_message("That palette has already been added to the system.");
}
