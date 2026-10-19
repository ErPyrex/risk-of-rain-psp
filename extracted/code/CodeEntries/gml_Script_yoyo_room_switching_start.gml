switch (oInit.starting_level)
{
    case 1:
        var yyg_t = irandom_range(1, oInit.level[oInit.starting_level, 0]);
        switch (yyg_t)
        {
            case 1:
                var yyg_x = irandom_range(1, oInit.level[oInit.starting_level, 1]);
                switch (yyg_x)
                {
                    case 1:
                        room_goto(r1_1_1);
                        break;
                    case 2:
                        room_goto(r1_1_2);
                        break;
                    case 3:
                        room_goto(r1_1_3);
                        break;
                }
                break;
            case 2:
                var yyg_x = irandom_range(1, oInit.level[oInit.starting_level, 1]);
                switch (yyg_x)
                {
                    case 1:
                        room_goto(r1_2_1);
                        break;
                    case 2:
                        room_goto(r1_2_2);
                        break;
                    case 3:
                        room_goto(r1_2_3);
                        break;
                }
                break;
        }
        break;
    case 2:
        var yyg_t = irandom_range(1, oInit.level[oInit.starting_level, 0]);
        switch (yyg_t)
        {
            case 1:
                var yyg_x = irandom_range(1, oInit.level[oInit.starting_level, 1]);
                switch (yyg_x)
                {
                    case 1:
                        room_goto(r2_1_1);
                        break;
                    case 2:
                        room_goto(r2_1_2);
                        break;
                }
                break;
            case 2:
                var yyg_x = irandom_range(1, oInit.level[oInit.starting_level, 1]);
                switch (yyg_x)
                {
                    case 1:
                        room_goto(r2_2_1);
                        break;
                    case 2:
                        room_goto(r2_2_2);
                        break;
                }
                break;
        }
        break;
    case 3:
        var yyg_t = irandom_range(1, oInit.level[oInit.starting_level, 0]);
        switch (yyg_t)
        {
            case 1:
                var yyg_x = irandom_range(1, oInit.level[oInit.starting_level, 1]);
                switch (yyg_x)
                {
                    case 1:
                        room_goto(r3_1_1);
                        break;
                    case 2:
                        room_goto(r3_1_2);
                        break;
                }
                break;
            case 2:
                var yyg_x = irandom_range(1, oInit.level[oInit.starting_level, 1]);
                switch (yyg_x)
                {
                    case 1:
                        room_goto(r3_2_1);
                        break;
                    case 2:
                        room_goto(r3_2_2);
                        break;
                }
                break;
        }
        break;
    case 4:
        var yyg_t = irandom_range(1, oInit.level[oInit.starting_level, 0]);
        switch (yyg_t)
        {
            case 1:
                var yyg_x = irandom_range(1, oInit.level[oInit.starting_level, 1]);
                switch (yyg_x)
                {
                    case 1:
                        room_goto(r4_1_1);
                        break;
                    case 2:
                        room_goto(r4_1_2);
                        break;
                }
                break;
            case 2:
                var yyg_x = irandom_range(1, oInit.level[oInit.starting_level, 1]);
                switch (yyg_x)
                {
                    case 1:
                        room_goto(r4_2_1);
                        break;
                    case 2:
                        room_goto(r4_2_2);
                        break;
                }
                break;
        }
        break;
    case 5:
        var yyg_t = irandom_range(1, oInit.level[oInit.starting_level, 0]);
        switch (yyg_t)
        {
            case 1:
                var yyg_x = irandom_range(1, oInit.level[oInit.starting_level, 1]);
                switch (yyg_x)
                {
                    case 1:
                        room_goto(r5_1_1);
                        break;
                    case 2:
                        room_goto(r5_1_2);
                        break;
                }
                break;
        }
        break;
    case 6:
        var yyg_t = irandom_range(1, oInit.level[oInit.starting_level, 0]);
        switch (yyg_t)
        {
            case 1:
                var yyg_x = irandom_range(1, oInit.level[oInit.starting_level, 1]);
                switch (yyg_x)
                {
                    case 1:
                        room_goto(r6_1_1);
                        break;
                }
                break;
        }
        break;
}
