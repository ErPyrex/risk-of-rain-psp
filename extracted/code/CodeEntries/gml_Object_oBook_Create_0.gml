boss_color = 6913189;
mons_color = 8489357;
book_height = floor((view_hview[0] - 32) / 29) * 29;
book_width = floor((view_wview[0] - 32 - 20) / 2);
corner_offset = 0;
max_page = global.mons_number;
page = -1;
flipping_pages = 0;
flipping_pages_jump = 1;
table_choice = -1;
book_alpha = 1;
oInit.new_mons_found = 0;
image_speed = 0.2;
for (i = 0; i <= global.mons_number; i += 1)
{
    mons[i, 0] = "name";
    mons[i, 1] = "des";
    mons[i, 2] = 10;
    mons[i, 3] = 1;
    mons[i, 4] = 1;
    mons[i, 5] = 440;
    mons[i, 6] = oInit.mons_found[i];
}
mons[0, 0] = "Lemurian";
mons[0, 1] = "The first sentient species I discovered on my unfortunate arrival. Around 7' tall, with scaly skin not different from that of a lizard. Bipedal. Aggressive on sight, minus a few exceptions. These Lemurians have an extremely powerful bite, but don't seem to employ weapons.
#All species that I have encountered have armor on their shoulders and wrists, indicating a high intelligence. They seem to live in underground tunnels networked all over the planet, and can use these tunnels to ambush prey.
#From what I've briefly seen, they seem to enjoy song and dance.";
mons[0, 2] = 100;
mons[0, 3] = 14;
mons[0, 4] = 1.2;
mons[0, 5] = 442;
mons[1, 0] = "Rock Golem";
mons[1, 1] = "Now THEY are interesting. These Golems, which tower over me at 10' tall, are constructed from the soil and rock beneath my feet. After a brilliant red flash, the earth itself moves to create these constructs in 2 seconds flat. If I didn't know better, I would consider this.. magic.
#Because of their material, they are extremely tough to take down. Using the same technology that constructs them, the Rock Golems are capable of creating a 'clap' which generates great amounts of energy. Damaging a golem eventually causes it to malfunction and die, returning to the ground.
#Despite their powerful combat abilities, the golems are gentle to everybody but me, and can be seen 'playing' with wildlife.";
mons[1, 2] = 300;
mons[1, 3] = 34;
mons[1, 4] = 1;
mons[1, 5] = 472;
mons[2, 0] = "Wisp";
mons[2, 1] = "Characterized by their constant flame, the Wisps are not living beings. Each Wisp has a mask in its center, where all the fire erupts from. The Wisps are able to concentrate their heat into a long range heat blast, capable of scorching anything in its path. On taking heavy damage, the fuel powering the Wisp detonates, sending the mask soaring clear through the air.
#How they function is a mystery to me. While I've seen 'deactivated' masks all around this world, the only time I've spotted Wisps is around me, as if someone creates them specifically to kill me..";
mons[2, 2] = 170;
mons[2, 3] = 17;
mons[2, 4] = 1.5;
mons[2, 5] = 523;
mons[3, 0] = "Greater Wisp";
mons[3, 1] = "Oh lord. These.. Greater Wisps, as I have grown to call them, are absolutely terrifying to face. Tougher then the Rock Golem, faster then the Lemurian, and harder hitting then both combined. Unlike the lesser Wisps, the Greater Wisp has two arms capable of typical motion. They burn a brilliant green which pierces straight though my sun visor.
#Their combat abilities are unprecedented; I can be clear 200m away, and they still manage to hit me square in the chest. I must stay hidden.. before they find me again.";
mons[3, 2] = 470;
mons[3, 3] = 23;
mons[3, 4] = 1.5;
mons[3, 5] = 534;
mons[4, 0] = "Sand Crab";
mons[4, 1] = "A few hours after my crash, I finally decided to investigate the nearby area. As I moved past a particularly large mound of sand, it began to shift and roar. From it erupted a giant crab-like beast, standing above me at 10' with claws the size of a small man. The giant crab moves surprisingly fast for its size; the foliage growing on its back indicates that they stay still for long periods of time. This crab is either extremely patient or hibernates regularly.
#After exhausting my supplies in taking it down, I salvaged what meat I could. Very chewy, but not unpleasant. Looking across the beach, I spot many similar mounds of sand. I must keep moving; daylight is coming.";
mons[4, 2] = 300;
mons[4, 3] = 34;
mons[4, 4] = 1.2;
mons[4, 5] = 614;
mons[5, 0] = "Jellyfish";
mons[5, 1] = "An airborne creature, capable of flight using a combination of gases in its clear hull. Like the Jellyfish on earth, they also use pulsation to aid in locomotion; however, rather than a series of tentacles, they have two 'branches' made of many tentacles wrapped around themselves.
#Also like the Jellyfish, they have quite the sting, capable of penetrating my weather shielding. The same gases used for flight are used to create a very powerful electrostatic charge.
#When they are not busy hunting me, the Jellyfish have been seen sunbathing and absorbing the strange fumes from the ground.";
mons[5, 2] = 85;
mons[5, 3] = 7;
mons[5, 4] = 2.2;
mons[5, 5] = 515;
mons[6, 0] = "Child";
mons[6, 1] = "These small beings fill me with dread.. From a distance I can see them frolicking among the rocks- playing with the other ghostly 'children'. I don't know how else to describe them, they seem so innocent until I approach. 

Once I am spotted it as if some wicked switch is flipped and I am their plaything. While I can defeat the small groups, I fear I am only sealing my doom once their small, destroyed bodies are found.
";
mons[6, 2] = 125;
mons[6, 3] = 14;
mons[6, 4] = 1.3;
mons[6, 5] = 663;
mons[7, 0] = "Spitter";
mons[7, 1] = "Alas, another hostile creature. This one's nature certainly betrays its precocious appearance. It even seems to be vexed by my retaliation. What a petulant fellow. 

His snapping maw hurls orange bile. The acidic mucus must be detonated by the gnashing teeth- conceivably similar to our picric acid. Fascinating, how could this have arisen? 

Post-mortem I was also able to discover the source of the creature's impressive flexibility. Aside from the skull, mandible, and teeth, the skeleton is highly cartilaginous! 
";
mons[7, 2] = 240;
mons[7, 3] = 19;
mons[7, 4] = 1;
mons[7, 5] = 508;
mons[8, 0] = "Tiny Imp";
mons[8, 1] = "I seem to have found the one creature on this planet that DOESN'T want to kill me. These small, leathery creatures are spawned from vases I sometimes spot in the ruins. They seem to stay in packs, and frequently carry useful treasure.
#Immediately after spawning, these tiny imps run in all directions. While I do feel a bit.. awful.. about killing what seems to be the equivalent of children, I need the treasure they hold if I'm to survive. I'm sorry.";
mons[8, 2] = 22;
mons[8, 3] = 3;
mons[8, 4] = 1.3;
mons[8, 5] = 565;
mons[9, 0] = "Black Imp";
mons[9, 1] = "Oh. Fear. The Imp causes me fear, with its razor sharp talons and its one eye, locked into mine through my helmet. The Imp uses a propellant to hover above the ground, giving it superior mobility over everything.. including me. ##Unlike the other fauna on this planet, the black imp is aggressive to all other species. Is the imp also stranded here?##The Black Imp can move from location to location, seemingly instantly. I refuse to believe that the Imp has teleportation; that is for fairy tales and quantum physicists. I won't accept that it can achieve something biologically that the human race couldn't achieve in its entire history.";
mons[9, 2] = 310;
mons[9, 3] = 13;
mons[9, 4] = 1.4;
mons[9, 5] = 557;
mons[10, 0] = "Mushrum";
mons[10, 1] = "I have arrived in an even stranger land. After recovering from my sudden.. teleportation, I noticed that my suit was flashing warnings about air filtration. All across the landscape were giant fungi, some as tall as trees.
#When approaching a large bulbous mushroom, it suddenly sprouted out the ground, jumping a few feet in the air then landing on two nubby feet. At this point my air filtration warning went from yellow to red, and I began to have difficulties breathing..
#While sentient, these mushrums were not very intelligient. It had what looked like three eyes, but it could not navigate very well, implying that those may be fake eyes to scare predators. It also had no mouth to eat, but would plant itself over corpses, slowly absorbing nutrients through its root-like feet.";
mons[10, 2] = 160;
mons[10, 3] = 17;
mons[10, 4] = 1.2;
mons[10, 5] = 603;
mons[11, 0] = "Whorl";
mons[11, 1] = "Day 8. I was awoken by an abrupt collision of something hard against my suit. A volley of sensors screamed in my ears as a hairline fracture arced across my vision. 

The hard shell of a monstrous “Whorl” nearly compromised my air lock. If I hadn't had a small tube of polymer sealant from the astrotrain I would not be recording this now. 

These carapaced organisms propel themselves with some form of gas-propulsion. Despite their similar appearance to the nautili of old, they do not use a bellows-like system for locomotion, but a steady streaming of gas through their curling shell. I wonder if this heavy armor prevents them from attaining higher altitudes, constrained to hover among the land creatures.  
";
mons[11, 2] = 230;
mons[11, 3] = 17;
mons[11, 4] = 1.2;
mons[11, 5] = 707;
mons[12, 0] = "Clay Man";
mons[12, 1] = "Quick with his sword and quicker with his feet; the agility of these clay 'people' is unexpected with a form so roughly shaped. 

When faced with one of the few creatures here which I feel some humanity in, my aloneness closes in. Why do they have clay pots on their heads? Could it be protection from this cruel reality, or maybe just to hide the scars from this brutal planet.. 
";
mons[12, 2] = 140;
mons[12, 3] = 11;
mons[12, 4] = 1.2;
mons[12, 5] = 589;
mons[13, 0] = "Bighorn Bison";
mons[13, 1] = "The teleporter nearly launched me into a steaming dung heap. I could not have anticipated such an enormous beast being its source. More impressive than their rumbling bellows is the bighorn's charge. Their many tons of muscle produce a crushing slam of horn and matted hair. 

When they are not stampeding after me I have observed these monsters using their massive heads to bludgeon rocks and fight amongst themselves. How can they expend so much energy on fruitless activity? Are they merely trying to keep from freezing?   ";
mons[13, 2] = 430;
mons[13, 3] = 17;
mons[13, 4] = 1.5;
mons[13, 5] = 554;
mons[14, 0] = "Mechanical Spider";
mons[14, 1] = "The malware of our age! These mechanical parasites were probably lurking on the ship before the crash. Pirates will use these bugs to collect especially valuable cargo, redirect transmission signals, or even hijack ships. Spiders can be programmed with all kinds of malicious objectives. 

In general they are quite difficult to find and eradicate on large vessels, but now that they're loose they seem to be able to operate outside their software. They have retained their defense capabilities, and are risky to engage. Though, I wonder, how long will they continue to run without access to an electrical grid? 
";
mons[14, 2] = 430;
mons[14, 3] = 17;
mons[14, 4] = 1.5;
mons[14, 5] = 622;
mons[15, 0] = "Gup";
mons[15, 1] = "It is quite rare that I smell anything through my respirator. I could not have been prepared for how bizarre no longer having a sense of smell is.  However, there have been a rare few occasions when I caught some trace aroma- generally somewhat bitter on this planet, but I savor them greedily. 

When I encountered this gelatinous beast I was assailed by a sweet smell! A strangely fruity scent.. Oh, how it brings me back to a more innocent time! As I struck the congealed blimp of a creature it divided and seemed to gain energy. With each blow more of the saccharine odor escaped the monster. I must admit, I may have been overzealous in my attack..
";
mons[15, 2] = 375;
mons[15, 3] = 27;
mons[15, 4] = 1.4;
mons[15, 5] = 697;
mons[16, 0] = "Parent";
mons[16, 1] = "A deadly force, they rush at me mad with grief and rage. Parents will slam the ground; their only aim to crush the butcher of their offspring. Their powerful blows open great lashes in the quaking ground.

Though my guilt almost stays my hand, I cannot let them keep me from surviving this nightmarish planet. I know it is impossible to quell their fury; so instead I must end it. 
";
mons[16, 2] = 315;
mons[16, 3] = 15;
mons[16, 4] = 1.3;
mons[16, 5] = 658;
mons[17, 0] = "Evolved Lemurian";
mons[17, 1] = "Could this be a distant cousin of the Lemurians below? An ancient evolutionary leap? These airborne reptiles do not interact with the ground Lemurians except to harass them occasionally. Perhaps there is some kind of natural feud between the species? 

It is the membranous skin that attaches their long arms to their body which enables their flight. Each wingtip culminates in vicious talons. When they come in flocks these winged Lemurians are capable of great carnage. 
";
mons[17, 2] = 125;
mons[17, 3] = 14;
mons[17, 4] = 3;
mons[17, 5] = 448;
mons[18, 0] = "Temple Guard";
mons[18, 1] = "A robot creature that assembles itself.. I have not seen them materialize other than when I unknowingly trigger their presence. I cannot believe this is indeed a machine- and yet it is made from some alloy and uses heavy artillery! Was this on the ship, or are these guards a naturally occurring 'species' here? My suit's scanners are unable to detect any manufacturers' signature.

They seem to be determined not to let me pass. They attack with unlimited focus.";
mons[18, 2] = 420;
mons[18, 3] = 17;
mons[18, 4] = 0.8;
mons[18, 5] = 677;
mons[19, 0] = "Elder Lemurian";
mons[19, 1] = "Seems to be very large version of the Lemurians; perhaps this great lizard is a queen? With similar armor and much thicker skin, it took much more to bring down this foe. She moves much slower and posses a powerful scorching blast.

I would willingly give up some of my dwindling rations to explore the Lemurian tunnels unnoticed. My mind envisions great communal caverns and many spectacular subterranean dwellings. Do great legions of Lemurians walk under my feet?";
mons[19, 2] = 405;
mons[19, 3] = 23;
mons[19, 4] = 1;
mons[19, 5] = 463;
mons[20, 0] = "Archer Bug";
mons[20, 1] = "Such aggravating creatures! These insects come in droves- as a group their wings create a maddening whine. Even the other creatures seem disturbed by their presence. Though they are not particularly strong, the circling insects certainly frustrate me. 

A small amount of their projectile spit managed to penetrate one of the layers of my suit. It was extremely caustic. A festering rash has formed in the area, but doesn't seem to be spreading.  ";
mons[20, 2] = 105;
mons[20, 3] = 6;
mons[20, 4] = 2;
mons[20, 5] = 680;
mons[21, 0] = "Colossus";
mons[21, 1] = "A low groaning, lasting for a few days at least. From the relative safety of my drop pod I watched as a mountain rose to its knees, pushing itself up with arms of stone and dirt and twine. 
#The Colossus appears as a cousin of the Rock Golem and share many similarities, from its red gaze to its stocky stature. Around its feet many smaller golems rose, joining it. In what possible ways could conventional weapons help me?
#I've begun to find a dark humor in the absolute overkill that I face. This is simply ridiculous.";
mons[21, 2] = 1400;
mons[21, 3] = 40;
mons[21, 4] = 1.1;
mons[21, 5] = 479;
mons[22, 0] = "Wandering Vagrant";
mons[22, 1] = "Day 3. While looking through some wreckage of the old ship, I felt a hot sensation on my skin and a brilliant white flash. Over the horizon maybe 5 miles north I saw it, looming over the forest tops.
#It must be the size of a house, this thing. A massive variant of the jellyfish seen earlier; this behemoth hovers in the air, searching for something. The gas used to propel this beast bend the trees below it flat. When it spotted its prey, it sent out six bioluminescent orbs, all crashing towards the ground and incinerating the target. 
#This Vagrant, as I've come to call it, seems to wander amidst the skies, followed by many jellyfish. On the occasion the clouds part, I swear I sometimes see hundreds of vagrants up there. What are they looking for?";
mons[22, 2] = 1400;
mons[22, 3] = 12;
mons[22, 4] = 3;
mons[22, 5] = 519;
mons[23, 0] = "Magma Worm";
mons[23, 1] = "I've stumbled upon an old relic, notably with two distinct stone prongs. On approaching it it whirred to life, apparently charging up. This seemed to disturb something deep and violent below the ground..
#The Magma Worm exploded out of the ground, knocking me off my feet. While I struggled with shell shock, I saw it arc through the sky, then plunge back into the ground with another bang. 
#Reaching about.. 200 meters, the worm moves extremely fast for its size. Permanently burning out of pores in its skin, the Magma Worm uses this flame as both a hunting tool and a way to melt through the ground quickly. Its small, beady eyes lurch around, looking for prey. With its massive size, the Magma Worm must either eat VAST amounts of food a day or hibernate for a very, very, very long time below ground.";
mons[23, 2] = 1400;
mons[23, 3] = 55;
mons[23, 4] = 15;
mons[23, 5] = 494;
mons[24, 0] = "Ancient Wisp";
mons[24, 1] = "Could this be the architect of the smaller wisps? Perhaps this Ancient Wisp is the puppeteer behind the fiery masks harassing me thus far, or is he also a devilish device of something greater..?

The heat coming off the purple flames is extreme. Ferocious columns of lightning threaten to short-out my suit, or worse, turn me into a blistered husk. What fuels these violent, burning apparitions? 
";
mons[24, 2] = 1470;
mons[24, 3] = 23;
mons[24, 4] = 1;
mons[24, 5] = 542;
mons[25, 0] = "Imp Overlord";
mons[25, 1] = "Oh, why me? My heart stopped when this great Imp manifested in previously empty space. So many horrendous eyes. With a gaping scream the Imp lets out a deadly red vapor. Some type of laser also trails me. 

This demon is just as baffling in its movements as the smaller one. Barely escaping the Imp's whipping grasp I landed a final blow. Its dying body split open at its meridian, displaying its innards like some ghastly flower. This monster is just as gruesome in death as it was in life.
";
mons[25, 2] = 1210;
mons[25, 3] = 25;
mons[25, 4] = 1.5;
mons[25, 5] = 567;
mons[26, 0] = "Ifrit";
mons[26, 1] = "Could this be..? Tales I never believed recounted a horrible beast, fire incarnate. Scourge of another solar system, the Ifrit nearly wiped out an entire space colony before being chained and launched into the great black void. Supposedly the flaming jets that accompanied his roars could be seen for days as he drifted outwards. 

Great towers, what must have been the containment structure used to trap this monster, prevent his escape even on this forsaken plane. The only explanation I have for my surviving this legendary encounter is his many years drifting in space and having been fettered in this unforgiving, frozen wasteland. 
";
mons[26, 2] = 1500;
mons[26, 3] = 17;
mons[26, 4] = 2.5;
mons[26, 5] = 1032;
mons[27, 0] = "Toxic Beast";
mons[27, 1] = "This goliath's body has been carved by this world, covered in numerous scars. The squealing queen had seen many battles. Her coarse hair growing in jagged patches between each old wound only increased her fearsome appearance. 

Hot breath from the boar's massive nose fogged up my helmet so badly that it was a marvel I was able to evade her stomping hooves overhead. ";
mons[27, 2] = 1460;
mons[27, 3] = 17;
mons[27, 4] = 1.8;
mons[27, 5] = 644;
mons[28, 0] = "Cremator";
mons[28, 1] = "I could not believe my eyes as this creature erupted from the lava. My suit's temperature gauges screeched in warning. How can anything subsist in such heat? The lava parts in waves as the monster swims rapidly through it. 

Through craters in the Cremator's thick back armor red hot boulders explode in every direction. The amount of heat and pressure within its body must be a source of immense power. However, its head does not appear as well protected. I pray that it is a source of weakness, for if this leviathan bests me I know there will be no remains left to mark my short existence.
";
mons[28, 2] = 1150;
mons[28, 3] = 12;
mons[28, 4] = 2.5;
mons[28, 5] = 626;
mons[29, 0] = "Scavenger";
mons[29, 1] = "Who knew a pack rat could be so dangerous! This creature seems to be hoarding many of the items littered across this planet. I have seen no others of its kind. If it hadn't been so intent on slaying me I would have tried to gain this Scavenger as an ally.. 

Will I ever see a friendly face again, or will my last breaths be on this hostile planet? 
";
mons[29, 2] = 1305;
mons[29, 3] = 14;
mons[29, 4] = 1.2;
mons[29, 5] = 684;
mons[30, 0] = "Providence";
mons[30, 1] = "I recognized him from the security footage... he was the one who blew the cargo hatches open. He was the one who killed everyone. 
#Providence, as I came to call him, moved faster and with more purpose than anything else I've seen on this planet. He must command great power, for he seemed to easily control two great gilded wurms of a species similar to the Magma Worm. Is he able to command everyone on this planet? I don't know his purpose, or his reasoning, but he did not give me a choice. I had to kill him... so why do I feel like I made a terrible mistake?
#...Why did we have a teleporter from this planet in our cargo hold?";
mons[30, 2] = 9000;
mons[30, 3] = 24;
mons[30, 4] = 1.2;
mons[30, 5] = 1058;
critical_chance = 0;
menu_level = 0;
choice = 0;
black_screen = 1;
item_choice = -1;
