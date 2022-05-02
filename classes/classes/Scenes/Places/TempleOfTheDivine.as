/**
 * ...
 * @author Liadri
 */
package classes.Scenes.Places
{
import classes.*;
import classes.GlobalFlags.kFLAGS;
import classes.Items.WeaponLib;
import classes.Scenes.SceneLib;
import classes.Stats.Buff;
import classes.display.SpriteDb;
import classes.Scenes.Places.TempleOfTheDivine.*;

	public class TempleOfTheDivine extends BaseContent {

		public function TempleOfTheDivine() {}

		public var sapphire:Sapphire = new Sapphire();
		public var onyx:Onyx = new Onyx();
		public var playerBuilder:PlayerGargoyleBuilder = new PlayerGargoyleBuilder();

		public function canMarry():Boolean {
			return flags[kFLAGS.WEDDINGS_UNLOCKED]; //talked
		}

		public function firstvisitintro():void {
			flags[kFLAGS.FOUND_TEMPLE_OF_THE_DIVINE] = 1;
			flags[kFLAGS.SAPPHIRE_TALKS] = 0;
			spriteSelect(SpriteDb.s_sapphire);
			clearOutput();
			outputText("As you wander the mountains, you eventually climb to the very top, something you never expected to do. Weirdly enough, sitting on a nearby peak is what appears to be a massive temple. You approach the intimidating doors of the building and open them wide. Instantly you’re taken aback by the sight in front of you. ");
			outputText("There are ancient bloodstains marking the stone floor and stained-glass windows depicting various deities adorning each wall. At the end of the building that obviously once was a holy site, sits one depicting Marae. Under each window is a somewhat damaged altar, the light outside shining faintly upon it.");
			outputText("\n\nAs you walk towards Marae’s Altar, a threatening voice echoes through the temple. \"<i>No one will defile this sacred place! I will slay you before you can cause any further damage!</i>\"");
			outputText("\n\nYou realize that you were never alone in the room as a large and heavy object hits you from behind, sending you sprawling to the ground. As you try to stand up, something grabs you by the leg, lifting you upside down in the air with apparent ease. While uncomfortable, and most definitely a shock, this gives you enough time to take a good look at what, or more specifically who, grabbed you. ");
			outputText("It seems to be a 7-foot tall, stone-skinned gargoyle. She carries a huge halberd and appears to be about to impale you on it. Although you wriggle, you find no weakness in her grip, you can’t escape from this one. Knowing your death is near, you utter a swift ");
			if (player.cor > 66) outputText("and desperate ");
			outputText("prayer to whichever gods may be listening. This has a surprising effect on the gargoyle, stilling her almost instantly.");
			outputText("\n\n\"<i>Demons... do not pray, you clearly still have a soul. Perhaps I misjudged you.</i>\"");
			outputText("\n\nWith little ceremony, she roughly sets you back on the ground, caring little for your well-being, merely in order to thoroughly examine you. You tell her that you ");
			if (SceneLib.dungeons.checkFactoryClear()) {
				if (player.humanScore() < 14) outputText("were");
				else outputText("are");
				outputText(" a human, a champion, sent by your village as tribute to the demons under the guise of being a hero.");
			}
			else {
				if (player.humanScore() < 14) outputText("were");
				else outputText("are");
				outputText(" a human, a champion, sent by your village to defeat the demons. However, just what is this place and who is she?");
			}
			outputText("\n\n\"<i>There haven't been many humans in Mareth, especially since the demons took over, so it’s likely that you are the first to make it here in a long time. If you seek salvation, I’m afraid the temple will not provide any, as the gods and their powers have long since left their altars. As for who I am, my name is Sapphire. I am the last guardian of this sacred ground, and the last line of defense against the fiends that desecrate this land.</i>\"");
			outputText("\n\nHer name seems to be somewhat appropriate, her eyes glowing with a faint, azure hue. As you ponder these details, the gargoyle turns her back to you, taking flight towards one of the pillars in the room.\n\n\"<i>You are welcome to visit this place as often as you see fit. However, I will be watching you.</i>\"\n\n<b>You can now visit the Temple of the Divines!</b>");
			doNext(camp.returnToCampUseOneHour);
		}

		public function repeatvisitintro():void {
			clearOutput();
			spriteSelect(SpriteDb.s_sapphire);
			outputText("You decide to make a trip to the temple. However, as soon as you enter the sacred ground, Sapphire screeches and takes flight, spear at the ready. Luckily, she calms down once she recognizes you, assuming a relaxed pose in the middle of the temple.");
			outputText("\n\n\"<i>Well, hello there! Nice to see you again [name]. You're welcome here, as usual... So are you here to pray?");
			if (flags[kFLAGS.SAPPHIRE_AFFECTION] == 100) outputText(" Or perhaps you're here for something more... mutually agreeable, instead?");
			outputText("</i>\"");
			if (flags[kFLAGS.SAPPHIRE_AFFECTION] == 100) outputText(" she says, winking with a lusty smile.");
			mainmenu();
		}

		public function templeMainMenu():void {
			clearOutput();
			outputText("What would you like to do in the temple?");
			mainmenu();
		}

		private function mainmenu():void {
			outputText("\n\nGargoyle Quest progress: " + flags[kFLAGS.GARGOYLE_QUEST] + "");
			outputText("\n\nTemple Repair progress: " + flags[kFLAGS.TEMPLE_OF_THE_DIVINE_PROGRESS] + "");
			menu();
			if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_PROGRESS] >= 1) {
				addButton(0, "Pray", PlayerPrayAtTemple).hint("Offer your prayer to one of the temple altars.");
				addButton(1, "Repair", TempleAltairsRebuildMenu).hint("Restore the temple.");
			}
			if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_MARAE] == 1) {
				if (havingOrUsingBSwordOrExcalibur()) addButton(2, "Put Sword", puttingBSwordOrExcaliburOnAltair);
				if (player.statusEffectv2(StatusEffects.TempleOfTheDivineTracker) == 2 || player.statusEffectv2(StatusEffects.TempleOfTheDivineTracker) == 3) addButton(2, "Take Sword", takingExcaliburFromAltair);
				if (player.hasItem(consumables.P_PEARL, 1)) addButton(3, "Pearl", puttingPurePearlOnAltair);
				if (player.statusEffectv3(StatusEffects.TempleOfTheDivineTracker) == 2) addButton(3, "Pearl", takingPurePearlFromAltair);
			}
			addButton(5, "Sapphire", sapphire.sapphiremenu).hint("Have a chat with the gargoyle.");
			if (flags[kFLAGS.ONYX_PATH] > 0) addButton(6, "[onyx name]", onyx.krystalonyxmenu).hint("Have a sex with [onyx name].");
			else addButtonDisabled(6, "???", "Sapphire is a little lonely out there. Maybe you could make her a friend...?")
			addButton(7, "Basement", templeBasement).hint("Visit the temple basement.");
			if (flags[kFLAGS.FORGEFATHER_MOVED_TO_TEMPLE] == 1) addButton(8, "Workshop", SceneLib.forgefatherScene.workshopMainMenu);
			addButton(14, "Leave", camp.returnToCampUseOneHour);
		}

		public function PlayerPrayAtTemple():void {
			clearOutput();
			if (anyOfAltairsRepaired()) {
				outputText("Would you like to pray, and if yes, to whom?");
				menu();
				if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_MARAE] == 1 && !player.hasStatusEffect(StatusEffects.BlessingOfDivineMarae)) addButton(0, "Marae", PlayerPrayAtTempleMaraeAltair).hint("Pray to Marae for empowered white magic.");
				else addButtonDisabled(0, "Marae", "You not yet restored this altair.");
				if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_TAOTH] == 1 && !player.statStore.hasBuff("TaothBlessing")) addButton(1, "Taoth", PlayerPrayAtTempleTaothAltair).hint("Pray the trickster god for an increase to your Agility, (if kitsune)kitsune powers (end of cut) and guile.");
				else addButtonDisabled(1, "Taoth", "You not yet restored this altair.");
				if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_FERA] == 1 && !player.hasStatusEffect(StatusEffects.BlessingOfDivineFera)) addButton(2, "Fera", PlayerPrayAtTempleFeraAltair).hint("Pray the fallen goddess Fera for an increase to your innuendo and resilience to desire.");
				else addButtonDisabled(2, "Fera", "You not yet restored this altair.");
				addButtonDisabled(3, "E.e.ie.", "You not yet restored this altair.");
				if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_FENRIR] == 1 && !player.statStore.hasBuff("FenrirBlessing")) addButton(4, "Fenrir", PlayerPrayAtTempleFenrirAltair).hint("Pray to the god sharing your body for an increase to your might.");
				else addButtonDisabled(4, "Fenrir", "You not yet restored this altair.");
				//FUCK, STOP HINTING NYI OPTIONS, IT'S MISLEADING
				/*
				addButtonDisabled(5, "???", "You not yet restored this altair.");//life godess
				addButtonDisabled(6, "Krat..", "You not yet restored this altair.");
				addButtonDisabled(7, "???", "You not yet restored this altair.");//magic god
				*/
				//Remove curses
				if (anyOfAltairsRepaired() && player.gems >= 5000) addButton(13, "Remove Curses", PlayerRemoveCurses).hint("Make a donation to a divinity in order to be freed of all curses or hexes.");
				else if (!anyOfAltairsRepaired()) addButtonDisabled(13, "Remove Curses", "Without a functionning altar you cannot call upon divine power for deliverence.")
				else if (!player.statStore.hasBuff("Weakened") && !player.statStore.hasBuff("Drained") && !player.statStore.hasBuff("Damaged")) addButtonDisabled(13, "Remove Curses", "You are not currently under the affliction of a curse or hex.")
				else if (player.gems < 5000) addButtonDisabled(13, "Remove Curses", "You need at least 5000 gem in order to request deliverance from your maledictions and other status ailments.")
				addButton(14, "Back", templeMainMenu);
			}
			else {
				outputText("You attempt a prayer to a god of Mareth. Sadly, if this place ever housed the god’s divine power, its ruined state no longer can contain it. It seems you will get no benefit from praying here until you repair the altars, with the god simply unable to contact you while the building is in this sinful state.\n\n");
				doNext(camp.returnToCampUseOneHour);
			}
		}

		private function anyOfAltairsRepaired():Boolean {
			return flags[kFLAGS.TEMPLE_OF_THE_DIVINE_MARAE] == 1 || flags[kFLAGS.TEMPLE_OF_THE_DIVINE_TAOTH] == 1 || flags[kFLAGS.TEMPLE_OF_THE_DIVINE_FENRIR] == 1 || flags[kFLAGS.TEMPLE_OF_THE_DIVINE_FERA] == 1;
		}

		public function PlayerRemoveCurses():void {
			clearOutput();
			outputText("You approach one of the many altars, would you like to give a donation of 5000 gems to be freed from your curses or hexes?");
			doYesNo(PlayerRemoveCursesYes, PlayerPrayAtTemple);
		}

		public function PlayerRemoveCursesYes():void {
			clearOutput();
			outputText("Divine powers radiate from the altar banishing the evil that has taken a grip on your body to the void.");
			player.gems -= 5000;
			if (player.statStore.hasBuff("Weakened")) player.statStore.removeBuffs("Weakened");
			else if (!player.statStore.hasBuff("Drained")) player.statStore.removeBuffs("Drained");
			else player.statStore.removeBuffs("Damaged");
			doNext(PlayerPrayAtTemple);
		}

		public function loosingMaraeBlessing():void {
			if (player.hasStatusEffect(StatusEffects.BlessingOfDivineMarae)) {
				outputText("You chose to pray a different Deity losing the favor of the first to gain the bonus of the other.\n");
				outputText("<b>You lost the Blessing of Divine Agency - Marae</b>\n");
				player.removeStatusEffect(StatusEffects.BlessingOfDivineMarae);
			}
		}

		public function loosingTaothBlessing():void {
			if (player.statStore.hasBuff("TaothBlessing")) {
				outputText("You chose to pray a different Deity losing the favor of the first to gain the bonus of the other.\n");
				outputText("<b>You lost the Blessing of Divine Agency - Taoth</b>\n");
				player.statStore.removeBuffs("TaothBlessing");
			}
		}

		public function loosingFenrirBlessing():void {
			if (player.statStore.hasBuff("FenrirBlessing")) {
				outputText("You chose to pray a different Deity losing the favor of the first to gain the bonus of the other.\n");
				outputText("<b>You lost the Blessing of Divine Agency - Fenrir</b>\n");
				player.statStore.removeBuffs("FenrirBlessing");
			}
		}

		public function loosingFeraBlessing():void {
			if (player.hasStatusEffect(StatusEffects.BlessingOfDivineFera)) {
				outputText("You chose to pray a different Deity losing the favor of the first to gain the bonus of the other.\n");
				outputText("<b>You lost the Blessing of Divine Agency - Fera</b>\n");
				player.removeStatusEffect(StatusEffects.BlessingOfDivineFera);
			}
		}

		public function PlayerPrayAtTempleMaraeAltair():void {
			clearOutput();
			outputText("You pray to Marae. As you speak your prayer, you feel the warmth of the goddess' serenity flow through you, her motherly love for this land swaddling you; healing your wounds and washing away corrupt thoughts. You also feel the blessing of the deity empowering your white magic.\n");
			loosingTaothBlessing();
			loosingFenrirBlessing();
			loosingFeraBlessing();
			outputText("<b>You gained the Blessing of Divine Agency - Marae for 7 days</b>");
			var blessingPower:Number = 0;
			blessingPower += 0.1;
			if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_PROGRESS] >= 6) blessingPower += 0.1;
			if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_PROGRESS] >= 8) blessingPower += 0.05;
			if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_PROGRESS] >= 18) blessingPower += 0.05;
			if (player.statusEffectv2(StatusEffects.TempleOfTheDivineTracker) == 2 || player.statusEffectv2(StatusEffects.TempleOfTheDivineTracker) == 3) blessingPower += 0.05;
			if (player.statusEffectv3(StatusEffects.TempleOfTheDivineTracker) == 2) blessingPower += 0.05;
			player.createStatusEffect(StatusEffects.BlessingOfDivineMarae, 169, blessingPower, 0, 0);
			if (player.HP < player.maxHP()) player.HP = player.maxHP();
			var purifyingPower:Number = 0;
			purifyingPower += 10;
			if (player.statusEffectv3(StatusEffects.TempleOfTheDivineTracker) == 2) purifyingPower += 5;
			dynStats("cor", -purifyingPower);
			doNext(camp.returnToCampUseOneHour);
		}

		public function PlayerPrayAtTempleTaothAltair():void {
			clearOutput();
			outputText("You pray to the trickster patron Taoth. As you word out your prayer, suggestions of pranks flow into your mind, both playful and troublemaking, as you feel the laughter of the god cheer you up, healing your wounds and washing away corrupt thoughts. You also feel the blessing of the deity empowering your agility.\n");
			loosingMaraeBlessing();
			loosingFenrirBlessing();
			loosingFeraBlessing();
			outputText("<b>You gained the Blessing of Divine Agency - Taoth for 7 days</b>");
			player.createStatusEffect(StatusEffects.BlessingOfDivineTaoth, 169, 0, 0, 0);
			mainView.statsView.showStatUp('spe');
			player.statStore.replaceBuffObject({ 'spe.mult': 0.1 }, 'TaothBlessing', {
				text: 'Taoth Blessing',
				rate: Buff.RATE_DAYS,
				tick: 7
			});
			if (player.HP < player.maxHP()) player.HP = player.maxHP();
			dynStats("cor", -10);
			statScreenRefresh();
			doNext(camp.returnToCampUseOneHour);
		}

		public function PlayerPrayAtTempleFenrirAltair():void {
			clearOutput();
			outputText("You pray to yourself. Truthfully, it's almost funny how you rebuilt your own altar just so you could be your own follower, but still, the altar functions as a catalyst for your power; and catalyze it, it does. As you word out your prayer, you feel the cold countenance of the magic of the god of winter filling you, healing your wounds and washing away corrupt thoughts. You also feel your boons empowering your might.\n");
			loosingMaraeBlessing();
			loosingTaothBlessing();
			loosingFeraBlessing();
			outputText("<b>You gained the Blessing of Divine Agency - Fenrir for 7 days</b>");
			player.statStore.replaceBuffObject({
				'str.mult': 0.1,
				'tou.mult': 0.1
			}, 'FenrirBlessing', { text: 'Fenrir Blessing', rate: Buff.RATE_DAYS, tick: 7 });
			mainView.statsView.showStatUp('str');
			mainView.statsView.showStatUp('tou');
			if (player.HP < player.maxHP()) player.HP = player.maxHP();
			dynStats("cor", -10);
			statScreenRefresh();
			doNext(camp.returnToCampUseOneHour);
		}

		public function PlayerPrayAtTempleFeraAltair():void {
			clearOutput();
			outputText("You pray to the huntress patron Fera. As you word out your prayer, lewd fantasies of all kind flow into your mind. Fera delicious caress pleases you, healing your wounds and washing away your pure thoughts. You also feel the blessing of the deity empowering your \"talents\".\n");
			loosingMaraeBlessing();
			loosingTaothBlessing();
			loosingFenrirBlessing();
			outputText("<b>You gained the Blessing of Divine Agency - Fera for 7 days</b>");
			player.createStatusEffect(StatusEffects.BlessingOfDivineFera, 169, 0, 0, 0);
			if (player.HP < player.maxHP()) player.HP = player.maxHP();
			dynStats("cor", 10);
			doNext(camp.returnToCampUseOneHour);
		}

		public function TempleAltairsRebuildMenu():void {
			if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_PROGRESS] >= 2) {
				clearOutput();
				outputText("Would you like to repair something in the temple?\n\n");
				SceneLib.camp.cabinProgress.checkMaterials();
				menu();
				addButton(0, "Altars", rebuildGodsAltairs).hint("Repair the altar.");
				if ((flags[kFLAGS.TEMPLE_OF_THE_DIVINE_PROGRESS] == 3 || flags[kFLAGS.TEMPLE_OF_THE_DIVINE_PROGRESS] == 4) && flags[kFLAGS.TEMPLE_OF_THE_DIVINE_MARAE] == 1) {
					if (flags[kFLAGS.CAMP_CABIN_STONE_RESOURCES] >= 150) addButton(1, "Statue of Marae", rebuildStatueOfMarae).hint("Repair the statue.");
					else addButtonDisabled(1, "Statue of Marae", "You not have enough stones. Required: 150");
				}
				if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_PROGRESS] >= 5 && flags[kFLAGS.TEMPLE_OF_THE_DIVINE_PROGRESS] < 7) {
					if (flags[kFLAGS.CAMP_CABIN_STONE_RESOURCES] >= 500) addButton(2, "Gargoyles", repairGargoylesOnTheWalls).hint("Repair some of the decorative gargoyles.");
					else addButtonDisabled(2, "Gargoyles", "You not have enough stones. Required: 500");
				}
				if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_PROGRESS] >= 7 && flags[kFLAGS.TEMPLE_OF_THE_DIVINE_PROGRESS] < 17) {
					if (flags[kFLAGS.CAMP_CABIN_WOOD_RESOURCES] >= 50 && flags[kFLAGS.CAMP_CABIN_NAILS_RESOURCES] >= 10) addButton(3, "Prayer Bench", makeNewPrayerBenches).hint("Repair some of the temple banches.");
					else addButtonDisabled(3, "Prayer Bench", "You not have enough wood (50) or/and nails (10).");
				}
				addButton(13, "CheckProgress", currentStateOfTemple).hint("See how far the sculpture has progressed.");
				addButton(14, "Back", templeMainMenu);
			}
			else {
				clearOutput();
				outputText("You take your time to look the place over. After a few moments, you conclude that, while restoring it back to its former glory isn't impossible, it will be a long and arduous task. To make it back into the temple it was in its glory days, you estimate that you will need to repair the altars, all of the stone statues including the one depicting Marae, and the benches, which should then make the temple fully functional again as a place of worship.");
				flags[kFLAGS.TEMPLE_OF_THE_DIVINE_PROGRESS]++;
				doNext(camp.returnToCampUseOneHour);
			}
		}

		private function addRebuildButton(btn:int, name:String, fun:Function, notBuilt:Boolean, canBuild:Boolean, disabledMsg:String):void {
			if (!notBuilt) return;
			if (!canBuild)
				addButtonDisabled(btn, "???", disabledMsg);
			else if (flags[kFLAGS.CAMP_CABIN_STONE_RESOURCES] < 50)
				addButtonDisabled(btn, name, "You don't have enough stones (" + 50 + ").");
			else addButton(btn, name, fun);
		}

		public function rebuildGodsAltairs():void {
			menu();
			addRebuildButton(0, "Marae", rebuildMaraeAltair,
				flags[kFLAGS.TEMPLE_OF_THE_DIVINE_MARAE] < 1, flags[kFLAGS.FACTORY_SHUTDOWN] == 1,
				"Marae is corrupted. You need to clean her from the corruption... if it's still possible.");
			addRebuildButton(1, "Taoth", rebuildTaothAltair,
				flags[kFLAGS.TEMPLE_OF_THE_DIVINE_TAOTH] < 1, flags[kFLAGS.URTA_QUEST_STATUS] == 1,
				"Urta might find out something about this one in the future. But you'll need to treat her VERY well and <b>often</b> for that...");
			addRebuildButton(2, "Fenrir", rebuildFenrirAltair,
				flags[kFLAGS.TEMPLE_OF_THE_DIVINE_FENRIR] < 1, player.hasKeyItem("Gleipnir Collar") >= 0,
				"There's a certain ice wolfie in a cold region. But don't think it's <b>easy</b> to earn his blessing.");
			addRebuildButton(3, "Fera", rebuildFeraAltair,
				flags[kFLAGS.TEMPLE_OF_THE_DIVINE_FERA] < 1, flags[kFLAGS.PUMPKIN_FUCK_YEAR_DONE] != 0 && player.cor >= 80 - player.corruptionTolerance,
				"You need to fuck a pumpkin during the Halloween... no, really. Fuck a pumpkin. And you are required to be highly corrupted too.");
			addButton(14, "Back", TempleAltairsRebuildMenu);
		}

		public function rebuildMaraeAltair():void {
			clearOutput();
			outputText("You work for 8 hours, sculpting stone and repairing the altar of Marae. By the time you're done you can feel divine power amass around it anew.");
			flags[kFLAGS.CAMP_CABIN_STONE_RESOURCES] -= 50;
			flags[kFLAGS.TEMPLE_OF_THE_DIVINE_MARAE] = 1;
			if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_PROGRESS] < 3) flags[kFLAGS.TEMPLE_OF_THE_DIVINE_PROGRESS]++;
			doNext(camp.returnToCampUseEightHours);
		}

		public function rebuildTaothAltair():void {
			clearOutput();
			outputText("You work for 8 hours, sculpting stone and repairing the altar of Taoth. By the time you're done you can feel divine power amass around it anew.");
			flags[kFLAGS.CAMP_CABIN_STONE_RESOURCES] -= 50;
			flags[kFLAGS.TEMPLE_OF_THE_DIVINE_TAOTH] = 1;
			doNext(camp.returnToCampUseEightHours);
		}

		public function rebuildFenrirAltair():void {
			clearOutput();
			outputText("You work for 8 hours, sculpting stone and repairing the altar of Fenrir. By the time you're done you can feel a cold chilling aura amass around it. Was that really such a good idea?");
			flags[kFLAGS.CAMP_CABIN_STONE_RESOURCES] -= 50;
			flags[kFLAGS.TEMPLE_OF_THE_DIVINE_FENRIR] = 1;
			doNext(camp.returnToCampUseEightHours);
		}

		public function rebuildFeraAltair():void {
			clearOutput();
			outputText("You work for the entire day sculpting stone and repairing the altar of Fera. By the time you're done you can feel divine power albeit tainted amass around it anew.");
			flags[kFLAGS.CAMP_CABIN_STONE_RESOURCES] -= 50;
			flags[kFLAGS.TEMPLE_OF_THE_DIVINE_FERA] = 1;
			doNext(camp.returnToCampUseEightHours);
		}

		public function rebuildStatueOfMarae():void {
			clearOutput();
			if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_PROGRESS] < 4) outputText("You work for the entire day sculpting stone and repairing the statue of Marae. It looks slightly better, but it is far from finished.");
			else outputText("You work for the entire day sculpting stone and repairing the statue of Marae. By the time you're done you can feel divine power radiate from it empowering the entire temple.");
			flags[kFLAGS.CAMP_CABIN_STONE_RESOURCES] -= 150;
			flags[kFLAGS.TEMPLE_OF_THE_DIVINE_PROGRESS]++;
			doNext(camp.returnToCampUseEightHours);
		}

		public function repairGargoylesOnTheWalls():void {
			clearOutput();
			outputText("You work for the entire day sculpting stone. By the time you're done a set of well carved statue decorate the walls again.");
			flags[kFLAGS.CAMP_CABIN_STONE_RESOURCES] -= 500;
			flags[kFLAGS.TEMPLE_OF_THE_DIVINE_PROGRESS]++;
			doNext(camp.returnToCampUseEightHours);
		}

		public function makeNewPrayerBenches():void {
			clearOutput();
			outputText("You work for the entire day carving wood and hammering nails. By the time you're done the temple now has a set of brand-new prayer bench.");
			if (player.hasStatusEffect(StatusEffects.TempleOfTheDivineTracker)) player.addStatusValue(StatusEffects.TempleOfTheDivineTracker, 1, 2);
			else player.createStatusEffect(StatusEffects.TempleOfTheDivineTracker, 2, 0, 0, 0);
			flags[kFLAGS.CAMP_CABIN_WOOD_RESOURCES] -= 50;
			flags[kFLAGS.CAMP_CABIN_NAILS_RESOURCES] -= 10;
			flags[kFLAGS.TEMPLE_OF_THE_DIVINE_PROGRESS]++;
			doNext(camp.returnToCampUseEightHours);
		}

		public function currentStateOfTemple():void {
			clearOutput();
			outputText("The Altar of Marae ");
			if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_MARAE] < 1) outputText("is broken, a large fissure running along its center. Crude graffiti litters the once pure stone with obscenities.");
			if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_MARAE] == 1) outputText("shines, illuminated by a ray of light as if beckoning the faithful. A single white flower trails its way up one side, assuring her divine presence is there.");
			outputText("\n\nTo the left of Marae's Altar, the Altar of Taoth");
			if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_TAOTH] < 1) outputText(" lies shattered into pieces. The trickster god cannot even be visualised from the rubble that once made up his effigy.");
			if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_TAOTH] == 1) outputText(", the trickster god, has a mesmerising outlook, his effigy making a mocking smile. You swear you can hear faint laughter coming from its direction.");
			outputText("\n\nTo your right is the ");
			if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_FENRIR] < 1) outputText("damaged Altar of Fenrir. Even in this state its aura is ominous, promising eventual demise to everyone.You almost dare not approach, lest your journey ends here.");
			if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_FENRIR] == 1) outputText("Altar of Fenrir, an ominous aura radiates from it as it sits dark and foreboding.");
			outputText("\n\nOn the side is the ");
			if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_FENRIR] < 1) outputText("broken altar of Fera. You believe it was damaged way before the demons came in, likely by the priesthood tending the temple.");
			if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_FENRIR] == 1) outputText("Altar of Fera. An aura of depraved lust rise from it, inviting you to unknown pleasure. This altar radiate a clearly demonic aura and dims the sanctity of the temple like an idol.");
			outputText("\n\nMarae's statue ");
			if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_PROGRESS] < 5) outputText("lies on the ground, its head shattered to pieces");
			if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_PROGRESS] >= 5) outputText("in the background awaits the worshippers with its serene and compassionate expression");
			outputText(". Lining both walls");
			if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_PROGRESS] < 7) outputText(" are the destroyed remains of the many gargoyles who fought to defend this place. Sadly, of all the guardians, only Sapphire remains now.");
			if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_PROGRESS] >= 7) {
				outputText(", many decorative gargoyles are displayed.");
				if (flags[kFLAGS.ONYX_PATH] < 1) outputText(" While Sapphire is the last living stony guardian of the temple, this still gives off the illusion of a platoon of guardians watching faithfully over this divine place.");
				if (player.isGargoyle()) outputText(" Your own pedestal stands right next to Sapphire's, allowing you to keep close to her when you need to rest (using your pedestal allows you to sleep with Sapphire if your relation is high enough).");
				if (flags[kFLAGS.ONYX_PATH] > 0) {
					outputText(" On the opposite side stands [onyx name]'s pedestal. ");
					if (flags[kFLAGS.ONYX_GENDER] == 1 || flags[kFLAGS.ONYX_GENDER] == 2) outputText("She");
					else outputText("He");
					outputText(" is looking at you expectantly.");
				}
			}
			if (flags[kFLAGS.TEMPLE_OF_THE_DIVINE_PROGRESS] >= 8) {
				outputText(" There are " + player.statusEffectv1(StatusEffects.TempleOfTheDivineTracker) + " benches in the temple for the worshipers to sit upon.");
			}
			doNext(TempleAltairsRebuildMenu);
		}

		public function puttingBSwordOrExcaliburOnAltair():void {
			clearOutput();
			if (player.weapon == weapons.B_SWORD || player.hasItem(weapons.B_SWORD, 1)) {
				outputText("You feel a weird resonance engulf you, as the power of the Altar of Marae echos with an item on your person.\n\n");
				outputText("Pulling out the Beautiful Sword, you notice the weapon is now shining with a dim white light. Curious, you place the weapon on the altar, and watch as the sword surges with power, the light seeming to be absorbed into the blade. The altar feels way more potent with the sword resting upon it. However, it occurs to you, such a weapon likely is a powerful artifact, and that as such, it could be useful in your battles against the demons.");
				if (player.weapon == weapons.B_SWORD) player.setWeapon(WeaponLib.FISTS);
				else player.destroyItems(weapons.B_SWORD, 1);
				if (player.hasStatusEffect(StatusEffects.TempleOfTheDivineTracker)) player.addStatusValue(StatusEffects.TempleOfTheDivineTracker, 2, 2);
				else player.createStatusEffect(StatusEffects.TempleOfTheDivineTracker, 0, 2, 0, 0);
			}
			else {
				outputText("The altar radiates with increased potency as the sword is put back on display.");
				if (player.weapon == weapons.EXCALIB) player.setWeapon(WeaponLib.FISTS);
				else player.destroyItems(weapons.EXCALIB, 1);
				player.addStatusValue(StatusEffects.TempleOfTheDivineTracker, 2, 1);
			}
			doNext(templeMainMenu);
		}

		public function takingExcaliburFromAltair():void {
			clearOutput();
			outputText("You feel the power of the altar diminishing, however the weapon is stronger than ever and likely ready for its primary use, demon slaying.\n\n");
			if (player.statusEffectv2(StatusEffects.TempleOfTheDivineTracker) == 3) player.addStatusValue(StatusEffects.TempleOfTheDivineTracker, 2, -2);
			else player.addStatusValue(StatusEffects.TempleOfTheDivineTracker, 2, -1);
			inventory.takeItem(weapons.EXCALIB, templeMainMenu);
		}

		private function havingOrUsingBSwordOrExcalibur():Boolean {
			return player.weapon == weapons.B_SWORD || player.weapon == weapons.EXCALIB || player.hasItem(weapons.B_SWORD, 1) || player.hasItem(weapons.EXCALIB, 1);

		}

		public function puttingPurePearlOnAltair():void {
			clearOutput();
			outputText("You pull out the Pure Pearl Marae gave you from your bag. Such a relic should rest in holy ground, and you indeed notice a slot in the altar for an orb like object such as the pearl. Will you place the Pure Pearl on the altar?");
			menu();
			addButton(0, "No", puttingPurePearlOnAltairNo);
			addButton(1, "Yes", puttingPurePearlOnAltairYes);
		}

		public function puttingPurePearlOnAltairYes():void {
			outputText("\n\nAs you place the pearl on the altar, you feel the holy power radiating from the temple increase a step further. The place practically radiates purity now. A horde of imps, attracted by the aura emanating from the temple, attempts to enter the building with the intention to put out the offending light. You prepare yourself for a fight, but end up watching in stunned silence as the corrupt beings catch fire and are reduced to ashes as soon as they fly inside the temple’s boundaries. It would seem the temple divine protections have increased.");
			player.destroyItems(consumables.P_PEARL, 1);
			if (player.hasStatusEffect(StatusEffects.TempleOfTheDivineTracker)) player.addStatusValue(StatusEffects.TempleOfTheDivineTracker, 3, 2);
			else player.createStatusEffect(StatusEffects.TempleOfTheDivineTracker, 0, 0, 2, 0);
			doNext(templeMainMenu);
		}

		public function puttingPurePearlOnAltairNo():void {
			outputText("\n\nWhile it seems a good idea at first, you think you would prefer to keep the pearl for now.");
			doNext(templeMainMenu);
		}

		public function takingPurePearlFromAltair():void {
			clearOutput();
			outputText("You recover the pearl from the Altar. The temple's power dimms slightly.");
			player.addStatusValue(StatusEffects.TempleOfTheDivineTracker, 3, -2);
			inventory.takeItem(consumables.P_PEARL, templeMainMenu);
		}

		public function templeBasement():void {
			clearOutput();
			if (flags[kFLAGS.FOUND_TEMPLE_OF_THE_DIVINE] == 2) {
				outputText("You wander back into the Temple basement atelier.");

				menu();
				addButton(0, "Statue", playerBuilder.currentStateOfStatue).hint("Check on the statue.");
				addButton(1, "Strange Book", playerBuilder.strangeBookOfGolems).hint("Examine the strange book.");
				if (player.hasKeyItem("Black Soul Gem") >= 0 && flags[kFLAGS.ONYX_PATH] < 1) addButton(2, "Spare Statue", onyx.makingNewGargoyle).hint("Check on the spare statue.");
				addButton(4, "Back", templeMainMenu);
			}
			if (flags[kFLAGS.FOUND_TEMPLE_OF_THE_DIVINE] == 1) {
				outputText("As you wander down into the basement of the temple, you find what looks like an old abandoned Atelier. Down there is a plinth, surrounded by various depictions of what looks like gargoyles. One could follow their examples and create a gargoyle of their own.\n\n");
				flags[kFLAGS.FOUND_TEMPLE_OF_THE_DIVINE]++;
				outputText("There is a plinth, surrounded by what looks to be depictions of various gargoyles, of all materials and forms. You're pretty sure that using these as a refernce, you could craft a gargoyle statue of your own, albeit of raw stone.");
				menu();
				addButton(0, "Begin", playerBuilder.chooseToWorkOnStoneStatue);
				addButton(4, "Back", templeMainMenu);
			}
		}
	}
}