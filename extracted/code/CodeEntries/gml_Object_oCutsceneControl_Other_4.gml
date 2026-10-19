with (other)
{
    switch (room)
    {
        case rCutscene1:
            alarm[0] = 600;
            caster_play(67, global.volume, 1);
            break;
        case rCutscene2:
            speed = -2;
            alarm[0] = 425;
            break;
        case rCutscene3:
            alarm[0] = 60;
            with (oShipCargo)
            {
                speed = 0;
            }
            with (oShipCargoHead)
            {
                speed = 0;
            }
            break;
        case rCutscene4:
            audio_play_sound(wCutsceneAlarm, 10, true);
            audio_sound_gain(wCutsceneAlarm, global.volume, 0);
            audio_play_sound(wWormBurning, 10, true);
            audio_sound_gain(wWormBurning, global.volume, 0);
            alarm[0] = 180;
            break;
        case rCutscene5:
            caster_play(67, global.volume, 1.2);
            alarm[0] = 240;
            break;
        case rCutscene6:
            alarm[0] = 120;
            break;
        case r2Cutscene2:
            white_alpha = 2;
            alarm[0] = 360;
            with (instance_create(x, y, oTypewriter))
            {
                text2 = "";
                if (!instance_exists(oEfGameBeat))
                {
                    text1 = "..and left, with everything but his humanity.";
                }
                else
                {
                    if (oEfGameBeat.class == 1)
                    {
                        text1 = "..and so he left, with everything but his humanity.";
                    }
                    if (oEfGameBeat.class == 2)
                    {
                        text1 = "..and so he left, mutated beyond recognition.";
                    }
                    if (oEfGameBeat.class == 3)
                    {
                        text1 = "..and so he left, with his pyrrhic plunder.";
                    }
                    if (oEfGameBeat.class == 4)
                    {
                        text1 = "..and so she left, her soul still remaining on the planet.";
                    }
                    if (oEfGameBeat.class == 5)
                    {
                        text1 = "..and so it left, servos pulsing with new life.";
                    }
                    if (oEfGameBeat.class == 6)
                    {
                        text1 = "..and so he left, more steel and circuit than man.";
                    }
                    if (oEfGameBeat.class == 7)
                    {
                        text1 = "..and so he left, adrenaline still rushing through his veins.";
                    }
                    if (oEfGameBeat.class == 8)
                    {
                        text1 = "..and so they left, the sound still ringing in deaf ears.";
                    }
                    if (oEfGameBeat.class == 9)
                    {
                        text1 = "..and so it left, with a new hunger; to be left alone.";
                    }
                    if (oEfGameBeat.class == 10)
                    {
                        text1 = "..and so he left, never to become human again.";
                    }
                    if (oEfGameBeat.class == 11)
                    {
                        text1 = "..and so he left, ready to rebuild his life, brick by brick.";
                    }
                    if (oEfGameBeat.class == 12)
                    {
                        text1 = "..and so it left, entirely forgetting its previous purpose.";
                    }
                }
            }
            break;
        case r2Cutscene3:
            white_alpha = 2;
            speed = -2;
            alarm[0] = 425;
            break;
    }
}
