menu_level = 0;
choice = 0;
black_screen = 1;
item_choice = -1;
oInit.new_item_found = 0;
image_speed = 0.2;
for (i = 0; i <= global.item_number; i += 1)
{
    item[i, 0] = "";
    item[i, 1] = "";
    item[i, 2] = "";
    item[i, 3] = -1;
    item[i, 4] = 732;
    item[i, 5] = "";
    item[i, 6] = oInit.item_found[i];
    item[i, 7] = "";
    item[i, 8] = "";
}
item[0, 0] = "Meat Nugget";
item[0, 1] = "&y&8%&!& chance to &b&drop 2 meat nuggets&!& that &g&heals for 2x6 health.&!& ";
item[0, 2] = "Standard";
item[0, 4] = 722;
item[0, 5] = "1400, #Grahs Farm, #Earth";
item[0, 7] = "11/14/2056";
item[0, 8] = "MM. Delicious.##Just kidding, it's awful. I didn't know it was for petmunk, so I thought I would have a sample. BIG. MISTAKE. If its cubic shape wasn't enough to throw you off, it is grey, smelly, and cold. I have no idea why I ate it. Maybe I'm protein deficient. ";
item[1, 0] = "Fire Shield";
item[1, 1] = "After taking more than &r&10% of your health&!& as damage, explode for &y&200% damage.&!&";
item[1, 2] = "Standard";
item[1, 4] = 729;
item[1, 5] = "Soloman#-#Backwaters#Mars";
item[1, 7] = "6/06/2056";
item[1, 8] = "The thing is only half-done, but it will do the job. The flux-chains are very unstable, resulting in a large explosion when struck. PLEASE handle with care!";
item[2, 0] = "Bustling Fungus";
item[2, 1] = "After 2 seconds, &g&heal for 4.5% of your health&!& every second.";
item[2, 2] = "&g&Priority&!&";
item[2, 4] = 740;
item[2, 5] = "5243 22nd, #Rolling Fields, #Earth";
item[2, 7] = "11/9/1753";
item[2, 8] = "The strongest biological healing agent.. is a mushroom. Found in an abandoned house. I find some humor in that.#This fungus has developed an amazing defense mechanism of hiding underground when bothered, allowing it to live long enough to distribute spores. 
#Can be either ground into a paste or.. planted directly into the wound. A small warning; you'll feel it enter you, and it is every bit as unpleasant as it sounds.";
item[3, 0] = "Lens Maker's Glasses";
item[3, 1] = "Your attacks have a &y&10% chance&!& to &y&critically strike, dealing double damage&!&";
item[3, 2] = "Standard";
item[3, 4] = 739;
item[3, 5] = "Greivenkamp#5th Houston St.#Prism Tower#Earth";
item[3, 7] = "4/29/2056";
item[3, 8] = "Calibrated for high focal alignment. Should allow for the precision you were asking for. I must ask.. for what reasons do you need such glasses? Surely the Department of Science would provide them for you?
#I can't think of a single.. scientific reason why you would want this. Have you been hired by [REDACTED]? If you're in trouble, you can always ask me for help.";
item[4, 0] = "Sprouting Egg";
item[4, 1] = "After not being hit for 7 seconds, increase &g&health regen&!& by &g&2.4&!& per second";
item[4, 2] = "Standard";
item[4, 4] = 731;
item[4, 5] = "Battle Creek#49017 Mars";
item[4, 7] = "09/17/2056";
item[4, 8] = "This egg seems to be somewhere between hatching and dying. Leaving it undisturbed usually causes it to wiggle around a bit, maybe sticking a tendril out. Trying to remove it from its shell is greeted by the most horrible screetching!
#I can't bring it to myself to cook it alive. I don't know what to do with it, so here you go; maybe it will hatch in a warmer climate like yours. As useless as he is, I have grown a bit fond of him. Please take care!";
item[5, 0] = "Headstompers";
item[5, 1] = "Hurt enemies by falling for up to &y&507% damage&!&.";
item[5, 2] = "Standard";
item[5, 4] = 727;
item[5, 5] = "200, #Maple Lane, #Mars";
item[5, 7] = "5/11/2005";
item[5, 8] = "Have you found the kill-count of your shoes to be 0? Do you find that disturbing? So do we. Combat Ready Spikeshoes, lovingly nicknamed 'Headstompers,' allow you to get the drop on foes. Literally. Vertically.
#Titanium-tipped spikes, along with steel soles, guarantee that landing on foes will result in the messiest recreation of old school video games that you have ever seen. NOTE: Spikes deploy only after reaching a certain vertical velocity.";
item[6, 0] = "Life Savings";
item[6, 1] = "Generate &y&$1&!& every 3 seconds ";
item[6, 2] = "Standard";
item[6, 4] = 738;
item[6, 5] = "moms house";
item[6, 7] = "02/22/2056";
item[6, 8] = "hi im billy and heer is money for mom thanks";
item[7, 0] = "Barbed Wire";
item[7, 1] = "Touching enemies deals &y&50% damage/sec.&!&";
item[7, 2] = "Standard";
item[7, 4] = 736;
item[7, 5] = "D. Sherman#NLTS Way";
item[7, 7] = "04/29/2056";
item[7, 8] = "Great big bundle of barbed wire! Should help you.. 'catch fish?' Not sure what use barbed wire is for catching fish, but all the power to ya!
Should have about 500 ft included. The safety layer dissolves in water, so simply drop it on your tub and its ready to roll.
#Disclaimer: I, or my company, am not responsible for any bodily harm delivered to..";
item[8, 0] = "Rusty Knife";
item[8, 1] = "&r&15% chance to bleed&!& an enemy for &y&4x35% damage.&!&";
item[8, 2] = "&y&Standard/Biological&!&";
item[8, 4] = 730;
item[8, 5] = "NYPD#5351 and 4th#EARTH";
item[8, 7] = "2/28/2056";
item[8, 8] = "Murder weapon, case name ELIAS. Probably a lover's spat? Make sure to box it; I've heard some men in suits were asking around. #There is still dried blood on the knife, so mark it as biological.";
item[9, 0] = "Mysterious Vial";
item[9, 1] = "Increase &g&health regeneration&!& by &g&1.2&!& per second";
item[9, 2] = "Standard/Fragile";
item[9, 4] = 733;
item[9, 5] = "Sheridan S.#4000 15th Ave#UNITED STATES#Earth";
item[9, 7] = "03/06/2056";
item[9, 8] = "Apply to skin for a rapidly acting gel that contains both antiseptics and an agent to encourage protein synthesis!
#Small wounds applied with our gel should heal within a maximum of 5 hours, while broken bones and torn ligaments may take a few weeks.
#NOTE: Side effects may include itching, rashes, bleeding, sensitivity of skin, dry patches, permanent scarring, misaligned bone regrowth, rotting of the..";
item[10, 0] = "Mortar Tube";
item[10, 1] = "&y&9%&!& chance to fire a mortar for &y&170% damage&y&";
item[10, 2] = "Standard";
item[10, 4] = 742;
item[10, 5] = "437 West, #Old Bunker, #Earth";
item[10, 7] = "5/19/1946";
item[10, 8] = "Well, uh.. it's a little outdated. You stick explosives down the end, then you fire the explosive. With more explosives. If you're trying to reduce your injury rate, don't use these. 
#Other than its archaic design, the mortar tube is actually pretty decent if you get a lot of them in a battery. Can blanket a big area, like [REDACTED]. I suppose you can beat them with the tube afterwards.";
item[11, 0] = "Warbanner";
item[11, 1] = "On &g&level up&!& drop a banner. &b&Raise&!& attack/move speed by &y&30%&!& and damage by &y&4&!&.";
item[11, 2] = "Standard";
item[11, 4] = 724;
item[11, 5] = "Jungle VII, #Museum of 2019, #Earth";
item[11, 7] = "11/5/1843";
item[11, 8] = "Very very valuable. Don't drop it; it's worth more than you.
#What is it? Well, are you blind? It's obviously a warbanner from the War of 2019 from one of the rebel groups. Yes, maybe a little overdramatic, but inspiring nonetheless. They say - they say that warbanners won the war for them. Gave them.. magical strength. ";
item[12, 0] = "Monster Tooth";
item[12, 1] = "Killing an enemy heals you for &g&10 health.&!&";
item[12, 2] = "Standard";
item[12, 4] = 734;
item[12, 5] = "421 Lane, #Lab [21], #Mars";
item[12, 7] = "10/28/2056";
item[12, 8] = "Ripped it RIGHT out of 'is mouth! A big fight that one gave me, I tell ya! Wrestled me right down, jaws wrapped around my head! Good thing Bishop here got him with that vaporiser, eh? Hahaha!
#It's been my good luck charm for a while, but hey, with the money you're payin' for it I'll give 'er up. Sometimes I feel like it helped me on hunts though, ya know? Like.. instincts.";
item[13, 0] = "Crowbar";
item[13, 1] = "Deal +50% damage to enemies above 80% health.";
item[13, 2] = "Standard";
item[13, 4] = 720;
item[13, 5] = "Life Tower, #South Wing, #Venus";
item[13, 7] = "9/1/2056";
item[13, 8] = "Crowbar/prybar/wrecking bar allows for both prying and smashing! Carbon steel, so it should last for a very long time, at least until the 3rd edition arrives.";
item[14, 0] = "Medkit";
item[14, 1] = "&g&Heal for 10 health&!& after &b&1.1 seconds&!& of getting hit. ";
item[14, 2] = "Standard";
item[14, 4] = 725;
item[14, 5] = "9119, #Bit Hospital, #Mars";
item[14, 7] = "11/2/2056";
item[14, 8] = "Alright, big shipment coming in. Each Medkit should contain bandages, sterile dressings, soap, antiseptics, saline, gloves, scissors, aspirin, codeine, and an Epipen. Should be a huge step up from what you had before, and should.. uh, prevent any future problems like last week. 
#Thanks.";
item[15, 0] = "Bundle of Fireworks";
item[15, 1] = "Fire &y&8 fireworks&!& that deal &y&300% damage.&!&";
item[15, 2] = "Standard";
item[15, 4] = 718;
item[15, 5] = "PNO Fireworks#Quarter 1#Earth";
item[15, 7] = "07/04/2056";
item[15, 8] = "Yeah, celebration! Bought these from a friend, forgot where he said he got them. I'm glad that we finally re-legalized residential use of fireworks in 2054 after the... well, the terrorist attacks. Disguising homing missiles as fireworks? Don't ever quote me on it, but it was pretty smart.
Anyways, these are for your kids to use. Have fun!";
item[16, 0] = "Taser";
item[16, 1] = "&y&7% chance&!& to &y&snare&!& enemies for &y&1.5&!& seconds.";
item[16, 2] = "Standard";
item[16, 3] = 53;
item[16, 4] = 717;
item[16, 5] = "94123 Bldg. 201, #Fort Mason";
item[16, 7] = "11/14/2056";
item[16, 8] = "You say you can fix 'em? These tasers are very very faulty; got a few of my officers hurt they did. They fire, but they don't do nothin' like, 99% of the time! My department is running low on money, so I expect a good deal for these!";
item[17, 0] = "Paul's Goat Hoof";
item[17, 1] = "Run &b&20% faster.&!&";
item[17, 2] = "Standard";
item[17, 3] = 5;
item[17, 4] = 737;
item[17, 5] = "2663rd#Fields,Redmound#Venus";
item[17, 7] = "03/27/2056";
item[17, 8] = "A hoof from one of my goats; I noticed one day that one of my goats had an abnormaly large foot. Thinking it was cancerous, I went to the doctors and lo-and-behold; it was. My goat died shortly after.";
item[18, 0] = "Bitter Root";
item[18, 1] = "Gain &g&8% max hp&!&";
item[18, 2] = "Standard";
item[18, 3] = 38;
item[18, 4] = 728;
item[18, 5] = "103 110th, #Northlake, #Mars";
item[18, 7] = "6/4/2056";
item[18, 8] = "Biggest. Ginseng. Root. Ever.
#Not really, but it's pretty freakin' huge. You can boil it or sun dry it, whatever you want. I'll be curious to see if your cancer research actually pans out; sounds like voodoo magic to me, herbal medicine, but if the natives say it works, it works. ";
item[19, 0] = "Sticky Bomb";
item[19, 1] = "8% to attach a bomb to an enemy, detonating for 140% damage.";
item[19, 2] = "Standard";
item[19, 3] = 24;
item[19, 4] = 719;
item[19, 5] = "Painted-Rock, #B.Water, #Neptune";
item[19, 7] = "3/8/2056";
item[19, 8] = "Jesus, okay. The only reason I'm sending you guys another shipment is because of what you did for Shelby. Consider that debt paid.
#Since you APPARENTLY didn't get my message the first time, I'll tell you again. See the orange end? Don't touch it. Once you take the wrapping off, the adhesive is ACTIVE. DON'T TOUCH IT. YOU STICK THAT END ON BAD THINGS, NOT YOURSELF. 
#The cadets? Those lives are on you, not me.";
item[20, 0] = "Soldier's Syringe";
item[20, 1] = "Increased &y&attack speed by 15%.&!&";
item[20, 2] = "Standard";
item[20, 3] = 2;
item[20, 4] = 735;
item[20, 5] = "1803#Combat Zone#Venus";
item[20, 7] = "08/1/2056";
item[20, 8] = "Should help with multi-purpose requirements needed of soldiers. Contains vaccinations, antibiotics, pain killers, steroids, heroine, gasoline.. and something that feels like burning. 
Use standard procedures for injections.. clean the area, sterilize, no air, give them a candy, etc.
#Works for my boys, so no reason it shouldn't work for yours! The more shots the better; very few of my men have actually died from overdosing on it. Most just get sick.";
item[21, 0] = "Snake Eyes";
item[21, 1] = "Failing a shrine &b&increases&!& critical chance by &y&6%&!&";
item[21, 2] = "Standard";
item[21, 3] = 45;
item[21, 4] = 723;
item[21, 5] = "1843, #GMG Services, #Venus";
item[21, 7] = "1/1/2056";
item[21, 8] = "You dirty ---------er. You KNEW I had to win to pay off my debts. Are you in with the casinos? Of course you are; a snake like you would. A dice that's loaded for SNAKE EYES. CUTE MOVE, --------er.
#I'm comin' for you, ----.";
item[22, 0] = "Hermit's Scarf";
item[22, 1] = "10% chance to evade an attack.";
item[22, 2] = "Standard";
item[22, 3] = 21;
item[22, 4] = 721;
item[22, 5] = "1782-Left, #M. Rover, #Sun Orbital";
item[22, 7] = "7/17/2056";
item[22, 8] = "So you know the solar flare, from a few days ago? Well it destroyed the lower district, and I was on clean-up crew. 
#Found this scarf in the rubble, essentially untouched. All these dead bodies and strewn pieces, and this scarf is peeking out like some ----in flag. I know I shouldn't have taken it home, but I did. I.. feel safer with it. This thing survived that horrible day, it must be able to survive whatever I have to endure, right? Haha..";
item[23, 0] = "Gasoline";
item[23, 1] = "Killing enemies burns the ground for &y&60% damage&!& for &y&2 seconds&!&";
item[23, 2] = "Standard";
item[23, 3] = 0;
item[23, 4] = 743;
item[23, 5] = "Gas Station#Mars#Old Lincoln";
item[23, 7] = "02/25/2056";
item[23, 8] = "Gasoline, eh? Surprising to find a gas station these days, with everyone drivin' around them electro cars.
Got yourself quite a few gallons, so for the few cars and planes left runnin on gas.. this should do it!
Very flammable, even the fumes, so be careful now!";
item[24, 0] = "Spikestrip";
item[24, 1] = "When hit, drops spikestrips that &b&slow enemies by 20%&!&.";
item[24, 2] = "Standard";
item[24, 3] = 15;
item[24, 4] = 741;
item[24, 5] = "300, #Enf. Station, #Jupiter";
item[24, 7] = "1/18/2056";
item[24, 8] = "Hey bud! Do you remember... summer of 2032, was it? The night with Alicia? Well, um, remember when we got waay too drunk and broke into the police station? Well, I still have those spikestrips from then. Haha, good times right? 
#The doctors say I don't have much time left. Since you're in the force now and all, I felt obligated to return it to you! Haha. So.. yeah. Hope you're doing well. It's been lonely here without you.";
item[25, 0] = "Time Keeper's Secret";
item[25, 1] = "Falling to low health stops time for 3 seconds.";
item[25, 2] = "&g&Priority&!&";
item[25, 4] = 751;
item[25, 5] = "5th Ave, #Limbo Road, #Mars";
item[25, 7] = "7/13/2056";
item[25, 8] = "My old grandfather's hourglass. As the Time Keeper in the Hall of The Revered, he valued this hourglass a lot. He claimed that it would keep him safe in times of danger. For some reason, the sand never seems to run out! That's all an illusion, however. There must be some mechanism at the bottom of the hourglass that replenishes the top well. Very cute.
#My old grandfather's hourglass. As the Time Keeper in the..";
item[26, 0] = "Smart Shopper";
item[26, 1] = "Killed enemies drop &y&25% more gold.&!&";
item[26, 2] = "&g&Priority&!&";
item[26, 4] = 769;
item[26, 5] = "200 West Street, #City of Gold, #Earth";
item[26, 7] = "12/24/1962";
item[26, 8] = "Honey! HONEY! Look! I /told/ you I still had enough left over! Yeah, weird huh? I swear the last $5 I used was the last one I had in my purse, but then when I looked again, I still had a bit left over. Strange, huh? 
#Maybe it's black magic, haha! Honey?";
item[27, 0] = "Infusion";
item[27, 1] = "Killing an enemy increases your &r&health permanently by 1.&!&";
item[27, 2] = "&g&Priority/Biological&!&";
item[27, 4] = 768;
item[27, 5] = "Rage Valley, #Fleet Hanger, #Mars";
item[27, 7] = "02/8/2056";
item[27, 8] = "Contains samples from bears, leeches, tigers, elephants, elephant sharks, sharks, bull sharks, ants, and anteaters. Simply hook up to a dialysis machine along with the necessary equipment and swap out your blood for genetically superior ones!
#You can add whatever blood sample you want, as far as I know. Just make sure you take the pills that allow the body to accept the new blood, or your body will reject the cross-species infusion. Remember that sampling from other animals is a great basis for experimentation!";
item[28, 0] = "Will-o'-the-wisp";
item[28, 1] = "33% chance on killing an enemy to create a lava pillar for 500% damage.";
item[28, 2] = "&g&Priority&!&";
item[28, 4] = 750;
item[28, 5] = "Hidden Cubby, #Mt. Creation, #Venus";
item[28, 7] = "9/28/2056";
item[28, 8] = "Found the little thing on my last hike up. Tiny guy; must be a baby. He (she?) doesn't seem to eat anything at all, so I'm hoping you guys can help the fella out. I don't think he can get out of the jar; it hasn't made any attempt to.";
item[29, 0] = "AtG Missile Mk. 1";
item[29, 1] = "A &y&10% chance&!& on hitting an enemy to fire a missile that deals &y&300% damage&!&";
item[29, 2] = "&g&MILITARY&!&";
item[29, 4] = 765;
item[29, 5] = "Fort Joseph#Belt Num.1053#[REDACTED]#Boron System";
item[29, 7] = "[REDACTED]";
item[29, 8] = "Shipment of [REDACTED] AtG Viper Missiles for Fort Joseph. 
#Lightweight and attachable to torso for free use of both hands. Can store up to 120 heat-seaking missiles, which is just what your men need to fight off the [REDACTED]";
item[30, 0] = "Tough Times";
item[30, 1] = "Increase &b&armor by 14&!&";
item[30, 2] = "&g&Priority&!&";
item[30, 4] = 757;
item[30, 5] = "18601, #Frozen Valley, #Jupiter";
item[30, 7] = "9/29/2056";
item[30, 8] = "" + '"' + "Bears are just about the only toy that can lose just about everything and still maintain their dignity and worth." + '"' + " - Samantha Armstrong.
#Don't forget, hon. I'm coming home soon. Stay strong.";
item[31, 0] = "Energy Cell";
item[31, 1] = "Increased &b&attack speed&!& by up to &y&40%&!& at &g&lower health.&!&";
item[31, 2] = "&g&Priority&!&";
item[31, 4] = 754;
item[31, 5] = "6511, #CronTech Labs, #Mars";
item[31, 7] = "11/9/2056";
item[31, 8] = "FOR: ----- - J. 
CC #: ---- ---- - ---
ACCT #: 200158
Use ONLY in fusion - based vehicles and machinery. Do NOT upload to mainframe.";
item[32, 0] = "Rusty Jetpack";
item[32, 1] = "Decrease gravity by &b&50%&!& and increase jump height by &b&10%&!&";
item[32, 2] = "&g&Priority&!&";
item[32, 4] = 761;
item[32, 5] = "Fun Center#2105#NE Taurus";
item[32, 7] = "01/01/2056";
item[32, 8] = "Sorry, it seems to be broken. It only works for a split second; maybe I'll send you a fully working jetpack in a few months? Should work well enough for the carnival! 
Make sure to keep the kiddos away from the bottom; it shoots out quite a jet. Can make for fun obstacle challenges.";
item[33, 0] = "Leeching Seed";
item[33, 1] = "Dealing damage heals you for &g&2 health.&!&";
item[33, 2] = "&g&Priority/Biological&!&";
item[33, 4] = 760;
item[33, 5] = "3030 Matlock, #Prod. Facility #Mars";
item[33, 7] = "08/4/2056";
item[33, 8] = "These seeds are recently germinating, so be quick! These flesh-infesting pods seem to burrow, balloon, and then pop in a few months. Most test patients have.. died. However, before they die, they feel increased health and state of mind! 
In fact, the pods themselves seem to develop spores, which if collected can be turned into a pain reliever.. 
#Find a way to stop its growth cycle at that state, and you have yourself a great healing agent.";
item[34, 0] = "Ukulele";
item[34, 1] = "&y&20% chance&!& to fire chain lightning for &y&4x33% damage&!&";
item[34, 2] = "&g&Priority&!&";
item[34, 4] = 764;
item[34, 5] = "Whaley Station,#Box.364 #Mars";
item[34, 7] = "06/6/2056";
item[34, 8] = "Very rare artifact! An ancient ukulele, from the legendary artist born on Mars. It was said that he was a son of a god, gifted with the power of lightning himself. 
People say that he was the most humble man.. and that his music was simply.. electric!
#NOTE: No tests have managed to make the ukulele actually generate electricity. Use with care.";
item[35, 0] = "Boxing Gloves";
item[35, 1] = "Hitting enemies have a 15% chance to &b&knock them back.&!&";
item[35, 2] = "Standard";
item[35, 4] = 770;
item[35, 5] = "O.B.-GYM, #Slam Station, #Venus";
item[35, 7] = "7/7/2056";
item[35, 8] = "These should work fine for the kids you're training. A bit musty, though. It'll make your trainees hit like a pro, ha!";
item[36, 0] = "Prison Shackles";
item[36, 1] = "&b&Slow enemies by 20%&!& on every attack.";
item[36, 2] = "&g&Priority&!&";
item[36, 4] = 767;
item[36, 5] = "94123 Bldg. 201, #Fort Mason";
item[36, 7] = "02/6/2056";
item[36, 8] = "An artifact from the old ages, before we used holo-cuffs. The advantage is that EMP blasts and remote-hacking can't disable good-old steel and chains. Fitting this on larger prisoners may be harder.
I know you guys have been having a serious break-out problem in the last few months, and this is sure to throw those prison breakers for a loop. Just don't lose the key.
#We are shipping about.. 500, because we have nothing better to do with them then smelt them for steel, which is barely worth more than dirt this day and age. Would probably cost more then getting rid of them.";
item[37, 0] = "Guardian's Heart";
item[37, 1] = "Gain a &b&60 health shield&!&. Recharges in &b&7&!& seconds.";
item[37, 2] = "&g&Priority/Biological&!&";
item[37, 4] = 766;
item[37, 5] = "1100 Fairview, #Research Center #Mars";
item[37, 7] = "09/16/2056";
item[37, 8] = "Test subject 150053 results. While living, the subject had advanced muscle growth, cell regeneration, higher agility, and increased intelligence, along with a blue hue to his skin. 
On 08/23/2056, the subject broke free of his restraints and freed all other test subjects. All test subjects, including 150053, were terminated.
#His heart seems to still beat independent of the rest of his body. Perhaps a transplant into another subject can continue research.";
item[38, 0] = "Hopoo Feather";
item[38, 1] = "Gain &b&another jump.&!&";
item[38, 2] = "&g&Priority/Biological&!&";
item[38, 4] = 746;
item[38, 5] = "2341 NE#RKR Center#Io";
item[38, 7] = "07/03/2056";
item[38, 8] = "A feather from the hopoo, found only natively in Europa. Ever since its extreme light-weight vs tensile strength was discovered, the hopoo was almost driven to extinction from poaching. There are only 3 left; I hope you can keep their locations safe.";
item[39, 0] = "Frost Relic";
item[39, 1] = "Killing an enemy surrounds you with &y&3 icicles that deal 3x33% damage.&!&";
item[39, 2] = "&g&Priority&!&";
item[39, 4] = 744;
item[39, 5] = "10681, #Frozen Valley, #Pluto";
item[39, 7] = "3/14/2056";
item[39, 8] = "Biggest snowflake, to date. Technically, it isn't a snowflake, it's just a chunk of ice, but STILL. That's hard to sell as a museum piece. Anyways, the thing is hard as rock; I got drunk one day and dropped it on the floor, and it went right through, so don't worry about transportation.";
item[40, 0] = "Red Whip";
item[40, 1] = "Leaving combat for 1.5 seconds boosts your &b&movement speed by 80%.&!&";
item[40, 2] = "&g&Priority&!&";
item[40, 4] = 745;
item[40, 5] = "Violet Heights#Elderly Home#Venus";
item[40, 7] = "01/01/2057";
item[40, 8] = "I know exactly why you want these and I want you to never tell me.";
item[41, 0] = "Chargefield Generator";
item[41, 1] = "Killing an enemy generates a lightning ring, dealing 100% damage.";
item[41, 2] = "&g&Priority&!&";
item[41, 3] = 48;
item[41, 4] = 749;
item[41, 5] = "Research Center, #Polarity Zone, #Neptune";
item[41, 7] = "11/30/2056";
item[41, 8] = "You know those anti-theft devices you can stick on your car? Yeah, it's like that, but for an individual. How it is used is up to you guys; first thought is military or self-protection.
#You need to charge it generally after every use. It can /actually/ be charged off of bio-electrical signals, which sounds strange because of how weak they are, but in times of desperation we've found that effective as well. Up to you.";
item[42, 0] = "Arms Race";
item[42, 1] = "&y&9%&!& chance for &b&drones&!& to fire &y&missiles and mortars&!&";
item[42, 2] = "&g&Priority&!&";
item[42, 3] = 18;
item[42, 4] = 753;
item[42, 5] = "9834, #Cortical Fund, #Mars";
item[42, 7] = "8/3/2056";
item[42, 8] = "Psst. Hey. Yeah, I'm whispering over text.
#So the upgrades for your drones are in. It's compatible with all KS-I slotted drones, even the non-combat oriented ones, so you can refurbish some of your cleaning units to help in the fight. Strap it onto the back, and the drone AI should sort itself out. Contains both a missile and mortar launcher. Let's continue this arms race, eh?";
item[43, 0] = "Golden Gun";
item[43, 1] = "Deal &y&bonus damage per gold&!&, up to &y&40% damage at 700 gold.&!& Scales with time.";
item[43, 2] = "&g&Priority&!&";
item[43, 3] = 42;
item[43, 4] = 762;
item[43, 5] = "James. B#??";
item[43, 7] = "12/19/1974";
item[43, 8] = "Was this supposed to.. intimidate me? I do like its look, however; perhaps I'll set it above my fireplace.";
item[44, 0] = "56 Leaf Clover";
item[44, 1] = "Elite mobs have a &b&4% chance to drop items&!&";
item[44, 3] = 7;
item[44, 2] = "&g&Priority&!&";
item[44, 4] = 756;
item[44, 5] = "777, #Lucky Drop, #Earth";
item[44, 7] = "12/24/2056";
item[44, 8] = "A FIFTY-FREAKIN-SIX leaf clover! It was sent to me from a fan, picked from the top of Mount Drummond. It lived through the mountain fire; imagine that! I'm keeping it in observation to make sure it doesn't wilt; this is a once in a lifetime specimen! Think of all the elixirs we could make.. I may use a few of them myself and go hit the lottery!";
item[45, 0] = "Concussion Grenade";
item[45, 1] = "&y&6% chance&!& to &y&stun&!& enemies for &y&2&!& seconds.";
item[45, 2] = "&g&Priority&!&";
item[45, 3] = 25;
item[45, 4] = 759;
item[45, 5] = "20016 Bay, #Longbranch, #Mars";
item[45, 7] = "07/14/2056";
item[45, 8] = "Designed to detonate directly on impact and disorient targets. Fires pellets intended for stunning, not for killing! SWAT teams will love these, but any men you have on the field should use fragmentation grenades instead.
#Pull the pin and throw in the general direction of the bad guys. If you can't figure it out, you deserve to get hurt.";
item[46, 0] = "Filial Imprinting";
item[46, 1] = "Drops attack speed/health regen/move speed buffs every 20 seconds.";
item[46, 2] = "&g&Priority&!&";
item[46, 3] = 41;
item[46, 4] = 747;
item[46, 5] = "Row E, #Mutation Hold, #Earth";
item[46, 7] = "4/14/2056";
item[46, 8] = "You didn't tell me the roe was FERTILIZED. Good lord! Anyways, one of the suckers actually hatched, and have been nothing but friendly to me. Filial imprinting, perhaps.
#I quite like the little guy. He's almost dog-like in how affectionate he is to me. I.. have begun to care a lot about the thing. I've been feeding him nutapples and he seems to enjoy it, but I doubt that's very nutritious. Suggestions?";
item[47, 0] = "Dead Man's Foot";
item[47, 1] = "Drop a poison mine at low health for &y&4x150% damage.&!&";
item[47, 2] = "&g&Field-found&!&";
item[47, 3] = 36;
item[47, 4] = 755;
item[47, 5] = "Planet IV, #R.Night, #???";
item[47, 7] = "3/17/2056";
item[47, 8] = "Poor guy. It looked like he was infested by some bug-like creatures, and exploded when I got close. I hope his death wasn't too painful; his family will know how he died. Rest in peace.";
item[48, 0] = "Toxic Worm";
item[48, 1] = "&r&Infect&!& enemies, dealing &y&50% damage/sec&!&. Bounces to other enemies on death.";
item[48, 2] = "&g&Biological/Live Animal&!&";
item[48, 3] = 33;
item[48, 4] = 758;
item[48, 5] = "Carolyn Williams#Rare/Extinct#Study Center#Venus";
item[48, 7] = "07/02/2056";
item[48, 8] = "Extremely interesting species found on OMEGA-19. Resembles a worm, snake, or limbless lizard. Seems to exude poison from its glands, so much that the 'worm' can't even contain it in its mouth.
#May be a strain of stomach parasites found on other planets, but obviously much larger and deadlier. I hope you find some interesting knowledge from this species; it killed 16 of our workers alone. 
It also seemed to give offspring every time, but we have only found 13. Please respond quickly.";
item[49, 0] = "Harvestor's Scythe";
item[49, 1] = "Gain &r&5% critical chance&!&. Critical strikes &g&heal for 12 health.&!&";
item[49, 2] = "&g&Priority&!&";
item[49, 3] = 44;
item[49, 4] = 771;
item[49, 5] = "Goodland Fields, #South lot, #Earth";
item[49, 7] = "6/12/2009";
item[49, 8] = "It takes a brave man to look death in the eye and claim they don't need help.";
item[50, 0] = "Panic Mines";
item[50, 1] = "Drop a mine at low health for &y&500% damage.&!&";
item[50, 2] = "&g&Priority&!&";
item[50, 3] = 27;
item[50, 4] = 763;
item[50, 5] = "107.22.188.221, #Crater Lake, #Neptune";
item[50, 7] = "05/17/2056";
item[50, 8] = "Must be strapped onto vehicles, NOT personnel! After taking heavy fire, the automatic dispenser should drop and arm a mine to make a hasty retreat (or blow enemies sky-high who are dumb enough to follow.)
Includes smart-fire, but leave the blast radius regardless. The laws of physics don't pick sides. Very high yield for how small it is.
#If you want to use it offensively.. then.. well just get shot. A lot. Preferably by small arms fire, or you'll die trying to have the mines drop.";
item[51, 0] = "Predatory Instincts";
item[51, 1] = "Critical strikes increase attack speed by 10%. Stacks up to 30%.";
item[51, 2] = "&g&Priority&!&";
item[51, 3] = 22;
item[51, 4] = 748;
item[51, 5] = "19453, #Plot 12, #Earth";
item[51, 7] = "2/19/2016";
item[51, 8] = "Wolves. Nasty creatures. Was tendin' my crops, then a pack of 'em come out. I thought the mine field finished them all off, but the big guy, the alpha dog, was still around. Came RIGHT after me. Gut the thing right then and there. The hunter is now the hunted, eh? You ain't sayin much anymore, are ya?";
item[52, 0] = "Thallium";
item[52, 1] = "Damage/slow by &y&500 enemy damage%&!& and &b&100% speed&!& over &y&3 seconds.&!&";
item[52, 2] = "&r&High Priority/Fragile&!&";
item[52, 4] = 778;
item[52, 5] = "0909, #K&K Union, #Earth";
item[52, 7] = "5/14/2056";
item[52, 8] = "She shouldn't notice.";
item[53, 0] = "Tesla Coil";
item[53, 1] = "&y&Shock&!& nearby enemies for &y&150% damage&!&";
item[53, 2] = "&r&High Priority/Fragile&!&";
item[53, 4] = 797;
item[53, 5] = "2013, #Eon Drive, #Earth";
item[53, 7] = "6/28/2056";
item[53, 8] = "A memorial perfect for your Tesla museum.  Fit enough for Mr. Tesla himself! Make sure you keep the thing in the glass vacuum as we talked about. Even then, keep the safety lines at least 5 feet AWAY from the glass. You don't want your centerpiece killing your guests, huh?";
item[54, 0] = "Old Box";
item[54, 1] = "Drop a jack-in-the-box at low health, &r&fearing enemies&!& for 2 seconds.";
item[54, 2] = "&r&High Priority/Fragile&!&";
item[54, 4] = 785;
item[54, 5] = "Breezy Drive, #Middle-land, #Mars";
item[54, 7] = "5/4/2056";
item[54, 8] = "Musty, saggy, loose box. You can see it was used a lot already. Its bad shape honestly makes it scarier; you never know when the stupid thing pops out again. Sometimes it sits in there for days!";
item[55, 0] = "Beating Embryo";
item[55, 1] = "Use items have a &y&30% chance&!& to deal &y&double&!& the effect.";
item[55, 2] = "&r&Biological/Extremely Fragile&!&";
item[55, 4] = 792;
item[55, 5] = "Carolyn Williams#Rare/Extinct#Study Center#Venus";
item[55, 7] = "07/04/2056";
item[55, 8] = "Ah. We seem to have found a.. hive of sorts. Without its caretaker, however, most of the eggs seemed to have died off. Must have been caused by our previous specimen.
KEEP IT REFRIGERATED. You do not want this.. beating embryo.. hatching in your care. God knows what will happen.";
item[56, 0] = "Permafrost";
item[56, 1] = "Chance to &y&stun enemies for 1.5 seconds&!& and &b&slow enemies by 60%&!& for &b&3 seconds&!&";
item[56, 2] = "&r&High Priority/Fragile&!&";
item[56, 4] = 796;
item[56, 5] = "10681, #Frozen Valley, #Pluto";
item[56, 7] = "4/17/2056";
item[56, 8] = "The core of this ice cube is VERY VERY close to absolute zero, much closer than anything we made in the lab before. Test it! TEST! This will lead to HUGE breakthroughs in superconductor technology.";
item[57, 0] = "AtG Missile Mk. 2";
item[57, 1] = "A &y&7% chance&!& on hitting an enemy to fire three missiles that deal &y&3x300% damage&!&";
item[57, 2] = "&r&MILITARY&!&";
item[57, 4] = 798;
item[57, 5] = "Fort Joseph#Belt Num.1053#[REDACTED]#Boron System";
item[57, 7] = "[REDACTED]";
item[57, 8] = "Test System for Viper Missiles. Should now [REDACTED] on use instead of just one. Do not use on the field; it is UNSTABLE. I am only sending [REDACTED] shipments, so be smart.";
item[58, 0] = "Happiest Mask";
item[58, 1] = "Killing enemies spawn &b&ghosts for 15 seconds&!& with &b&70% health&!& and &b&50% damage&!&";
item[58, 2] = "&r&High Priority/Fragile&!&";
item[58, 4] = 794;
item[58, 5] = "Crux Fairgrounds, #Tent 7, #Earth";
item[58, 7] = "5/11/2056";
item[58, 8] = "This is GREAT! The circus is just as GOOD as I hoped it to be; it is a dream come true! I'm so GLAD that I followed my dream. I love you; tell mom too. Tell her..
#I'm happy! I'M HAPPY! SEE! I SAID I'M HAPPY PLEASE DON'T";
item[59, 0] = "Plasma Chain";
item[59, 1] = "Chance to &y&tether&!& onto enemies dealing &y&60% damage per second&!&";
item[59, 2] = "&r&High Priority/Fragile&!&";
item[59, 4] = 783;
item[59, 5] = "799, #Mg.Sys INC#Jupiter";
item[59, 7] = "5/15/2056";
item[59, 8] = "Hey there, my wife and I am returning a lost plasma chain. It is still fully operational and can haul my spaceship easily, so we expect the full reward! 
#We found it in an unmarked cave with a very large claw wrapped around it. The serial number should tell you the previous owner; the finder's fee can be sent to the same account that I'm sending this message from. Thank you.";
item[60, 0] = "Heaven Cracker";
item[60, 1] = "Every 4 basic attacks pierce through enemies for &y&100% damage.&!&";
item[60, 2] = "&r&High Priority/Fragile&!&";
item[60, 4] = 791;
item[60, 5] = "East Hanndor, #Weapon Facility, #Mars";
item[60, 7] = "5/24/2056";
item[60, 8] = "Contains about 500 horse power of torque. Diamond tipped and coated, along with composite steel. Strong enough to pierce the most heavenly of materials.
Can be used for  manual drilling, or swap to laser-mode to fire a mining laser instead. The former will wear it out much quicker, but will also have better results.
#Why I bother telling you all this is beyond me. You people aren't planning on using it for mining anyways.";
item[61, 0] = "Rapid Mitosis";
item[61, 1] = "Reduce the &b&cooldown of use items by&!& &b&25%&!&.";
item[61, 2] = "&r&High Priority/Fragile&!&";
item[61, 4] = 793;
item[61, 5] = "Saury Cosmo, #Beacon Post, #Space";
item[61, 7] = "12/14/2056";
item[61, 8] = "Very interesting sample. Found in the egg of an indigenous species in Sector 13. It undergoes mitosis that we all know, but at a much faster rate; about 2140x faster. Obviously can be useful for medicinal purposes. 
#Make sure to follow the instructions included to keep the sample alive. We have sent it frozen to stop the rapid duplications; since it increases in cell count exponentially, it could very well spiral out of control otherwise.";
item[62, 0] = "Ceremonial Dagger";
item[62, 1] = "Upon killing an enemy &b&fire out numerous heat seaking bolts&!&";
item[62, 2] = "&r&High Priority/Fragile&!&";
item[62, 4] = 784;
item[62, 5] = "Tomb 1661, #Burial Site, #Venus";
item[62, 7] = "7/18/2056";
item[62, 8] = "Finally found the heretic. Foolish boy, thinking he could save his sister. With the knife returned, we can continue our rituals. Ah.. that should please Her.";
item[63, 0] = "Repulsion Armor";
item[63, 1] = "After &b&6&!& hits &b&reduce and reflect incoming damage by 83%&!& for &y&3 seconds&!&";
item[63, 2] = "&r&High Priority/Fragile&!&";
item[63, 4] = 780;
item[63, 5] = "Chad Hills, #Lock-Box 3, #Jupiter";
item[63, 7] = "6/1/2056";
item[63, 8] = "Prototype Repulsion Armor; it doesn't quite work as advertised. The protective shielding will activate, but only after... repeated triggers. You'll have to get hit a lot of times before it activates. We have tried increasing the sensitivity, but it lead to the armor triggering from simple movements. We will send an improved prototype next month.";
item[64, 0] = "Brilliant Behemoth";
item[64, 1] = "All your attacks explode for a bonus &y&20% damage&!& to nearby enemies";
item[64, 2] = "&r&High Priority/Fragile&!&";
item[64, 4] = 786;
item[64, 5] = "Francis M#29th Ave #'Powderkeg Bar'#Old York#Mercury";
item[64, 7] = "11/1/2056";
item[64, 8] = "Pristine condition from the War of Slopes, 2019. All genuine and a real good collector's item! 
#She still works, but I would -not- try to fire it. Requires blackpowder which is expensive enough as is, but she makes a loud bang!
Selling for $200,000 starting. Send it back or I'll have my boys over";
item[65, 0] = "Interstellar Desk Plant";
item[65, 1] = "Upon killing an enemy, spawn an &b&alien plant&!& that &!&heals you for 8 hp.&!&";
item[65, 2] = "&r&High Priority/Fragile&!&";
item[65, 4] = 773;
item[65, 3] = 50;
item[65, 5] = "7887 #Dextro Way #Earth";
item[65, 7] = "1/19/2056";
item[65, 8] = "FORGET ALOE VERA. THIS IS THE NEXT THING.##You know how people always have those on their desks? Well this isn't just for cuts and burns; this makes you feel good EVERYWHERE. Vitamins, proteins, you name it, this plant got it. Takes very little time for it to bear another fruit as well, but it does require some strange potting soil... as in carcasses. Small caracasses.
#ANYWAYS, shoot me an email if you're interested!";
item[66, 0] = "Laser Turbine";
item[66, 1] = "All your attacks charge the generator. At full power, fire a laser for &y&2000% damage.&!&";
item[66, 2] = "&r&High Priority/Fragile&!&";
item[66, 3] = 51;
item[66, 4] = 772;
item[66, 5] = "73421 #Calorum St. #Saturn";
item[66, 7] = "8/17/2056";
item[66, 8] = "Replacement laser turbine for the photon power plant. The thing is deceptively small, but it holds immense power. Keep it away from all electromagnetic sources; it will charge from the field, and if the capacitor becomes overloaded, it WILL discharge.";
item[67, 0] = "Wicked Ring";
item[67, 1] = "Critical strikes &b&reduce cooldowns by 1 second.&!&";
item[67, 2] = "&r&High Priority/Fragile&!&";
item[67, 3] = 43;
item[67, 4] = 790;
item[67, 5] = "1414 East, #Fillmore, #Venus";
item[67, 7] = "2/22/2056";
item[67, 8] = "With how many rings he had, you would think more would have been found, eh? Nope, just this one. The King used to sacrifice one of his own sons to imbue the ring with dark spirits. He claimed that the spirits warded away any ill omen. The King lived until he was 104, so hey, maybe he was right.
#As the last remaining Wicked Ring, I expect a hefty sum.";
item[68, 0] = "Alien Head";
item[68, 1] = "Decreases your &b&cooldowns&!& by &b&25%&!&";
item[68, 2] = "&r&High Priority/Biological&!&";
item[68, 3] = 37;
item[68, 4] = 787;
item[68, 5] = "Soloman#-#Backwaters#Mars";
item[68, 7] = "07/13/2056";
item[68, 8] = "Important sign from the spirits. Passed down for many generations. Must be used for high noon ritual to ward off sickness and fatigue. Must be kept cool or will rot.
Helps energize the kinfolk and can be used for extra human strength and agility. Important.";
item[69, 0] = "The Ol' Lopper";
item[69, 1] = "&y&100% critical chance&!& on enemies below &g&9% health&!&. ";
item[69, 2] = "&r&High Priority/Fragile&!&";
item[69, 3] = 8;
item[69, 4] = 782;
item[69, 5] = "Box 11, #Sues Drive, #Jupiter";
item[69, 7] = "3/2/2056";
item[69, 8] = "Chop! CHOP! I need SHARPER! The lopper don't lop no more! 
#I go to lop and.. and the head STAYS ON! No good! Only works on weak! Neck OFF! New lopper NEEDED!";
item[70, 0] = "The Hit List";
item[70, 1] = "Killing a &y&randomly marked permanently increases damage by 0.5&!&";
item[70, 2] = "&r&High Priority/Fragile&!&";
item[70, 3] = 10;
item[70, 4] = 795;
item[70, 5] = "St Johns#Cluster 6#Venus#";
item[70, 7] = "11/14/2057";
item[70, 8] = "Don't forget.. don't forget what they did..#-A.Bn#-Fr.Ntn#-[CLEARED]#-[CLEARED]#-Random wildlife#-[CLEARED]#-Grvnkmp#-[CLEARED]";
item[71, 0] = "Photon Jetpack";
item[71, 1] = "&b&Fly&!& for &y&1.6 seconds&y&";
item[71, 2] = "&r&High Priority/Fragile&!&";
item[71, 3] = 12;
item[71, 4] = 779;
item[71, 5] = "Floor 77, #Corp INC, #Jupiter";
item[71, 7] = "12/29/2056";
item[71, 8] = "Here it is, sir. Please just be careful; I'm not quite sure what you are planning, but I don't think the jetpack lasts long enough to fly over to the other office. 77 floors is a long way to fall, sir.";
item[72, 0] = "Shattering Justice";
item[72, 1] = "Attacks reduce enemy armor by 5. Reduction stacks up to 25.";
item[72, 2] = "&r&High Priority&!&";
item[72, 3] = 28;
item[72, 4] = 775;
item[72, 5] = "Lockbox 8, #Hero's Barracks, #Mars";
item[72, 7] = "2/23/2056";
item[72, 8] = "I'm glad people still use hammers in combat; I find it much more intimate then guns. This thing weighs 5 TONS (yes, TONS), so only your Combat Equipped soldiers can use it. Five tons in a few square feet means that the hammer can crush enemy tanks, EASILY. ";
item[73, 0] = "Telescopic Sight";
item[73, 1] = "&y&1% chance&!& to &y&instantly kill an enemy&!&";
item[73, 2] = "&r&High Priority/Fragile&!&";
item[73, 3] = 31;
item[73, 4] = 781;
item[73, 5] = "Royal Drive, #Bubble Station, #Mars";
item[73, 7] = "4/20/2056";
item[73, 8] = "Can be used for both night and day shooting, and comes with infrared attachments and built-in distance finder.
#...And please, actually use the scope. We are all impressed you can hit a target without it, but I'm tired of watching your videos. Spinning while firing is also a great way to lose your license.";
item[74, 0] = "Fireman's Boots";
item[74, 1] = "Walking leaves behind a &r&fire trail&y& that burns for &y&35% damage.&!&";
item[74, 2] = "&r&High Priority/Fragile&!&";
item[74, 3] = 11;
item[74, 4] = 789;
item[74, 5] = "U. Cave, #Orbit Station, #Sun";
item[74, 7] = "8/8/2056";
item[74, 8] = "With the insane temperatures of your condition, it has come to our attention that you would probably want the strongest flame-retardent equipment. Well here it is; it works by literally 'fighting fire with fire.'
#It dispenses fluids that burn at low-temperature, which consumes large amounts of oxygen. This should starve any high-burning flames nearby, but obviously will leave a flaming trail behind you. Don't use this outside of the correct conditions, or you will burn your house down.
Can be refilled with gasoline, kerosene, or really anything that burns decently.";
item[75, 0] = "Hyper-Threader";
item[75, 1] = "Every attack fires a laser, dealing 40% damage and bouncing to 2 enemies.";
item[75, 2] = "&r&High Priority&!&";
item[75, 3] = 13;
item[75, 4] = 774;
item[75, 5] = "6900 West, #Advanced Warfare Center, #Mars";
item[75, 7] = "12/8/2056";
item[75, 8] = "Despite its appearance, the FNA 200 'Hyper-Threader' Energy Subrifle is anything but fragile.
#Using direct energy technology, the FNA 200 can fire superheated gases at a high fire rate. The FNA 200 also requires little to no charging, instead generating energy from the air around it.";
item[76, 0] = "Dio's Best Friend";
item[76, 1] = "Taking &r&fatal damage&!& revives you to &g&40% health&!&. &b&Invincible&!& for &y&2 seconds.&!&";
item[76, 2] = "&r&High Priority/Fragile&!&";
item[76, 3] = 35;
item[76, 4] = 776;
item[76, 5] = "6101 251st, #Blue Mound, #Earth";
item[76, 7] = "7/3/1993";
item[76, 8] = "Here you go; you can remember Dio forever with this. A cheers, to the best kitten ever born. We all love you, despite your flaws. Please stick around for a long time!";
item[77, 0] = "Ancient Scepter";
item[77, 1] = "Upgrade your 4th ability. Unique to each character.";
item[77, 2] = "&r&High Priority&!&";
item[77, 3] = 46;
item[77, 4] = 799;
item[77, 5] = "99th Floor, #Crumbling Tower, #Venus";
item[77, 7] = "1/30/1142";
item[77, 8] = "A glowing scepter, with a name engraved in the handle. I can't read what it says; I was hoping you could decipher it. It must have some magical powers; look how impressive it is! It's much better then your Lance of Legends, that's for sure.
#And before you ask, yes, the handle is designed to be hard to hold. Culls the weak.";
item[78, 0] = "Rotten Brain";
item[78, 1] = "Throw a brain that bounces in place, damaging/slowing enemies for &y&6x200%.&!&";
item[78, 2] = "&y&Volatile&!&";
item[78, 4] = 827;
item[78, 5] = "4120, #Frazux Colony, #Mars";
item[78, 7] = "2/14/2056";
item[78, 8] = "You really messed that up, didn't you? Dammit. The ****ing thing is bouncing, Harold. How the hell are we supposed to do ANYTHING with this? Now we will never know the truth. How - how did you even MANAGE to mess up this badly? Consider this useless hunk of grey matter your letter of termination. Keep the damn thing.";
item[79, 0] = "Safeguard Lantern";
item[79, 1] = "Drop a lantern for 10 seconds. &r&Fears&!& and damages enemies for &y&20% damage.&!&";
item[79, 2] = "&y&Volatile&!&";
item[79, 4] = 820;
item[79, 5] = "The Watch#Camp 1#Mars";
item[79, 7] = "5/20/2056";
item[79, 8] = "Protects you on the darkest nights. Don't stand too close; some claim to see terrors in the flame. Me? I just see hope.";
item[80, 0] = "Snowglobe";
item[80, 1] = "&b&Summon&!& a snowstorm that &b&freezes&!& monsters at a &y&30% chance over 7 seconds&!&";
item[80, 2] = "&y&Volatile&!&";
item[80, 4] = 809;
item[80, 5] = "3rd Igloo, #Tundra Zone, #Neptune";
item[80, 7] = "11/25/2056";
item[80, 8] = "Here you go honey, I got you a snowglobe! Do you see what's in it? Yeah, it's based off of your favorite video game! I hope you'll love it, I put a lot of effort into it. Cheers!";
item[81, 0] = "Explorer's Key";
item[81, 1] = "Open all chests in view.";
item[81, 2] = "&y&Volatile&!&";
item[81, 4] = 811;
item[81, 5] = "Merchants Guild#Mercury";
item[81, 7] = "12/01/2056";
item[81, 8] = "Strange artifact. Seems to be made of nano-technology, allowing it to solidify and liquify at will. I have yet to find a lock this key cannot open. Highly illegal I imagine..
#Has opened traditional lock and bolt, card readers, eye scanners, dead bolts, chains, zippers, and my phone password. 
I expect a hefty sum for this, because otherwise.. well.. your guild will simply become obsolete because of one key.";
item[82, 0] = "Foreign Fruit";
item[82, 1] = "Heal yourself for &g&50% of your health&!&";
item[82, 2] = "&y&Volatile&!&";
item[82, 4] = 810;
item[82, 5] = "Fabien H#32nd and Pike#New Africa#Mars";
item[82, 7] = "5/19/2056";
item[82, 8] = "Ya feelin down?  Then eat Fabien's Nutapple! No preservatives. No chemicals. All fruit. Tastes like an apple and a cashew; together!
Guaranteed to make you feel 50% healthier or your money back!";
item[83, 0] = "Instant Minefield";
item[83, 1] = "Drop &y&6&!& mines at your feet, each dealing &y&400% damage&!&.";
item[83, 2] = "&y&Volatile/Military&!&";
item[83, 4] = 814;
item[83, 5] = "HERCULES 29-5#Combat Zone 15#Sgt. Snd";
item[83, 7] = "03/09/2056";
item[83, 8] = "Should help in holding choke positions without losing so many men. I know that hercules is simply held because of pride; we've blown any resources we could've mined into the stratosphere by now. 
#Just simply lay it down and its smart-fire should prevent it from blowing your own legs off. Spits out about six. Realize that it takes about.. 45 seconds to reload the minelayer and about a second to arm.";
item[84, 0] = "Jar of Souls";
item[84, 1] = "&b&Duplicate every enemy&!& as a &b&ghost to fight on your side.&!&";
item[84, 2] = "&y&Volatile&!&";
item[84, 4] = 822;
item[84, 5] = "O.Crypt 74, #W. Path, #??";
item[84, 7] = "6/6/2056";
item[84, 8] = "[The recording only contains wailing and screaming. Would you like to contact authorities? Y/N]";
item[85, 0] = "Carrara Marble";
item[85, 1] = "Place a marble gate. Teleport back to the gate by activating again.";
item[85, 2] = "&y&Volatile&!&";
item[85, 4] = 805;
item[85, 5] = "King Street, #Trans. Ctr, #Unknown";
item[85, 7] = "11/28/2056";
item[85, 8] = "Carrara marble is very hard to find these days. It's been very popular since Ancient Rome; however, most deposits ran out, so a chunck of Carrara marble marks up a pretty price. I'm thinking $800,000 for the amount I'm offering. 

You can make those sculptures you've always dreamed of.";
item[86, 0] = "Sawmerang";
item[86, 1] = "&b&Throw&!& out a sawmerang for &y&500% damage&!& and &r&bleed for 4x100%.&!&";
item[86, 2] = "&y&Volatile&!&";
item[86, 4] = 826;
item[86, 5] = "North Speck, #Warehouse lot-88, #Jupiter";
item[86, 7] = "11/13/2056";
item[86, 8] = "This is one of many sawblades that I will be sending for analysis. We still haven't ID'd all the bodies from the factory accident, so its up to you to run dna tests on all the.. blood and flesh. Word of caution: it smells like rotten meat.";
item[87, 0] = "Shattered Mirror";
item[87, 1] = "For 15 seconds, &b&double all your abilities' damage and effects.&!&";
item[87, 2] = "&y&Volatile&!&";
item[87, 4] = 819;
item[87, 5] = "Fox Plaza, #1711 Box, #Neptune";
item[87, 7] = "11/17/2056";
item[87, 8] = "I know you; you avoid looking at yourself. You feel disgust at your own reflection; you wish every mirror to be shattered. It is time to change. You are not alone.";
item[88, 0] = "Disposable Missile Launcher";
item[88, 1] = "Fire a swarm of missiles.";
item[88, 2] = "&y&MILITARY&!&";
item[88, 4] = 813;
item[88, 5] = "Steve Ruxx, #Quadrant 001, #Mars";
item[88, 7] = "11/3/2056";
item[88, 8] = "So here is a prototype of the disposable missile launcher you requested. The box itself is made of cardboard, which raises some safety issues but also lowers the production costs immensely. The missiles are also the dumb ones that didn't pass inspection the first time around, allowing us to fit sixteen into this!
#The entire thing costs about.. $40. Make sure that you don't store them together; some of the rounds has been observed to explode by themselves.";
item[89, 0] = "Gold-plated Bomb";
item[89, 1] = "Use &y&50% of your gold&!& to create a bomb, dealing &y&1 damage per gold spent.&!&";
item[89, 2] = "&y&Volatile&!&";
item[89, 4] = 808;
item[89, 5] = "Warpship, #Xeron TC, #Neptune";
item[89, 7] = "5/28/2056";
item[89, 8] = "Yeah, so? Of course I made a bomb powered by how rich you are. Dude, what? You can't afford a bomb out of money? What are you... poor? It's JUST money.";
item[90, 0] = "Drone Repair Kit";
item[90, 1] = "Repairs all drones to &g&full health.&!&";
item[90, 2] = "&y&Volatile&!&";
item[90, 4] = 824;
item[90, 5] = "1803-A, #Southern Pub, #Mars";
item[90, 7] = "3/17/2056";
item[90, 8] = "We have learned from nature that the best relationships are the symbiotic ones; the nanodrones go and fix up all the scratches and broken pieces of the attack drones, and in return they get scrap metal to replicate. Win-win for both.";
item[91, 0] = "Thqwib";
item[91, 1] = "Release a bloom of 30 thqwibs, detonating on impact for 200%.";
item[91, 2] = "&y&Volatile&!&";
item[91, 4] = 800;
item[91, 5] = "Carolyn Williams#Rare/Extinct#Study Center#Venus";
item[91, 7] = "11/23/2056";
item[91, 8] = "Thqwibs naturally live in very low atmosphere, so the pressurized container is for their own safety. If released into the room, they'll die immediately, so don't.
##I included approximately 30 thqwibs; despite their similar appearance to other creatures, they are naturally social, and will become depressed if left alone.";
item[92, 0] = "Dynamite Plunger";
item[92, 1] = "Hitting an enemy drops dynamite. Use to detonate for &y&400% damage.&!&";
item[92, 2] = "&y&Volatile&!&";
item[92, 4] = 801;
item[92, 5] = "East Hanndor, #Weapon Facility, #Mars";
item[92, 7] = "9/03/2056";
item[92, 8] = "Another one for you folks. You liked the previous shipment so much, I thought I would send you more outdated tech. When I say outdated, I MEAN outdated. This thing triggers from plunging; while it still uses microwave signals to connect between sticks of dynamite, it is otherwise the same as the classics.
##Like last time, I assume you'll keep this confidential between us? ";
item[93, 0] = "Gigantic Amethyst";
item[93, 1] = "&b&Reset all your cooldowns.&!&";
item[93, 2] = "&y&Volatile&!&";
item[93, 3] = 52;
item[93, 4] = 802;
item[93, 5] = "Greivenkamp#5th Houston St.#Prism Tower#Earth";
item[93, 7] = "5/11/2056";
item[93, 8] = "Use for focus lasers, I assume. Anyways, this is the biggest one I could find ANYWHERE. Outside of the Crown Amethyst of Venus, which I obviously can't get you, this is the best for your purposes. You'll be able to reach AMAZING quality with this; good luck!";
item[94, 0] = "Crudely Drawn Buddy";
item[94, 1] = "Blow up a decoy, attracting enemies for 8 seconds. Looks just like you.";
item[94, 2] = "&y&Volatile&!&";
item[94, 3] = 30;
item[94, 4] = 807;
item[94, 5] = "1111, #Middle-Ground, #Mars";
item[94, 7] = "11/9/2056";
item[94, 8] = "W-what do you mean? No, no, n-no! It's SUPPOSED to look like that. Yes, with the smudge, and the.. yes. It's my /style/. If you have nothing nice to say, don't say anything at all.#It looks life-like to me. Essentially a caricature of you. Could fool anyone.";
item[95, 0] = "Prescriptions";
item[95, 1] = "Increase &y&damage by 10&!& and &y&attack speed by %40&!& for &y&8 seconds.&!&";
item[95, 2] = "&y&Volatile&!&";
item[95, 3] = 16;
item[95, 4] = 817;
item[95, 5] = "JusticeCenter,#Science Dept.#Venus";
item[95, 7] = "1/18/2056";
item[95, 8] = "Are these pills legal? No. Are these pills helpful? Yes. Do pigs fly? No.
#Van-Ex increases strength and muscle mass in only 24 hours! Proven by science!
#Make sure to take only 2 every 8 hours, max! Otherwise you may find yourself dead!";
item[96, 0] = "Shield Generator";
item[96, 1] = "Become &b&invincible&!& for &b&8 seconds.&!&";
item[96, 2] = "&y&Volatile&!&";
item[96, 3] = 19;
item[96, 4] = 818;
item[96, 5] = "Geshka Tower#33rd Fl#Mars";
item[96, 7] = "9/24/2056";
item[96, 8] = "While intended for anti-artillery use, the ONI-CV117 has become wildly popular in the private sector as both a personal and automobile defense device. By protecting the user in 'hard light' that closely wraps around, shock is absorbed throughout the light, rather than by the user. However, the shield generator requires time to charge, meaning it has a short up-time. Time it wisely.";
item[97, 0] = "Unstable Watch";
item[97, 1] = "&b&Stop time&!& for &y&7 seconds&!&";
item[97, 2] = "&y&Volatile&!&";
item[97, 3] = 1;
item[97, 4] = 821;
item[97, 5] = "Loodi Tower, #Floor 19, #mars";
item[97, 7] = "11/09/2056";
item[97, 8] = "Doesn't work at all..! Sometimes it keeps time fine, and sometimes it sends me for a tizzy! 
I can be watchin' (haha) it and I'll see it jump 10 seconds, sometimes 15. No matter what I do it keeps doin' it, and I have no idea why. Luck for ya!
I gotta go sit down.. feelin a bit tired..";
item[98, 0] = "Lost Doll";
item[98, 1] = "Sacrifice &r&25% health&!& to &y&damage&!& an enemy for &r&500% of your maximum health.&!&";
item[98, 2] = "&y&Volatile/Military&!&";
item[98, 3] = 3;
item[98, 4] = 812;
item[98, 5] = "Tibb Station, #Box Unknown, #Venus";
item[98, 7] = "2/12/2056";
item[98, 8] = "Get this out of my house. Please. Just take it. 
#Since I've recieved this god-forsaken thing, my husband has fallen down the stairs and broke his neck, my son got hit by a bus, and my daughter has drowned in the bathtub.
And.. oh god.. I swear it moves around the house. I've tried leaving it locked in a safe, and it will be out the next day. It wont burn. Cutting it has resulted in the amputation of both my arms.
#Please..";
item[99, 0] = "Pillaged Gold";
item[99, 1] = "Every monster in view drops &y&10 gold.&!&";
item[99, 2] = "&y&Volatile&!&";
item[99, 3] = 9;
item[99, 4] = 815;
item[99, 5] = "Crisis Street, #2008, #Mars";
item[99, 7] = "08/8/2056";
item[99, 8] = "Yar! All yer enemies be a source of swag for ye, hear me true. Open the bag, facing o'er direction cutthroats, and all the gold will beck out of their britches, and into ye hand. 
#I sent this across the galactic seas fer your offer; ye'll better look in yar deepest depths for a wise trade.";
item[100, 0] = "Captain's Brooch";
item[100, 1] = "Call down a &b&chest&!& nearby";
item[100, 2] = "&y&Volatile&!&";
item[100, 3] = 39;
item[100, 4] = 825;
item[100, 5] = "Box 1, #The Lusty Lad, #Venus";
item[100, 7] = "9/12/2056";
item[100, 8] = "The brooch has been passed down for many generations in my family, signifying the new captain of Contact Light. I'll actually be personally delivering this back to my home, so mark it as high priority.
#..hmm? There is a very small button on the back. Pressing it seems to do nothing...";
item[101, 0] = "The Back-up";
item[101, 1] = "Create &y&4 drones&!& to fight for you for &b&10 seconds.&!&";
item[101, 2] = "&y&Volatile&!&";
item[101, 3] = 4;
item[101, 4] = 823;
item[101, 5] = "1511, #Sixth Ave, #Earth";
item[101, 7] = "11/15/1967";
item[101, 8] = "The radio is hooked up to my personal line; call, and I'll have a whole squadron of Hellfire Drones at your position before the second ring. Just remember that once you call, your cover is blown. Emergencies only.";
item[102, 0] = "Massive Leech";
item[102, 1] = "For &y&10 seconds&!&, every hit heals you for &g&10 health.&!&.";
item[102, 2] = "&y&Volatile&!&";
item[102, 3] = 34;
item[102, 4] = 816;
item[102, 5] = "Carolyn Williams#Rare/Extinct#Study Center#Venus";
item[102, 7] = "6/19/2056";
item[102, 8] = "Giant leeches found in the pools of HYPERION-5. Very similar to its counterpart on Earth, but it seems to have developed teeth as well, allowing it to eat meat as well as siphon blood. 
#A few have been spotted to ballon to enormous proportions,up to the size of a small dog. Like the common leech, this has obvious medical implications. You will just have to be extra careful, or you may come back to no patient and a giant bloody leech.";
item[103, 0] = "Glowing Meteorite";
item[103, 1] = "Meteors fall from the sky, damaging enemies and friends for 220% damage. Lasts 8 seconds.";
item[103, 2] = "&y&Volatile&!&";
item[103, 3] = 40;
item[103, 4] = 804;
item[103, 5] = "8912, #6th Planet, #Saturn";
item[103, 7] = "6/18/2056";
item[103, 8] = "This hunk of space metal came shooting down and almost hit our town! Thankfully it just fell in the nearby mountains, but man did it make a loud bang. Scientists say it's a 'vanguard meteorite'; one of the first meteors from a series of many, many more. Cool!";
item[104, 0] = "Legendary Spark";
item[104, 1] = "&y&8%&!& chance to &b&smite&!& enemies for &y&200% damage&!& ";
item[104, 2] = "&b&Field-Found&!&";
item[104, 4] = 848;
item[104, 5] = "Lost Planet, #Unknown";
item[104, 7] = "1/28/2056";
item[104, 8] = "After slaying the flaming abomination, it crumpled and fell apart, like an empty suit of armor. Its pauldron especially caught my eye; I could tell it was a source of great power. More armor can't possibly hurt in this hellhole.";
item[105, 0] = "Imp Overlord's Tentacle";
item[105, 1] = "&b&Summon an imp&!& bodyguard. &g&Revives&!& every &y&60 seconds&!& ";
item[105, 2] = "&b&Field-Found&!&";
item[105, 4] = 849;
item[105, 5] = "1005, #Daimera's Lair, #Unknown";
item[105, 7] = "5/13/2013";
item[105, 8] = "I believe the Imp Overlord's head tentacle serves as a symbol of power; the bigger the tentacle, the more powerful you are in the social hierarchy. Losing a tentacle is a sign of failure or social outcasting.
#I.. have no idea how I know that. I just do.";
item[106, 0] = "Burning Witness";
item[106, 1] = "Kills grants &y&firetrail, 5% movement speed, and 1 damage for 6 seconds.&!&";
item[106, 2] = "&b&Field-Found&!&";
item[106, 4] = 846;
item[106, 5] = "Central Core, #Lock Box 52, #Sun";
item[106, 7] = "--";
item[106, 8] = "Found by killing a.. giant magma worm. Yes, you read that correctly.
After it died, its body lay dormant but its eyes seem to still look around, watching. Removal of the eye showed that it may be a parasite that attaches to the worm itself; the worm grants it protection, while the eye gives it the vision it needs.";
item[107, 0] = "Colossal Knurl";
item[107, 1] = "Increase health by 40, health regeneration by 1.2/second, and armor by 6.";
item[107, 2] = "&b&Field-Found&!&";
item[107, 4] = 845;
item[107, 5] = "6542, #Fractured Rock, #Unknown";
item[107, 7] = "7/22/2056";
item[107, 8] = "There is obviously some essence left in this hunk; the Knurl is still attracting nearby earth and dirt, trying to reconstruct itself. Perhaps I can use this to my advantage; a self-repairing chunk of earth could serve as a good shield.";
item[108, 0] = "Ifrit's Horn";
item[108, 1] = "&y&8%&!& chance to &b&incinerate&!& enemies for &y&220% damage&!& ";
item[108, 2] = "&b&Field-Found&!&";
item[108, 4] = 844;
item[108, 5] = "Lot Z, #Auction House, #Unknown";
item[108, 7] = "4/10/2056";
item[108, 8] = "When I finally took the beast down, I carved off his horn, hoping for it to help on this journey. I've felt a strange power since obtaining it... while I feel stronger, I feel like I am no longer alone.";
item[109, 0] = "Nematocyst Nozzle";
item[109, 1] = "Shoot out &y&6 nematocysts&!& that deal &y&200% damage&!&";
item[109, 2] = "&b&Field-Found&!&";
item[109, 4] = 847;
item[109, 5] = "8800, #Gentle Valley, #Unknown";
item[109, 7] = "8/18/2056";
item[109, 8] = "I scavenged the corpse of the Vagrant to better understand its biologiy, and I discovered this tube, or nozzle. The Vagrant must use a chemical concotion of gases and liquids in order to fire and detonate its explosive payload. I can see this being useful.";
for (i = 0; i <= global.item_number; i += 1)
{
    if (item[i, 3] != -1)
    {
        if (oInit.achievement[item[i, 3], 0] == 2)
        {
            item[i, 6] = oInit.item_found[i];
        }
        else
        {
            item[i, 6] = -1;
        }
    }
}
