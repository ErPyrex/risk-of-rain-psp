var name = argument0;
var buff = argument1;
var exists = 0;
with (name)
{
    if (!buff_count > -1)
    {
        with (other)
        {
            for (g = 0; g < name.buff_count; g += 1)
            {
                if (name.buff[g, 0] == argument1 && buff != 11 && buff != 20 && buff != 25)
                {
                    name.buff[g, 1] = argument2;
                    exists = 1;
                    break;
                }
                if (buff == 11 && name.buff[g, 0] >= 11 && name.buff[g, 0] <= 16)
                {
                    if (name.buff[g, 0] != 16)
                    {
                        name.critical_chance += 5 + (3 * (dice - 1));
                        name.buff[g, 0] += 1;
                    }
                    name.buff[g, 1] = argument2;
                    exists = 1;
                    break;
                }
                if (buff == 20 && name.buff[g, 0] >= 20 && name.buff[g, 0] <= 24)
                {
                    if (name.buff[g, 0] != 24)
                    {
                        name.armor -= 5;
                        name.buff[g, 0] += 1;
                    }
                    name.buff[g, 1] = argument2;
                    exists = 1;
                    break;
                }
                if (buff == 25 && name.buff[g, 0] >= 25 && name.buff[g, 0] <= 27)
                {
                    if (name.buff[g, 0] != 27)
                    {
                        name.attack_speed += (10 + wolfblood) * 0.01;
                        name.buff[g, 0] += 1;
                    }
                    name.buff[g, 1] = argument2;
                    exists = 1;
                    break;
                }
            }
            if (exists == 0)
            {
                name.buff[name.buff_count, 0] = argument1;
                name.buff[name.buff_count, 1] = argument2;
                name.buff_count += 1;
                if (buff == 28)
                {
                    name.attack_speed += 0.4;
                }
                if (buff == 10)
                {
                    name.attack_speed += 0.4;
                    name.damage += 4;
                    name.pHmax += 0.3;
                }
                if (buff == 11)
                {
                    name.critical_chance += 5 + (3 * (dice - 1));
                }
                if (buff == 20)
                {
                    name.armor -= 5;
                }
                if (buff == 25)
                {
                    name.attack_speed += (10 + wolfblood) * 0.01;
                }
                if (buff == 7)
                {
                    name.frozen = 1;
                    name.alarm[7] = argument2 / 2;
                }
            }
        }
    }
}
