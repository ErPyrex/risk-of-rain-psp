init_item();
text1 = "Keycard";
text2 = "Opens locked doors on UES Contact Light.";
global.director.keycard_dropped += 1;
if (global.director.keycard_dropped >= 4)
{
    achievement_progress(43, 1);
}
tier = "p";
