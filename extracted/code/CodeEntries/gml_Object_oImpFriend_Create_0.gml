init_ai_default();
z_range = 40;
x_range = 200;
alarm[8] = 180;
init_imp();
elite = 2;
sound_hit = 96;
sound_death = 94;
damage = 19 * power(global.enemy_buff, global.damage_co);
critical_chance = 0;
hp = 610 * power(global.enemy_buff, global.hp_co);
maxhp = 610 * power(global.enemy_buff, global.hp_co);
knockback_cap = 42 * global.enemy_buff;
armor = 20;
team = "player";
tether_range_min = 60;
tether_range_max = 300;
skill[2, 0] = "";
skill[2, 1] = "tele";
skill[2, 2] = 60;
skill[2, 3] = 39;
skill[2, 4] = 0;
skill[2, 5] = 0.7;
spawn_quote = irandom_range(0, 10);
name = choose("Ugorn", "Bava", "Aetu", "Chir", "Yggo");
quote[0] = name + ", at your service..";
quote[1] = "Ah, a new master..";
quote[2] = "For life " + name + " will serve..";
quote[3] = name + ", your new hand..";
quote[4] = "You will soon learn to love it..";
quote[5] = name + ", at your command..";
switch (name)
{
    case "Ugorn":
        image_blend = #7C88B8;
        lightning = 2;
        quote[6] = "Strike twice..";
        quote[7] = "It is lightning that does the work..";
        quote[8] = "Do I.. shock you..?";
        quote[9] = "Smite them..!";
        quote[10] = "Can you hear it..? Ugorn's music..?";
        break;
    case "Bava":
        image_blend = #F3A556;
        explosive_shot = 3;
        quote[6] = "Blast them apart..";
        quote[7] = "Splatter them all..";
        quote[8] = "Shatter the earth..";
        quote[9] = "Leave them in pieces..";
        quote[10] = "H-ha! Hahaha!";
        break;
    case "Aetu":
        image_blend = #913DC2;
        gold_on_hit = 2;
        if (random(100) < 1)
        {
            quote[6] = "$25 for early access..? How devilish...";
        }
        else
        {
            quote[6] = "All that glitters..";
        }
        quote[7] = "Aetu will pave the way in gold..";
        quote[8] = "Aetu knows.. there's always a price..";
        quote[9] = "Embrace wealth..";
        quote[10] = "Seldom that profit loses..";
        break;
    case "Chir":
        image_blend = #EFD27B;
        quote[6] = "In the blink of an eye..";
        quote[7] = "You are slow.. much too slow..";
        quote[8] = "You slow me down..";
        quote[9] = "Let them cower in fear..";
        quote[10] = "Ah! Thrill of the hunt..";
        attack_speed = 1.3;
        pHmax *= 1.25;
        break;
    case "Yggo":
        image_blend = c_gray;
        image_xscale = 1;
        image_yscale = 1;
        hp = 1410 * power(global.enemy_buff, global.hp_co);
        maxhp = 1410 * power(global.enemy_buff, global.hp_co);
        knockback_cap = 100 * global.enemy_buff;
        quote[6] = "I carry your burden..";
        quote[7] = "Clear the way..";
        quote[8] = "Send Yggo right over..";
        quote[9] = "I will die.. to protect you..";
        quote[10] = "They cannot hurt me..";
        break;
}
hp_regen = maxhp * 0.000167;
