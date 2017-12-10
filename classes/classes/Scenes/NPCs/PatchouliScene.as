/**
 * ...
 * @author Liadri
 */
package classes.Scenes.NPCs 
{
	import classes.*;
	import classes.GlobalFlags.kFLAGS;
	import classes.CoC;
	import classes.Scenes.SceneLib;
	import classes.Scenes.Areas.Bog.LizanRogue;
	import classes.Scenes.Areas.Forest.AkbalScene;
	import classes.Scenes.Areas.Mountain.Minotaur;
	import classes.Scenes.Areas.Swamp.CorruptedDrider;
	import classes.Scenes.NPCs.Etna;
	import classes.Scenes.NPCs.Hel;

	public class PatchouliScene extends NPCAwareContent
	{
		public var akbalScene:AkbalScene = new AkbalScene();
		
		public function PatchouliScene() 
		{}
		/*
		Patchou flags:
		PATCHOULI_FOLLOWER: 1 - Meet and not taken offer, 2 - Meet and taken offer, 3 - Bad Ended, 4 - Meet / taken offer / forgiven, 5 - Tied up in camp, 6/7 - Bimbofied
		*/
		private function visitedAllAreas():Boolean {
			if (player.exploredMountain >= 1 && flags[kFLAGS.TIMES_EXPLORED_PLAINS] > 0 && flags[kFLAGS.TIMES_EXPLORED_SWAMP] > 0 && flags[kFLAGS.DISCOVERED_BLIGHT_RIDGE] > 0 && flags[kFLAGS.DISCOVERED_GLACIAL_RIFT] > 0 && flags[kFLAGS.DISCOVERED_VOLCANO_CRAG] > 0 && flags[kFLAGS.DISCOVERED_HIGH_MOUNTAIN] > 0 && flags[kFLAGS.BOG_EXPLORED] > 0 && player.hasStatusEffect(StatusEffects.ExploredDeepwoods))
				return true;
			return false;
		}
		public function meetThePatchouli():void {
			clearOutput();
			if (flags[kFLAGS.PATCHOULI_FOLLOWER] < 1) patchouliFirstMeeting();
			else patchouliNextMeetings();
		}
		public function patchouliFirstMeeting():void {
			outputText("As you explore the forest, you spot a particularly weird cat person sleeping in a tree. Weird isn’t exactly the proper term here, as its fur color simply seems out of this world; either he dyed them or he was born with green fur and pink stripes. While at first you thought he was a girl due to his lean features, long hair and somewhat feminine face, the absence of breasts and the somewhat male, albeit girlish and young voice of the cat tells you otherwise. You approach him and ask him who he is. He stretches, looks at you and gives you an impossibly wide grin.\n\n");
			outputText("\"<i>Nyaaaaaaaaaaaa...Oh, hello traveler? Are you perhaps lost? My job is to guide people across this land to new destinations. Would you like a tour? My name’s Trusty Patchouli, by the way.</i>\"\n\n");
			outputText("The way he says this, with that constant smile, is somewhat disturbing, but now that you think of it ");
			if (visitedAllAreas()) outputText(", you’re pretty sure you saw each and every location on Mareth, so you ponder where he could lead you.");
			else outputText(", you could use a guide across Mareth.");
			flags[kFLAGS.PATCHOULI_FOLLOWER] = 1;
			menu();
			addButton(0, "Accept", patchouliExploreLuckyWheel).hint("Let him lead you to new places.");
			addButton(1, "Decline", camp.returnToCampUseOneHour);
		}
		public function patchouliNextMeetings():void {
			if (flags[kFLAGS.PATCHOULI_FOLLOWER] == 1 || flags[kFLAGS.PATCHOULI_FOLLOWER] == 4) {
				outputText("As you explore the forest you come over Patchouli the cat again. Hes lazily resting on a nearby tree branch. The moment he notice you, he gives you his most unsettling smile before engaging the conversation.\n\n");
				outputText("\"<i>Hello again, are you looking for a guide to new destinations? I can show you the way anytime so long as you ask.</i>\"\n\n");
				if (flags[kFLAGS.PATCHOULI_FOLLOWER] == 4) outputText("Will you really trust him? You already knows he might be leading you into a trap again.\n\n");
				menu();
				addButton(0, "Yes", patchouliExploreLuckyWheel).hint("Let him lead you to new places.");
				addButton(1, "No", camp.returnToCampUseOneHour);
			}
			else {
				outputText("You spot Patchouli resting lazily on a nearby branch. He notices you, opens his eyes and starts to use his usual line just as you grab him and shove him on the ground, holding him by the neck.\n\n");
				outputText("\"<i>Uh...oh crap... Hello traveler, nice to meet you! Do you have business with me???</i>\"\n\n");
				outputText("You tell him he knows who you are and quite well. You can almost see sweat pearling on his face. He’s positively squirming while looking for an escape route.\n\n");
				outputText("\"<i>Uh... yeah, I’m pretty sure we didn’t... Ok, yes, fine, I did it. But there’s no need to get angry, yes? You're still alive and well. Please, forgive me, I sometimes have these urges to... eh, you know. Hehehe...please, let me... go?</i>\"\n\n");
				menu();
				addButton(0, "Forgive", patchouliForgiveHim);
				addButton(1, "Rape", patchouliRapeHim);
				addButton(2, "Kill Him", patchouliKillHim);
				if (silly()) addButton(3, "Finish Him", patchouliFinishHim);
			}
		}
		
		public function patchouliExploreLuckyWheel():void {
			if (flags[kFLAGS.PATCHOULI_FOLLOWER] < 2) flags[kFLAGS.PATCHOULI_FOLLOWER] = 2;
			if (player.exploredMountain <= 0) patchouliExploreMountains();
			if (flags[kFLAGS.DISCOVERED_HIGH_MOUNTAIN] < 1) patchouliExploreHighMoutains();
			else if (flags[kFLAGS.TIMES_EXPLORED_PLAINS] < 1) patchouliExplorePlains();
			//Glacial Rift
			//Vulcanic Crag
			else if (flags[kFLAGS.TIMES_EXPLORED_SWAMP] < 1) patchouliExploreSwamp();
			if (flags[kFLAGS.BOG_EXPLORED] < 1) patchouliExploreBog();
			else if (!player.hasStatusEffect(StatusEffects.ExploredDeepwoods)) patchouliExploreDeepWood();
			else doNext(camp.returnToCampUseOneHour);//until I properly add wonderland scene
		}
		public function patchouliExploreMountains():void {
			clearOutput();
			outputText("The cat jumps down from the tree and walks ahead of you, showing you the way. Strangely, the landscape seems to change absurdly fast around you as you follow him until you end up in a somewhat mountainy area.\n\n");
			outputText("<b>You've discovered the Mountain!</b>\n\n");
			player.explored++;
			player.exploredMountain = 1;
			outputText("As you turn a corner you end up looking at the back of a somewhat tall man with the features of a bull. You’re about to sneak away when Patchouli shouts.\n\n");
			outputText("\"<i>Hey fatty, look! There’s an idiot right over here for you to fuck! Have fun!</i>\"\n\n");
			outputText("You see Patchouli vanishing with a mischievous laugh as the bull man turns and sees you, his monstrously thick shaft hardening as he walks toward you. He obviously intends to beat and rape you.");
			startCombat(new Minotaur());
		}
		public function patchouliExploreHighMoutains():void {
			clearOutput();
			outputText("The cat jump downs from the tree and walks ahead of you, showing you the way. Strangely, the landscape seems to change absurdly fast around you as you follow him until you end up in a somewhat mountainous area with caves and high cliffs.\n\n");
			outputText("<b>Discovered high mountain!</b>\n\n");
			flags[kFLAGS.DISCOVERED_HIGH_MOUNTAIN] = 1;
			outputText("You’re about to question him about this location, when you hear a low pitch growl coming from a nearby cave. Patchouli turns toward you, grinning as he vanishes into thin air, yelling.\n\n");
			outputText("\"<i>The dinner is served, big cat. Enjoy your meal!</i>\"\n\n");
			outputText("Suddenly, a spike misses your shoulder by an inch. You see something walk out of the cave with a sadistic grin. It looks like another cat person, a girl this time, with the features of a lion, but her scorpion like tail and large bat wings tell you she’s much, much worse than a lion.");
			startCombat(new Etna());
		}
		public function patchouliExplorePlains():void {
			clearOutput();
			outputText("The cat jumps down from the tree and walks ahead of you, showing you the way. Strangely, the landscape seems to change absurdly fast around you as you follow him until you end up in a flat grassland with hills popping up every now and then.\n\n");
			outputText("<b>Discovered the plains!</b>\n\n");
			flags[kFLAGS.TIMES_EXPLORED_PLAINS] = 1;
			player.explored++;
			outputText("As you take in the beauty of the landscape, you suddenly realise the cat is no longer ahead of you. Furthermore, there are many passed out gnolls on the ground before you. You hear Patchouli laughter in the distance as a distinct shape rises amongst the defeated hyena warriors bodies, moving toward you. It’s a woman, partially covered with red scales, with reptilian arms, legs and tail. Speaking of which, her tail is actually on fire! She screams a warcry and charges at you, scimitar at the ready.\n\n");
			startCombat(new Hel());
		}
		public function patchouliExploreGlacialRit():void {
			clearOutput();
			
			//startCombat(new ...);
		}
		public function patchouliExploreVulcanic():void {
			clearOutput();
			
			//startCombat(new ...);
		}
		public function patchouliExploreSwamp():void {
			clearOutput();
			outputText("The cat jumps down from the tree and walks ahead of you, showing you the way. Strangely the landscape seems to change absurdly fast around you as you follow him until you end up in a somewhat swampy area full of mosquitos.\n\n");
			outputText("<b>Discovered the swamp!</b>\n\n");
			flags[kFLAGS.TIMES_EXPLORED_SWAMP] = 1;
			player.explored++;
			outputText("You start to notice spider webs around you and when you’re about to ask Patchouli about it,  you notice that your feet just got stuck in a web, unable to move. The cat simply keeps moving forward and disappears into the fog, as multiple creepy eyes open in the mist above you.\n\n");
			outputText("\"<i>Ahahaha seems I caught something, perhaps a new vessel for my broods. I will thoroughly enjoy toying with you.</i>\"\n\n");
			outputText("A creature with the torso of a woman and the lower body of a spider moves down along the web towards you, and, by the look of her monstruous cock, you’re pretty sure she plans to rape you!");
			startCombat(new CorruptedDrider());
		}
		public function patchouliExploreBog():void {
			clearOutput();
			outputText("The cat jumps down from the tree and walks ahead of you, showing you the way. Strangely, the landscape seems to change absurdly fast around you as you follow him until you end up in a bog.\n\n");
			outputText("<b>Discovered the bog!</b>\n\n");
			flags[kFLAGS.BOG_EXPLORED] = 1;
			outputText("The area has something eerie and sinister about it, but as you’re about to tell such to your guide, you suddenly realise that the cat actually left a while ago and that you’ve been walking alone! Furthermore, the warning signs around you aren’t any good either. You suddenly dodge an attack surging out of nowhere. It’s a lizan and by the look of it, he’s trying to mug you.\n\n");
			startCombat(new LizanRogue());
		}
		public function patchouliExploreDeepWood():void {
			clearOutput();
			outputText("The cat jumps down from the tree and walks ahead of you, showing you the way. Strangely, the landscape seems to change absurdly fast around you as you follow him until you end up in a darker and more sinister part of the forest.\n\n");
			outputText("<b>Discovered Deepwood!</b>\n\n");
			player.createStatusEffect(StatusEffects.ExploredDeepwoods, 0, 0, 0, 0);
			outputText("As you are about to question your guide, the cat suddenly jumps onto a branch and yells before vanishing.\n\n");
			outputText("\"<i>Hey, Akbal! You have trespassers!</i>\"\n\n");
			outputText("You see a large panther surge out of a bush, and the way it looks at you is anything but friendly!");
			akbalScene.supahAkabalEdition();
		}
		public function patchouliExploreWonderland():void {
			clearOutput();
			
			//startCombat(new ...);
		}
		
		public function patchouliForgiveHim():void {
			clearOutput();
			outputText("You sigh and decide to forgive the cat for what he has done.\n\n");
			outputText("\"<i>Thank you! Thank you! Don’t worry, I will never trick anyone again!</i>\"\n\n");
			outputText("He vanishes into thin air and with his characteristic smirk and you simply head back to camp.");
			flags[kFLAGS.PATCHOULI_FOLLOWER] = 4;
			doNext(camp.returnToCampUseOneHour);
		}
		public function patchouliRapeHim():void {
			clearOutput();
			outputText("You got plans for this insolent cat. Let’s see how long he smiles once you're violating that ");
			if (player.hasVagina()) outputText("tiny dick");
			else outputText("firm little ass");
			outputText(" of his.\n\n");
			if (player.hasVagina()) patchouliRapeHimFemale();
			else patchouliRapeHimMale();
		}
		public function patchouliRapeHimFemale():void {
			outputText("You force the catboy on his back and yank his shorts away, revealing his cute tiny barbed cock.\n\n");
			outputText("\"<i>Uh, I’m sure we can sort that out in a different way! I can lead you to treasure, riches, a minotaur... wait, forget I ever said anything about the minotaur!</i>\"\n\n");
			outputText("You won’t need a minotaur for now, as you got exactly what you want right here! You don’t give him the chance to teleport away as you grab him by the neck and take hold of his cock with your other hand. Patchouli starts to mewl with anguished pleasure as you stroke his cat cock with your hand. You thought that by now, he would have teleported, but you suspect he's secretly a complete sub and loves getting punished for his mischief, not that you care about his kinks. ");
			outputText("What you care about is punishing that cock of his and getting your revenge. You spit on his cat cock and lube it properly before aligning your cunt with it. Patchouli screeches when you forcefully impale yourself on his dick and begin to pump for his boy milk. His barbs caress your walls in just the perfect way.\n\n");
			outputText("\"<i>Please.. not so rough, my cock hurts!</i>\"\n\n");
			outputText("He could at least pretend he likes it, you’re already are very kind, granting him the right to even get raped in the first place instead of straight out killing him. Soon, you find yourself on the verge of orgasm. Patchouli finally loses control of his cat cock as it twitches, filling you with kitty jizz and causing your orgasm shortly after.\n\n");
			outputText("You keep milking the prankster for a few hours until he is passed out. Then bring him back to your camp and tie him to a tree.\n\n");
			player.orgasm();
			flags[kFLAGS.PATCHOULI_FOLLOWER] = 5;
			doNext(camp.returnToCampUseOneHour);
		}
		public function patchouliRapeHimMale():void {
			var x:int = player.cockThatFits(36, "length");
			outputText("You force the catboy on his back and yank his shorts away, revealing his girly ass and his cute pucker. Patchouli gulps as your [cock] hardens, already aware of what is about to happen.\n\n");
			outputText("\"<i>Uh I’m sure we can sort that out in a different way! I can lead you to treasure, riches, a minotaur... wait, forget I ever said anything about the minotaur!</i>\"\n\n");
			outputText("You don’t give him the chance to teleport away as you grab him by the neck and force your [cock] in.\n\n");
			if (player.cocks[x].cockLength >= 22) {
				outputText("\"<i>Eeeeep you're tearing me apart! Please stop, I’m telling you that you're tearing my ass apart!</i>\"\n\n");
				outputText("What a liar, you're all too aware that this jerk’s ability to play with dimensional travel allows him to send most of your cock into some other dimension. As a matter of fact, his stomach isn't even bulging from your insertion, but his pucker sure looks like it's stretched to its limit. ");
			}
			outputText("You begin to fuck his butt thoroughly in order to teach the little boyslut a lesson his ass won’t forget. His anus begins to contract and pulse around your dick like a vagina and who knows, maybe he somehow connected it to a cunt somewhere across the multiverse. Before long the sensation of Patchouli’s asscunt proves too much for you and you fill it full of your jizz. Patchouli seems to get off from his tormented ass, his cat cock pulsing as he reaches orgasm, splattering the grass below him with cum. He sighs in relief as you pull your [cock] out of his ass, then teases you.\n\n");
			outputText("\"<i>Some poor girl in that village must be pregnant by now, you should be ashamed, you know?</i>\"\n\n");
			outputText("This little asshole has pranked you long enough. You knock him unconscious and bring him back to camp, making sure to tie him to a nearby tree");
			if (camp.getCampPopulation() >= 2) outputText(". Leaving one of your friends to watch over him at all time");
			outputText(".\n\n");
			player.orgasm();
			flags[kFLAGS.PATCHOULI_FOLLOWER] = 5;
			doNext(camp.returnToCampUseOneHour);
		}
		public function patchouliKillHim():void {
			clearOutput();
			outputText("No way are you going to forgive him for this. You proceed to snap his neck, leaving him lifeless on the ground. Oddly enough, the jerk is still smiling, even in death.\n\n");
			outputText("You head back to camp, most disturbed by this.");
			flags[kFLAGS.PATCHOULI_FOLLOWER] = 3;
			doNext(camp.returnToCampUseOneHour);
		}
		public function patchouliFinishHim():void {
			clearOutput();
			outputText("You toss the cat into the air and start by punching its chest to increase his altitude, then kick his balls. You chain this with a hundred kicks, tossing him even higher into the air as you charge an energy ball and fire it at the feline. As the cat is disintegrated, a disembodied voice growls out <b>“FATALITY!”</b> in the background. You strike a vicious pose… And are immediately mortified of whatever came over to you.\n\n");
			outputText("You have no idea how you did that... must’ve been the anger. You decide to never speak, or even think, of this ever again and head back to camp.");
			flags[kFLAGS.PATCHOULI_FOLLOWER] = 3;
			doNext(camp.returnToCampUseOneHour);
		}
		
		public function patchouleMainCampMenu():void {
			clearOutput();
			if (flags[kFLAGS.PATCHOULI_FOLLOWER] == 5) {
				outputText("You approach the tied up cat wary of possible hidden tricks.\n\n");
				outputText("\"<i>Hello again... felt like visiting your prisoner for a chat? You know I could do soooo many things If I was not tied up to the tree.</i>\"\n\n");
				menu();
				if (player.hasItem(consumables.BIMBOLQ)) addButton(0, "Bimbo Liquer", patchouleBimbofication);
				else addButtonDisabled(0, "You need Bimbo Liquer for this.");
				addButton(1, "Talk", patchouleTalkMenu);
				addButton(14, "Back", camp.campSlavesMenu);
			}
			if (flags[kFLAGS.PATCHOULI_FOLLOWER] >= 6) {
				outputText("You check on Patchoulie. The bimbo catgirl is lazily resting on a tree branch, smiling unsettlingly as you approach her.\n\n");
				outputText("\"<i>Felt like havin fun, [name]? Else I can get us to ");
				if (visitedAllAreas()) outputText("my place anytime");
				else outputText("a new place");
				outputText(".</i>\"\n\n");
				menu();
				//addButton(0, "Appearance", patchouleAppearance);
				addButton(1, "Talk", patchouleTalkMenu);
				addButton(2, "Sex Her", patchouleSexHer);
				addButton(3, "Give Item", patchouleGiveItem);
				if (!visitedAllAreas()) addButton(5, "Yes", patchouliExploreLuckyWheel).hint("Let her lead you to new places.");
				addButton(14, "Back", camp.campSlavesMenu);
			}
		}
		
		public function patchouleBimbofication():void {
			clearOutput();
			outputText("You tell your prisoner he will soon be free to go so long as he drinks the weird bottle you are holding.\n\n");
			outputText("Patchouli eyes you, then the bottle, then just shrugs and opens his cute little mouth as if to say ‘get to it’. The poor bastard has absolutely no idea of what is in that concoction, does he? Well it'll only be twice as fun once he realises it.\n\n");
			outputText("You pour the bottle in his mouth, making sure he drinks it all and wait patiently in order to watch the result.\n\n");
			outputText("\"<i>Ugh what was in that bottle? I feel so... happy?</i>\"\n\n");
			outputText("Patchouli moans as his cock shrinks and disappears entirely in a newly forming slit, his male parts turning into a vagina. His chest swells from flat to DD cup in no time as his already effeminate cat face and voice tone changes into a straight forward female. His hairs lengthen as their original orange color turns to a shiny platinum blonde with purple streaks, guess these weren't just stylist dye coloring after all.\n\n");
			outputText("Patchouli now actually looks just as he, from your perspective, was always meant to be, a girl. She giggles for a few seconds for no real reason at all and you can’t help but ponder if the liquor didn’t just make her even more crazy.\n\n");
			outputText("\"<i>Hey cutie, untie me!</i>\"\n\n");
			outputText("Well now that she says it you're unsure this is a bright idea but fair is fair, and you promised. You untie the still wide grinning Patchouli.\n\n");
			outputText("Her reaction is immediate, swift and somewhat unexpected. She disappears and reappears right above you, making you fall over. Before you know it, the cat woman is sitting on your chest, grinning widely again and you are almost afraid of what will happen next. Not in a million years did you imagine she would turn the tables.\n\n");
			outputText("\"<i>Nyaaaaaa~, I’m in heat [name] and you know exactly what this means. I’m crazy for you, so let's fuck till you go crazy too!</i>\"\n\n");
			outputText("What in hell?! You though giving him the liquor would turn him into a compliant nymphomaniac, not into a insane cat in heat.\n\n");
			outputText("\"<i>Oh but that's where you're wrong [name], I never was sane to begin with. Everyone from my homeland is mad one way or another and if I may be honest I’m one of the craziest. Now I’m not only crazy, I’m literally crazy for you so lets go mad together!</i>\"\n\n");
			flags[kFLAGS.PATCHOULI_FOLLOWER] = 6;
			flags[kFLAGS.PATCHOULI_GIRL_OR_MORPH] = 0;
			flags[kFLAGS.PATCHOULI_CUP_SIZE] = 5;
			flags[kFLAGS.PATCHOULI_COCK] = 0;
			if (player.hasVagina()) patchouleGirlOnGirl();
			else patchouleVaginal();
		}
		
		public function patchouleAppearance():void {
			clearOutput();
			doNext(patchouleMainCampMenu);
		}
		
		public function patchouleTalkMenu():void {
			clearOutput();
			outputText("You tell Patchouli you have a few questions ");
			if (flags[kFLAGS.PATCHOULI_FOLLOWER] == 5) outputText("he");
			else outputText("she");
			outputText(" should answer.\n\n");
			outputText("\"<i>Aw nya, wasting your time on such trifles");
			if (flags[kFLAGS.PATCHOULI_FOLLOWER] >= 6) outputText(" when we could be having sex");
			outputText(". What could I know that you do not... fine I’ll answer whatever you want me to.</i>\"\n\n");
			menu();
			addButton(0, "Trick People?", patchouleTalkMenuTrickPeople);
			if (flags[kFLAGS.PATCHOULI_FOLLOWER] == 5) addButton(1, "Who is he?", patchouleTalkMenuWhoIsSHe);
			else addButton(1, "Who is she?", patchouleTalkMenuWhoIsSHe);
			addButton(14, "Back", patchouleMainCampMenu);
		}
		public function patchouleTalkMenuTrickPeople():void {
			clearOutput();
			outputText("Seriously, what is with ");
			if (flags[kFLAGS.PATCHOULI_FOLLOWER] == 5) outputText("him");
			else outputText("her");
			outputText(" and tricking people? That's disgusting! Is ");
			if (flags[kFLAGS.PATCHOULI_FOLLOWER] == 5) outputText("he");
			else outputText("she");
			outputText(" some kind of psycho who gets off from people getting raped?\n\n");
			outputText("\"<i>Getting off? Rape? Nasty? What a weird set of terms you're saying there. As far as I care it's your fault for being so gullible as I, Patchoul");
			if (flags[kFLAGS.PATCHOULI_FOLLOWER] == 5) outputText("i");
			else outputText("e");
			outputText(", am merely a prankster devoid of all worldly wants, but still here to playfully remind the unwary that no matter where they go nowhere in the world is truly safe.</i>\"\n\n");
			outputText("So wait, ");
			if (flags[kFLAGS.PATCHOULI_FOLLOWER] == 5) outputText("he");
			else outputText("she");
			outputText(" thinks it's perfectly okay to lure people into rape traps?\n\n");
			outputText("\"<i>Of course, [name]. It's all fun and games, at least for me.</i>\"\n\n");
			doNext(patchouleTalkMenu);
			cheatTime(1/4);
		}
		public function patchouleTalkMenuWhoIsSHe():void {
			clearOutput();
			outputText("Just what is ");
			if (flags[kFLAGS.PATCHOULI_FOLLOWER] == 5) outputText("he");
			else outputText("she");
			outputText(" really? You don’t know of cat morph with teleportation ability.\n\n");
			outputText("\"<i>Me nya? I am everything and nothing, everywhere and nowhere. Nya to describe what I am is to also describe what I am not. Through for people like you the simple answer is a cheshire cat.</i>\"\n\n");
			outputText("How can ");
			if (flags[kFLAGS.PATCHOULI_FOLLOWER] == 5) outputText("he");
			else outputText("she");
			outputText(" be and not be at the same time that makes no senses.\n\n");
			outputText("\"<i>I’m from a different world with a different mindset. One where simple rules such as your so called “physics” and “logic” do not apply. A mad dimension where such things are commonplace and the norm. How very amusing of you to question whether I make sense or not when the very stability of this dimension you call Mareth in itself makes so little sense. People fucking everywhere, mad mages trading their souls for power, animals talking and breeding, food that transforms you, people being jealous, hurting and stealing from each other? None of this makes sense, you know, yet you're here questioning a cat about the logics of ");
			if (flags[kFLAGS.PATCHOULI_FOLLOWER] == 5) outputText("his");
			else outputText("her");
			outputText(" action? I say you're the crazy one. Know this... by the time your so called quest is over you will be even crazier then me");
			if (flags[kFLAGS.PATCHOULI_FOLLOWER] == 5) outputText(". It’s like that rope and tree, why do you think I didn’t go elsewhere yet? It's because I don’t have a cheese on me to break free. I'm not bound by the same rules and reality, yet I’m bound all the same. You and I come from different worlds, [name]");
			outputText(".</i>\"\n\nCome again? Is the cat actually calling you crazy? The cheshire teasingly replies with a wide smile.\n\n");
			outputText("\"<i>To you what I say may make no sense, but things such as common sense are alien to me for common sense itself is based on logic. You can access that world too if you try... everyone has the potential to visit it from the depth of their mind, to touch it, if even for a second. A world different from this one, so close yet so far, but again, for someone like me distances holds little meaning. Maybe if you ask me nicely I will bring you to its gates sometimes.</i>\"\n\n");
			if (flags[kFLAGS.PATCHOULI_FOLLOWER] == 5) outputText("Of course you would have to untie him first and that ain't happening anytime soon.\n\n");
			doNext(patchouleTalkMenu);
			cheatTime(1/4);
		}
		
		public function patchouleSexHer():void {
			menu();
			if (player.hasVagina()) {
				addButton(0, "Girl On Girl", patchouleGirlOnGirl);
				//if () addButton(1, "TakeVaginal", );
			}
			if (player.hasCock()) {
				addButton(2, "Vaginal", patchouleVaginal);
				//addButton(3, "Anal", );
			}
			//addButton(14, "Back", patchouleMainCampMenu);
		}
		public function patchouleGirlOnGirl():void {
			if (flags[kFLAGS.PATCHOULI_FOLLOWER] == 7) clearOutput();
			outputText("While you were thinking this through, Patchouli’s paws got to work");
			if (!player.isNaked()) outputText(" removing your [armor]");
			outputText(". With your arms pinned to the ground by her hindpaws, you are unable to struggle as her paw like hands playfully insert a finger inside your slit. You moan in surprise as the cheshire amorously nuzzles your neck and slides her digit in and out of your [pussy].\n\n");
			outputText("\"<i>Nyaaaa... I’m totally in heat for you [name] so let me take good care of you.</i>\"\n\n");
			outputText("In heat. huh? Well she sure did put you in the mood as, lost in the moment, you grab her mouth and start exchanging kisses with her as she keeps fingering you. Her tail caresses your inner thigh and you almost cum on your own, however in your delirium you begin playing with your partner as well. Patchoulie rewards you with a set of happy mewls as your finger gets drenched with her pussy juice.\n\n");
			outputText("\"<i>NYYAAAAAAaaa!!! Don’t stop! Please don’t stop... so close!</i>\"\n\n");
			outputText("Gosh, she really must’ve been starving for attention. She gives you free access to her cunt and you don’t disappoint. Getting your hand further inside and tweaking her bitch button, you do all in your power to make her reach a wonderland of bliss! The two of you begin to lose track as you lose yourself to the pleasure countless times. You vaguely remember her wide smile as the both of you reached orgasm just before you lost consciousness.\n\n");
			if (flags[kFLAGS.PATCHOULI_FOLLOWER] == 7) {
				outputText("\"<i>Nyaaa... Always a pleasure to breed with you, [name]. Ask me whenever you are in the mood again, I’m looking forward to it.</i>\"\n\n");
			}
			else {
				outputText("\"<i>Nyaaaa... Know what, [name]? As of today let’s be mates, nya. Come over to me whenever you're in the mood or in heat, I’ll always be ready for you waiting up that branch.</i>\"\n\n");
				flags[kFLAGS.PATCHOULI_FOLLOWER] = 7;
			}
			player.orgasm();
			doNext(camp.returnToCampUseOneHour);
		}
		
		public function patchouleVaginal():void {
			if (flags[kFLAGS.PATCHOULI_FOLLOWER] == 7) clearOutput();
			outputText("While you were thinking this through, Patchouli’s paws got to work");
			if (!player.isNaked()) outputText(" removing your [armor]");
			outputText(". You were about to protest when her naughty paw suddenly got ahold of your [cock].\n\n");
			outputText("\"<i>Nyaaaaaa ");
			if (player.catCocks() > 0) outputText("barbs are the bestest");
			else outputText("no barb on this one but I don’t care");
			outputText("! Let me have a taste of that cock.</i>\"\n\n");
			outputText("She starts sliding her paw on your cock playfully like she’s playing with a toy. You’re stunned, both by her audacity and the pleasure from your member as the cat starts to forcibly masturbate you. You moan in confusion, not sure whether you or she is in control anymore as she wraps her mouth around your dick, making sure not to bite it off. Wow, if she's going to go so far you won’t have any way to hold back. You groan as your cock fills the cat ");
			if (flags[kFLAGS.PATCHOULI_GIRL_OR_MORPH] == 0) outputText("morph");
			else outputText("girl");
			outputText("’s throat full of jizz, the cheshire purring as she drinks every drop of it. However your partner is hardly sated.\n\n");
			outputText("\"<i>Nyaaaaa~ It’s my turn to feel good mate. So go ahead and punish my hole... hard.</i>\"\n\n");
			outputText("Wait what? You barely get the chance to catch your breath before the cat slut takes hold of your cock again, this time guiding it straight to her vagina. She purrs softly as your [cock] slides in and then you're already gone for a new round. The cheshire cat ");
			if (flags[kFLAGS.PATCHOULI_GIRL_OR_MORPH] == 0) outputText("morph");
			else outputText("girl");
			outputText(" mewls and moans as she milks you with her pussy. The fact she's a bimbo also somehow helps her skill despite having been a male not so long before. She lets her purple fur slide against your [skin] and you grope her ass as she joyfully bounces up and down along your cock length. You cum in her cunt as she howls a final “NYYAAAAAAA” skyward her tail straight like an iron bar. After this ordeal the both of you finally doze off to sleep.\n\n");
			outputText("When you wake up Patchoulie is resting on all four next to you in a seductive pose, still holding that unsettling smile that is her signature as she plays with one of the hair braid she likely got made while you were sleeping. You ought to admit, this new girl’s hair cut fits her well.\n\n");
			if (flags[kFLAGS.PATCHOULI_FOLLOWER] == 7) {
				outputText("\"<i>Nyaaa... Always a pleasure to breed with you, [name]. Ask me whenever you are in the mood again, I’m looking forward to it.</i>\"\n\n");
			}
			else {
				outputText("\"<i>Nyaaaa... Know what, [name]? As of today let’s be mates, nya. Come over to me whenever you're in the mood or in heat, I’ll always be ready for you waiting up that branch.</i>\"\n\n");
				flags[kFLAGS.PATCHOULI_FOLLOWER] = 7;
			}
			player.orgasm();
			doNext(camp.returnToCampUseOneHour);
		}
		
		public function patchouleGiveItem():void {
			menu();
			//if (player.hasItem(consumables.P_DRAFT)) addButton(0, "P. I. Draft", );
			//if (player.hasItem(consumables.W_FRUIT)) addButton(1, "Whisker Fruit", );
			if (player.hasItem(consumables.P_S_MLK) && flags[kFLAGS.PATCHOULI_CUP_SIZE] < 29) addButton(2, "P. Succ. Milk", patchouleGivePurifiedSuccubusMilk);
			//if (player.hasItem(consumables.PINKEGG)) addButton(3, "Pink Egg", );
			//if (player.hasItem(consumables.REDUCTO)) addButton(4, "Reducto", );
			addButton(14, "Back", patchouleMainCampMenu);
		}
		public function patchouleGivePurifiedSuccubusMilk():void {
			clearOutput();
			if (flags[kFLAGS.PATCHOULI_GIRL_OR_MORPH] == 1) {
				outputText("You consider Patchoulie and decide she could use a bigger pair of breasts. You show her the bottle and ask her to drink it.\n\n");
				outputText("\"<i>Nyaaaa yea sure why not. It smells good anyway and I love milk.</i>\"\n\n");
				flags[kFLAGS.PATCHOULI_CUP_SIZE] += 2;
				outputText("You smile wide as the bimbo cheshire drinks the bottle. The effects are immediate and visible as she closes her eyes and moans a loud mewl her breast expending up to " + Appearance.breastCup(flags[kFLAGS.PATCHOULI_CUP_SIZE]) + ". She licks her lips in delight then look back at you.\n\n");
				outputText("\"<i>Nyaa well what you looking at, you lecher? Lets fuck already!</i>\"\n\n");
			}
			else {
				outputText("You consider Patchoulie and decide she could use a shaving. You show her the bottle and ask her to drink it.\n\n");
				outputText("\"<i>Nyaaaa yea sure why not. It smells good anyway.</i>\"\n\n");
				outputText("You smile wide as the bimbo cheshire drinks the bottle. The effects are immediate and visible as she moans a loud mewl the fur on her face and torso falling apart to reveal the sexy skin beneath. Her face changes too to something closer to a human. She has the every trait of sexy catgirl now through her wide, unsettling smile still remains albeit not devoid of a lewd nuance. You guess that’s a trait all cheshire cats share.\n\n");
				outputText("\"<i>Nyaa well what you looking at, you lecher? Lets fuck!</i>\"\n\n");
				flags[kFLAGS.PATCHOULI_GIRL_OR_MORPH] = 1;
			}
			patchouleSexHer();
		}
	}
}