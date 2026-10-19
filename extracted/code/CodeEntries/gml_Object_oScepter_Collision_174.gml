if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    used = 1;
    if (other.scepter == 0)
    {
        switch (other.class)
        {
            case 1:
                other.sprite_shoot4_1 = 41;
                other.sprite_shoot4_2 = 42;
                other.skill[3, 0] = "Suppressive Barrage";
                other.skill[3, 1] = "Fires rapidly, stunning and hitting nearby enemies for 10x60% damage total.";
                other.skill[3, 4] += 1;
                break;
            case 2:
                other.skill[3, 0] = "Tear Gas";
                other.skill[3, 1] = "Launch a chemical grenade, fearing and knocking back enemies in a huge radius for 250% damage. Can bounce at shallow angles.";
                other.skill[3, 4] += 1;
                break;
            case 3:
                other.sprite_shoot4 = 86;
                other.skill[3, 0] = "Assassinate";
                other.skill[3, 1] = "Fire a headshot for 2x600% damage. If this ability kills an enemy, the Bandit's cooldowns are all reset to 0.";
                other.skill[3, 4] += 1;
                break;
            case 4:
                other.sprite_shoot4 = 148;
                other.skill[3, 0] = "Mk7 Rockeye";
                other.skill[3, 1] = "Fire an explosive arrow for 320% damage. The arrow drops bomblets that detonate for 12x80%.";
                other.skill[3, 4] += 1;
                break;
            case 5:
                other.skill[3, 0] = "UNETHICAL_REASSEMBLEY";
                other.skill[3, 1] = "APPLY GREAT FORCE TO ALL COMBATANTS FOR 400% DAMAGE, STUNNING, SHOCKING, AND KNOCKING THEM IN THE AIR";
                other.sprite_shoot4 = 106;
                other.skill[3, 4] = 14;
                break;
            case 6:
                other.skill[3, 0] = "Auto Turret Mk. 2";
                other.skill[3, 1] = "Drop a turret that shoots for 3x100% damage for 30 seconds. Hold up to 3.";
                other.v_stack_max = 3;
                break;
            case 7:
                other.skill[3, 0] = "Starbound";
                other.skill[3, 1] = "Jump into the air, hitting and stunning enemies below for 5x180% damage total.";
                other.skill[3, 4] += 1;
                break;
            case 8:
                other.skill[3, 0] = "Spotter: ISOLATE";
                other.skill[3, 1] = "Send your Spotter out to analyze the most dangerous enemy, slowing and increasing critical strike chance against it by 100%.";
                if (other.skill[3, 4] == 4)
                {
                    other.skill[3, 4] = 6;
                }
                break;
            case 9:
                other.sprite_shoot4 = 127;
                other.skill[3, 0] = "Pandemic";
                other.skill[3, 1] = "Release a deadly disease, poisoning enemies for 100% damage per second. The contagion spreads to two targets after 1 second. If an enemy is killed by Pandemic, you are healed.";
                other.skill[3, 4] += 1;
                break;
            case 10:
                other.sprite_shoot4 = 248;
                other.skill[3, 0] = "Massacre";
                other.skill[3, 1] = "Target the nearest enemy, quickly attacking them for 6x110% damage. You cannot be hit for the duration. Refreshes duration on kills, jumping to nearby enemies.";
                other.skill[3, 4] += 1;
                break;
            case 11:
                other.skill[3, 0] = "M700X Discharge Conduit";
                other.skill[3, 1] = "Place a lightning rod. After placing two, lightning surges between them, dealing 80% damage for 9 seconds and stunning intial enemies.";
                other.skill[3, 4] += 1;
                break;
            case 12:
                other.skill[3, 0] = "FULL COURSE MEAL";
                other.skill[3, 1] = "PREPARE A FIVE STAR MEAL, BOOSTING THE NEXT TWO ABILITIY CASTS";
                other.skill[3, 4] += 1;
                break;
        }
    }
    other.scepter += 1;
    collide_item();
}
