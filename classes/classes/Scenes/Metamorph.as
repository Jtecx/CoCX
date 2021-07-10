/**
 * ...
 * @author Ormael
 */
package classes.Scenes
{
import classes.*;
import classes.internals.SaveableState;
import classes.BodyParts.Hair;
import classes.BodyParts.Antennae;
import classes.BodyParts.Arms;
import classes.BodyParts.Ears;
import classes.BodyParts.Eyes;
import classes.BodyParts.Face;
import classes.BodyParts.Gills;
import classes.BodyParts.Horns;
import classes.BodyParts.LowerBody;
import classes.BodyParts.RearBody;
import classes.BodyParts.Skin;
import classes.BodyParts.Tail;
import classes.BodyParts.Tongue;
import classes.BodyParts.Wings;
import classes.Items.MutationsHelper;

import classes.GeneticMemories.*;

use namespace CoC;

	public class Metamorph extends BaseContent implements SaveableState {

		public static var GeneticMemoryStorage: Object;

		public function stateObjectName():String {
			return "GeneticMemoryStorage";
		}

		public function resetState():void {
			GeneticMemoryStorage = {};
		}

		public function saveToObject():Object {
			return {
				"storage": GeneticMemoryStorage
			};
		}

		public function loadFromObject(o:Object, ignoreErrors:Boolean):void {
			if (o) {
				GeneticMemoryStorage = o["storage"];
			} else {
				// loading from old save
				resetState();
			}

				// resetState();

				// GeneticMemoryStorage["Human Hair"] = true;
				// GeneticMemoryStorage["Storm Hair"] = true;
				// GeneticMemoryStorage["Human Face"] = true;
				// GeneticMemoryStorage["Human Tongue"] = true;
				// GeneticMemoryStorage["Vampire Face"] = true;
				// GeneticMemoryStorage["Vampire Eyes"] = true;
				// GeneticMemoryStorage["Fox Eyes"] = true;
				// GeneticMemoryStorage["Elf Tongue"] = true;

				// TODO: Move migration inside else after finished
				// migration
				if (player.hasStatusEffect(StatusEffects.UnlockedHumanHair)) GeneticMemoryStorage["Human Hair"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedHarpyHair)) GeneticMemoryStorage["Feather Hair"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedGorgonHair)) GeneticMemoryStorage["Gorgon Hair"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedElfHair)) GeneticMemoryStorage["Silky Hair"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedRaijuHair)) GeneticMemoryStorage["Storm Hair"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedHellcatBurningHair)) GeneticMemoryStorage["Burning Hair"] = true;

				if (player.hasStatusEffect(StatusEffects.UnlockedHumanFace)) GeneticMemoryStorage["Human Face"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedHorseFace)) GeneticMemoryStorage["Horse Face"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedCowMinotaurFace)) GeneticMemoryStorage["Cow Minotaur Face"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedSharkTeeth)) GeneticMemoryStorage["Shark Teeth Face"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedSnakeFangs)) GeneticMemoryStorage["Snake Fangs Face"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedCatFace)) GeneticMemoryStorage["Cat Face"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedCatFangs)) GeneticMemoryStorage["Cat Canines Face"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedLizardFace)) GeneticMemoryStorage["Lizard Face"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedSpiderFangs)) GeneticMemoryStorage["Spider Fangs Face"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedFoxFace)) GeneticMemoryStorage["Fox Face"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedPigFace)) GeneticMemoryStorage["Pig Face"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedBoarFace)) GeneticMemoryStorage["Boar Face"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedManticoreFace)) GeneticMemoryStorage["Manticore Face"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedSalamanderFace)) GeneticMemoryStorage["Salamander Fangs Face"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedOrcaFace)) GeneticMemoryStorage["Orca Face"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedDraconicFace)) GeneticMemoryStorage["Draconic Face"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedDraconicFangs)) GeneticMemoryStorage["Draconic Fangs Face"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedDevilFangs)) GeneticMemoryStorage["Devil Fangs Face"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedOniFace)) GeneticMemoryStorage["Oni Teeth Face"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedRaijuFace)) GeneticMemoryStorage["Weasel Face"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedVampireFace)) GeneticMemoryStorage["Vampire Face"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedRedPandaFace)) GeneticMemoryStorage["Red Panda Face"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedCheshireFace)) GeneticMemoryStorage["Cheshire Face"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedCheshireSmile)) GeneticMemoryStorage["Cheshire Smile Face"] = true;

				if (player.hasStatusEffect(StatusEffects.UnlockedHumanEyes)) GeneticMemoryStorage["Human Eyes"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedSpiderFourEyes)) GeneticMemoryStorage["Spider Eyes"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedCatEyes)) GeneticMemoryStorage["Cat Eyes"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedGorgonEyes)) GeneticMemoryStorage["Gorgon Eyes"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedManticoreEyes)) GeneticMemoryStorage["Manticore Eyes"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedFoxEyes)) GeneticMemoryStorage["Fox Eyes"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedLizardEyes)) GeneticMemoryStorage["Lizard Eyes"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedSnakeEyes)) GeneticMemoryStorage["Snake Eyes"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedDraconicEyes)) GeneticMemoryStorage["Draconic Eyes"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedDevilEyes)) GeneticMemoryStorage["Devil Eyes"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedOniEyes)) GeneticMemoryStorage["Oni Eyes"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedElfEyes)) GeneticMemoryStorage["Elf Eyes"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedRaijuEyes)) GeneticMemoryStorage["Raiju Eyes"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedVampireEyes)) GeneticMemoryStorage["Vampire Eyes"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedHellcatInfernalEyes)) GeneticMemoryStorage["Infernal Eyes"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedOrcEyes)) GeneticMemoryStorage["Orc Eyes"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedDisplacerEyes)) GeneticMemoryStorage["Displacer Eyes"] = true;

				if (player.hasStatusEffect(StatusEffects.UnlockedHumanTongue)) GeneticMemoryStorage["Human Tongue"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedSnakeTongue)) GeneticMemoryStorage["Snake Tongue"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedDemonTonuge)) GeneticMemoryStorage["Demonic Tongue"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedDraconicTongue)) GeneticMemoryStorage["Draconic Tongue"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedCatTongue)) GeneticMemoryStorage["Cat Tongue"] = true;
				if (player.hasStatusEffect(StatusEffects.UnlockedElfTongue)) GeneticMemoryStorage["Elf Tongue"] = true;

		}

		public function Metamorph() {
			Saves.registerSaveableState(this);
		}

public function accessMetamorphMenu(currentPage: int = 0):void {
	clearOutput();
	outputText("<font size=\"36\" face=\"Georgia\"><u>Soulforce Metamorph</u></font>\n");
	outputText("You calm your thoughts and take a moment to center yourself, recalling your past experiences. The transformations you have experienced so far have left their mark, not so easily forgotten even when undone and replaced innumerable times. When you focus, you can feel the threads in place, echoes of the many bodies you called your own, of limbs you once owned and skins you wore as comfortably as your current one.\n\nWith a little effort, you could imprint some of those recollections upon yourself. Powerful wings which carried you above the clouds, attentive ears which alerted you of danger; any such memories will return to you just as easily as they left should you wish, still rightfully yours no matter how many times discarded.\n\nIs there anything you would like to change about your current form?");

	outputText("\n\n<b>Bonus to Max Soulforce:</b> " + 50 * (1 + player.perkv1(PerkLib.Metamorph)));

	menu();

	const menusList: Array = [
		{
			name: "Hair",
			func: accessHairMenu
		},
		{
			name: "Face",
			func: accessFaceMenu
		},
		{
			name: "Eyes",
			func: accessEyesMenu
		},
		{
			name: "Tongue",
			func: accessTongueMenu
		},
		{
			name: "Ears",
			func: accessEarsMenu
		},
		{
			name: "Arms",
			func: accessArmsMenu
		},
		{
			name: "Lower Body",
			func: accessLowerBodyMenu
		},
		{
			name: "Rear Body",
			func: accessRearBodyMenu
		},
		{
			name: "Skin",
			func: accessSkinMenu
		},
		{
			name: "Patterns",
			func: accessSkinPatternsMenu
		},
		{
			name: "Antennae",
			func: accessAntennaeMenu
		},
		{
			name: "Horns",
			func: accessHornsMenu
		},
		{
			name: "Gills",
			func: accessGillsMenu
		},
		{
			name: "Wings",
			func: accessWingsMenu
		},
		{
			name: "Tail",
			func: accessTailMenu
		},
		{
			name: "Page 1",
			func: accessPage1MetamorphMenu,
			hint: "Face, Tongue, Eyes, Ears, Horns"
		},
		{
			name: "Page 2",
			func: accessPage2MetamorphMenu,
			hint: "Arms, Wings"
		},
		{
			name: "Page 3",
			func: accessPage3MetamorphMenu,
			hint: "Skin, Skin Patterns/Tattoos, Rear Body, Antennae, Gills, Tail"
		}
	];

	const menusPerPage: int = menusList.length > 14 ? 12 : 14;

	const lastPage: int = Math.ceil(menusList.length/menusPerPage) - 1;

	const pageMenus: Array = menusList.slice(currentPage * menusPerPage, (currentPage * menusPerPage) + menusPerPage);

	var currentButton: int = 0;

	for each (var menuObj: * in pageMenus) {
		if (menuObj.hint) {
			addButton(currentButton, menuObj.name, menuObj.func).hint(menuObj.hint);
		} else {
			addButton(currentButton, menuObj.name, menuObj.func);
		}
		currentButton++;
	}

	if (lastPage > 0) {
		if (currentPage > 0) addButton(12, "Prev Page", accessMetamorphMenu, currentPage - 1);
		else addButtonDisabled (12, "Prev Page");
		if (currentPage < lastPage) addButton(13, "Next Page", accessMetamorphMenu, currentPage + 1);
		else addButtonDisabled (13, "Next Page");
	}

	if (player.hasPerk(PerkLib.JobSoulCultivator)) addButton(14, "Back", SceneLib.soulforce.accessSoulforceMenu);
	else addButton(14, "Back", playerMenu);
}

private function accessHornsMenu(currentPage: int = 0): void {
	const title: String = "<font size=\"36\" face=\"Georgia\"><u>Soulforce Metamorph - Horns</u></font>\n";

	clearOutput();
	outputText(title);
	outputText("What kind of horns do you want?");

	openPaginatedMenuOld(title, accessHornsMenu, currentPage, Horns.Types, Horns.Types[player.horns.type], Horns.getTFDescription);
}

private function accessHairMenu(currentPage: int = 0): void {
	const title: String = "<font size=\"36\" face=\"Georgia\"><u>Soulforce Metamorph - Hair</u></font>\n";

	clearOutput();
	outputText(title);
	// TODO: Replace when all appearances are updated
	// outputText(Hair.getAppearanceDescription(player));
	// outputText("\n\nYou wonder about changing it. In that case, what kind of hair would you like instead?");
	outputText("What kind of hair do you want?");

	openPaginatedMenu(title, accessLowerBodyMenu, currentPage, HairMem.Memories);
}

private function accessFaceMenu(currentPage: int = 0): void {
	const title: String = "<font size=\"36\" face=\"Georgia\"><u>Soulforce Metamorph - Face</u></font>\n";

	clearOutput();
	outputText(title);
	outputText("What kind of face do you want?");

	openPaginatedMenu(title, accessFaceMenu, currentPage, FaceMem.Memories);
}

private function accessEyesMenu(currentPage: int = 0): void {
	const title: String = "<font size=\"36\" face=\"Georgia\"><u>Soulforce Metamorph - Eyes</u></font>\n";

	clearOutput();
	outputText(title);
	outputText("What kind of eyes do you want?");

	openPaginatedMenu(title, accessEyesMenu, currentPage, EyesMem.Memories);
}

private function accessTongueMenu(currentPage: int = 0): void {
	const title: String = "<font size=\"36\" face=\"Georgia\"><u>Soulforce Metamorph - Tongue</u></font>\n";

	clearOutput();
	outputText(title);
	outputText("What kind of tongue do you want?");

	openPaginatedMenu(title, accessTongueMenu, currentPage, TongueMem.Memories);
}

private function accessEarsMenu(currentPage: int = 0): void {
	const title: String = "<font size=\"36\" face=\"Georgia\"><u>Soulforce Metamorph - Ears</u></font>\n";

	clearOutput();
	outputText(title);
	outputText("What kind of ears do you want?");

	openPaginatedMenuOld(title, accessEarsMenu, currentPage, Ears.Types, Ears.Types[player.ears.type], Ears.getTFDescription);
}

private function accessArmsMenu(currentPage: int = 0): void {
	const title: String = "<font size=\"36\" face=\"Georgia\"><u>Soulforce Metamorph - Arms</u></font>\n";

	clearOutput();
	outputText(title);
	outputText("What kind of arms do you want?");

	openPaginatedMenuOld(title, accessArmsMenu, currentPage, Arms.Types, Arms.Types[player.arms.type], Arms.getTFDescription);
}

private function accessWingsMenu(currentPage: int = 0): void {
	const title: String = "<font size=\"36\" face=\"Georgia\"><u>Soulforce Metamorph - Wings</u></font>\n";

	clearOutput();
	outputText(title);
	outputText("What kind of wings do you want?");

	openPaginatedMenuOld(title, accessWingsMenu, currentPage, Wings.Types, Wings.Types[player.wings.type], Wings.getTFDescription);
}

private function accessLowerBodyMenu(currentPage: int = 0): void {
	const title: String = "<font size=\"36\" face=\"Georgia\"><u>Soulforce Metamorph - Lower Body</u></font>\n";

	clearOutput();
	outputText(title);
	outputText("What kind of lower body do you want?");

	openPaginatedMenuOld(title, accessLowerBodyMenu, currentPage, LowerBody.Types, LowerBody.Types[player.lowerBody], LowerBody.getTFDescription);
}

private function accessSkinMenu(currentPage: int = 0): void {
	const title: String = "<font size=\"36\" face=\"Georgia\"><u>Soulforce Metamorph - Skin</u></font>\n";

	clearOutput();
	outputText(title);
	outputText("What kind of skin do you want?");

	openPaginatedMenuOld(title, accessSkinMenu, currentPage, Skin.SkinTypes, Skin.SkinTypes[player.skinType], Skin.getTFDescription);
}

private function accessRearBodyMenu(currentPage: int = 0): void {
	const title: String = "<font size=\"36\" face=\"Georgia\"><u>Soulforce Metamorph - Rear Body</u></font>\n";

	clearOutput();
	outputText(title);
	outputText("What kind of rear body do you want?");

	openPaginatedMenuOld(title, accessRearBodyMenu, currentPage, RearBody.Types, RearBody.Types[player.rearBody.type], RearBody.getTFDescription);
}

private function accessAntennaeMenu(currentPage: int = 0): void {
	const title: String = "<font size=\"36\" face=\"Georgia\"><u>Soulforce Metamorph - Antennae</u></font>\n";

	clearOutput();
	outputText(title);
	outputText("What kind of antennae do you want?");

	openPaginatedMenuOld(title, accessAntennaeMenu, currentPage, Antennae.Types, Antennae.Types[player.antennae.type], Antennae.getTFDescription);
}

private function accessSkinPatternsMenu(currentPage: int = 0): void {
	const title: String = "<font size=\"36\" face=\"Georgia\"><u>Soulforce Metamorph - Skin Patterns</u></font>\n";

	clearOutput();
	outputText(title);
	outputText("What kind of skin patterns do you want?");

	openPaginatedMenuOld(title, accessSkinPatternsMenu, currentPage, Skin.PatternTypes, Skin.PatternTypes[player.skin.base.pattern], Skin.getTFDescription);
}

private function accessGillsMenu(currentPage: int = 0): void {
	const title: String = "<font size=\"36\" face=\"Georgia\"><u>Soulforce Metamorph - Gills</u></font>\n";

	clearOutput();
	outputText(title);
	outputText("What kind of gills do you want?");

	openPaginatedMenuOld(title, accessGillsMenu, currentPage, Gills.Types, Gills.Types[player.gills.type], Gills.getTFDescription);
}

private function accessTailMenu(currentPage: int = 0): void {
	const title: String = "<font size=\"36\" face=\"Georgia\"><u>Soulforce Metamorph - Tail</u></font>\n";

	clearOutput();
	outputText(title);
	outputText("What kind of tail do you want?");

	openPaginatedMenuOld(title, accessTailMenu, currentPage, Tail.Types, Tail.Types[player.tailType], Tail.getTFDescription);
}

private function openPaginatedMenuOld (title: String, thisMenu: *, currentPage: int, partsArray:Array, currentPart: *, getTFDescription: *): void {
	menu();

	var partsList: Array = [];

	// Removing empty slots
	for each (var part: * in partsArray) {
		if (part && part.metamorphFlag) {
			partsList.push(part);
		}
	}

	const partsPerPage: int = partsList.length > 14 ? 12 : 14;

	const lastPage: int = Math.ceil(partsList.length/partsPerPage) - 1;

	const pageParts: Array = partsList.slice(currentPage * partsPerPage, (currentPage * partsPerPage) + partsPerPage);

	var currentButton: int = 0;

	for each (var bodyPart: * in pageParts) {
		if (bodyPart.metamorphFlag) {
			const buttonStr: String = bodyPart.metamorphTitle || "";

			const unlocked: Boolean = player.hasStatusEffect(bodyPart.metamorphFlag);
			const isPossible: Boolean = currentPart === bodyPart;
			const enoughSF: Boolean = player.soulforce >= bodyPart.metamorphCost;

			if (unlocked && !isPossible && enoughSF) addButton(currentButton, buttonStr, doMetamorph, title, bodyPart, getTFDescription);
			else if (unlocked && isPossible) addButtonDisabled(currentButton, buttonStr, "You already have this body part.");
			else if (unlocked && !isPossible && enoughSF) addButtonDisabled(currentButton, buttonStr, "You don't have enough Soulforce for this metamorphosis!");
			else if (!unlocked) addButtonDisabled(currentButton, "???", "You haven't unlocked this metamorphosis yet!");
			currentButton++;
		}
	}

	if (lastPage > 0) {
		if (currentPage > 0) addButton(12, "Prev Page", thisMenu, currentPage - 1);
		else addButtonDisabled (12, "Prev Page");
		if (currentPage < lastPage) addButton(13, "Next Page", thisMenu, currentPage + 1);
		else addButtonDisabled (13, "Next Page");
	}

	addButton(14, "Back", accessMetamorphMenu);
}

private function openPaginatedMenu (title: String, thisMenu: *, currentPage: int, memArray:Array): void {
	menu();

	const memsPerPage: int = memArray.length > 14 ? 12 : 14;

	const lastPage: int = Math.ceil(memArray.length/memsPerPage) - 1;

	const pageMems: Array = memArray.slice(currentPage * memsPerPage, (currentPage * memsPerPage) + memsPerPage);

	var currentButton: int = 0;

	for each (var genMem: * in pageMems) {
		const buttonStr: String = genMem.metamorphTitle || "";
		const unlocked: Boolean = GeneticMemoryStorage[genMem.name];
		const partsInUse: Boolean = genMem.transformation().isPresent();
		const enoughSF: Boolean = player.soulforce >= genMem.metamorphCost;

		if (unlocked && !partsInUse && enoughSF) addButton(currentButton, buttonStr, doMetamorph, title, genMem).hint("Cost: " + genMem.metamorphCost + " SF");
		else if (unlocked && partsInUse) addButtonDisabled(currentButton, buttonStr, "You already have this, the metamorphosis would have no effect!");
		else if (unlocked && !partsInUse && !enoughSF) addButtonDisabled(currentButton, buttonStr, "Cost: " + genMem.metamorphCost + " SF (You don't have enough Soulforce for this metamorphosis!)");
		else if (!unlocked) addButtonDisabled(currentButton, "???", "You haven't unlocked this metamorphosis yet!");
		currentButton++;
	}

	if (lastPage > 0) {
		if (currentPage > 0) addButton(12, "Prev Page", thisMenu, currentPage - 1);
		else addButtonDisabled (12, "Prev Page");
		if (currentPage < lastPage) addButton(13, "Next Page", thisMenu, currentPage + 1);
		else addButtonDisabled (13, "Next Page");
	}

	addButton(14, "Back", accessMetamorphMenu);
}

private function doMetamorph (title: String, genMem: *): void {
	clearOutput();
	outputText(title);
	genMem.transformation().applyEffect();
	player.soulforce -= genMem.metamorphCost;
	CoC.instance.mainViewManager.updateCharviewIfNeeded();
	doNext(accessMetamorphMenu);
}

public static function unlockMetamorph (genMemName: String, doOutput: Boolean = true): void {
	if (!GeneticMemoryStorage[genMemName] && player.hasPerk(PerkLib.GeneticMemory)) {
		GeneticMemoryStorage[genMemName] = true;
		if (doOutput && player.hasPerk(PerkLib.Metamorph)) outputText("\n\n<b>Genetic Memory Obtained: " + genMemName + "</b>");
	}
}

private function accessPage1MetamorphMenu():void {
	menu();

	addButton(8, "Ears(1)", accessPage1EarsMenu);
	addButton(9, "Ears(2)", accessPage2EarsMenu);
	addButton(10, "Ears(3)", accessPage3EarsMenu);
	addButton(11, "Horns(1)", accessPage1HornsMenu);
	addButton(12, "Horns(2)", accessPage2HornsMenu);
	addButton(14, "Back", accessMetamorphMenu);
}
private function accessPage1EarsMenu():void {
	menu();
	if (player.hasStatusEffect(StatusEffects.UnlockedHumanEars) && player.ears.type != Ears.HUMAN && player.soulforce >= 500) addButton(0, "Human", metamorphHumanEars);
	else if (player.hasStatusEffect(StatusEffects.UnlockedHumanEars) && player.ears.type == Ears.HUMAN) addButtonDisabled(0, "Human", "You already have human ears.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedHumanEars) && player.ears.type != Ears.HUMAN && player.soulforce < 500) addButtonDisabled(0, "Human", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(0, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedHorseEars) && player.ears.type != Ears.HUMAN && player.soulforce >= 100) addButton(1, "Horse", metamorphHorseEars);
	else if (player.hasStatusEffect(StatusEffects.UnlockedHorseEars) && player.ears.type == Ears.HUMAN) addButtonDisabled(1, "Horse", "You already have horse ears.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedHorseEars) && player.ears.type != Ears.HUMAN && player.soulforce < 100) addButtonDisabled(1, "Horse", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(1, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedCowEars) && player.ears.type != Ears.COW && player.soulforce >= 100) addButton(3, "Cow", metamorphCowEars);
	else if (player.hasStatusEffect(StatusEffects.UnlockedCowEars) && player.ears.type == Ears.COW) addButtonDisabled(3, "Cow", "You already have cow ears.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedCowEars) && player.ears.type != Ears.COW && player.soulforce < 100) addButtonDisabled(3, "Cow", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(3, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedElfinEars) && player.ears.type != Ears.ELFIN && player.soulforce >= 100) addButton(4, "Elfin", metamorphElfinEars);
	else if (player.hasStatusEffect(StatusEffects.UnlockedElfinEars) && player.ears.type == Ears.ELFIN) addButtonDisabled(4, "Elfin", "You already have elfin ears.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedElfinEars) && player.ears.type != Ears.ELFIN && player.soulforce < 100) addButtonDisabled(4, "Elfin", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(4, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedCatEars) && player.ears.type != Ears.CAT && player.soulforce >= 100) addButton(5, "Cat", metamorphCatEars);
	else if (player.hasStatusEffect(StatusEffects.UnlockedCatEars) && player.ears.type == Ears.CAT) addButtonDisabled(5, "Cat", "You already have cat ears.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedCatEars) && player.ears.type != Ears.CAT && player.soulforce < 100) addButtonDisabled(5, "Cat", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(5, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedLizardEars) && player.ears.type != Ears.LIZARD && player.soulforce >= 100) addButton(6, "Lizard", metamorphLizardEars);
	else if (player.hasStatusEffect(StatusEffects.UnlockedLizardEars) && player.ears.type == Ears.LIZARD) addButtonDisabled(6, "Lizard", "You already have lizard ears.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedLizardEars) && player.ears.type != Ears.LIZARD && player.soulforce < 100) addButtonDisabled(6, "Lizard", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(6, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedFoxEars) && player.ears.type != Ears.FOX && player.soulforce >= 100) addButton(9, "Fox", metamorphEarsFox);
	else if (player.hasStatusEffect(StatusEffects.UnlockedFoxEars) && player.ears.type == Ears.FOX) addButtonDisabled(9, "Fox", "You already have fox ears.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedFoxEars) && player.ears.type != Ears.FOX && player.soulforce < 100) addButtonDisabled(9, "Fox", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(9, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedDraconicEars) && player.ears.type != Ears.DRAGON && player.soulforce >= 100) addButton(10, "Dragon", metamorphDragonEars);
	else if (player.hasStatusEffect(StatusEffects.UnlockedDraconicEars) && player.ears.type == Ears.DRAGON) addButtonDisabled(10, "Dragon", "You already have dragon ears.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedDraconicEars) && player.ears.type != Ears.DRAGON && player.soulforce < 100) addButtonDisabled(10, "Dragon", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(10, "???", "You have not yet unlocked this metamorphosis!");
	addButton(14, "Back", accessPage1MetamorphMenu);
}
private function accessPage2EarsMenu():void {
	menu();
	if (player.hasStatusEffect(StatusEffects.UnlockedPigEars) && player.ears.type != Ears.PIG && player.soulforce >= 100) addButton(0, "Pig", metamorphPigEars);
	else if (player.hasStatusEffect(StatusEffects.UnlockedPigEars) && player.ears.type == Ears.PIG) addButtonDisabled(0, "Pig", "You already have pig ears.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedPigEars) && player.ears.type != Ears.PIG && player.soulforce < 100) addButtonDisabled(0, "Pig", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(0, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedLionEars) && player.ears.type != Ears.LION && player.soulforce >= 100) addButton(5, "Lion", metamorphLionEars);
	else if (player.hasStatusEffect(StatusEffects.UnlockedLionEars) && player.ears.type == Ears.LION) addButtonDisabled(5, "Lion", "You already have lion ears.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedLionEars) && player.ears.type != Ears.LION && player.soulforce < 100) addButtonDisabled(5, "Lion", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(5, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedOrcaEars) && player.ears.type != Ears.ORCA && player.soulforce >= 100) addButton(7, "Orca", metamorphOrcaEars);
	else if (player.hasStatusEffect(StatusEffects.UnlockedOrcaEars) && player.ears.type == Ears.ORCA) addButtonDisabled(7, "Orca", "You already have orca ears.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedOrcaEars) && player.ears.type != Ears.ORCA && player.soulforce < 100) addButtonDisabled(7, "Orca", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(7, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedSnakeEars) && player.ears.type != Ears.SNAKE && player.soulforce >= 100) addButton(8, "Snake", metamorphSnakeEars);
	else if (player.hasStatusEffect(StatusEffects.UnlockedSnakeEars) && player.ears.type == Ears.SNAKE) addButtonDisabled(8, "Snake", "You already have snake ears.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedSnakeEars) && player.ears.type != Ears.SNAKE && player.soulforce < 100) addButtonDisabled(8, "Snake", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(8, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedGoatEars) && player.ears.type != Ears.GOAT && player.soulforce >= 100) addButton(9, "Goat", metamorphGoatEars);
	else if (player.hasStatusEffect(StatusEffects.UnlockedGoatEars) && player.ears.type == Ears.GOAT) addButtonDisabled(9, "Goat", "You already have goat ears.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedGoatEars) && player.ears.type != Ears.GOAT && player.soulforce < 100) addButtonDisabled(9, "Goat", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(9, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedOniEars) && player.ears.type != Ears.ONI && player.soulforce >= 100) addButton(10, "Oni", metamorphOniEars);
	else if (player.hasStatusEffect(StatusEffects.UnlockedOniEars) && player.ears.type == Ears.ONI) addButtonDisabled(10, "Oni", "You already have oni ears.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedOniEars) && player.ears.type != Ears.ONI && player.soulforce < 100) addButtonDisabled(10, "Oni", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(10, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedElfEars) && player.ears.type != Ears.ELVEN && player.soulforce >= 100) addButton(11, "Elf", metamorphElfEars);
	else if (player.hasStatusEffect(StatusEffects.UnlockedElfEars) && player.ears.type == Ears.ELVEN) addButtonDisabled(11, "Elf", "You already have elf ears.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedElfEars) && player.ears.type != Ears.ELVEN && player.soulforce < 100) addButtonDisabled(11, "Elf", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(11, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedRaijuEars) && player.ears.type != Ears.WEASEL && player.soulforce >= 100) addButton(12, "Raiju", metamorphRaijuEars);
	else if (player.hasStatusEffect(StatusEffects.UnlockedRaijuEars) && player.ears.type == Ears.WEASEL) addButtonDisabled(12, "Raiju", "You already have raiju ears.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedRaijuEars) && player.ears.type != Ears.WEASEL && player.soulforce < 100) addButtonDisabled(12, "Raiju", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(12, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedBatEars) && player.ears.type != Ears.BAT && player.soulforce >= 100) addButton(13, "Bat", metamorphBatEars);
	else if (player.hasStatusEffect(StatusEffects.UnlockedBatEars) && player.ears.type == Ears.BAT) addButtonDisabled(13, "Bat", "You already have bat ears.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedBatEars) && player.ears.type != Ears.BAT && player.soulforce < 100) addButtonDisabled(13, "Bat", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(13, "???", "You have not yet unlocked this metamorphosis!");
	addButton(14, "Back", accessPage1MetamorphMenu);
}
private function accessPage3EarsMenu():void {
	menu();
	if (player.hasStatusEffect(StatusEffects.UnlockedVampireEars) && player.ears.type != Ears.VAMPIRE && player.soulforce >= 100) addButton(0, "Vampire", metamorphVampireEars);
	else if (player.hasStatusEffect(StatusEffects.UnlockedVampireEars) && player.ears.type == Ears.VAMPIRE) addButtonDisabled(0, "Vampire", "You already have vampire ears.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedVampireEars) && player.ears.type != Ears.VAMPIRE && player.soulforce < 100) addButtonDisabled(0, "Vampire", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(0, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedRedPandaEars) && player.ears.type != Ears.RED_PANDA && player.soulforce >= 100) addButton(1, "Red Panda", metamorphRedPandaEars);
	else if (player.hasStatusEffect(StatusEffects.UnlockedRedPandaEars) && player.ears.type == Ears.RED_PANDA) addButtonDisabled(1, "Red Panda", "You already have red panda ears.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedRedPandaEars) && player.ears.type != Ears.RED_PANDA && player.soulforce < 100) addButtonDisabled(1, "Red Panda", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(1, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedDisplacerEars) && player.ears.type != Ears.DISPLACER && player.soulforce >= 100) addButton(8, "Displacer", metamorphDisplacerEars);
	else if (player.hasStatusEffect(StatusEffects.UnlockedDisplacerEars) && player.ears.type == Ears.DISPLACER) addButtonDisabled(8, "Displacer", "You already have displacer ears.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedDisplacerEars) && player.ears.type != Ears.DISPLACER && player.soulforce < 100) addButtonDisabled(8, "Displacer", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(8, "???", "You have not yet unlocked this metamorphosis!");
	addButton(14, "Back", accessPage1MetamorphMenu);
}
private function accessPage1HornsMenu():void {
	menu();
	if (player.hasStatusEffect(StatusEffects.UnlockedHumanNoHorns) && player.horns.type != Horns.NONE && player.soulforce >= 500) addButton(0, "Human", metamorphHumanNoHorns);
	else if (player.hasStatusEffect(StatusEffects.UnlockedHumanNoHorns) && player.horns.type == Horns.NONE) addButtonDisabled(0, "Human", "You already not have horns.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedHumanNoHorns) && player.horns.type != Horns.NONE && player.soulforce < 500) addButtonDisabled(0, "Human", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(0, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedDemonHorns) && player.horns.type != Horns.DEMON && player.soulforce >= 100) addButton(1, "Demon", metamorphHornsDemonic);
	else if (player.hasStatusEffect(StatusEffects.UnlockedDemonHorns) && player.horns.type == Horns.DEMON) addButtonDisabled(1, "Demon", "You already have demon horns.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedDemonHorns) && player.horns.type != Horns.DEMON && player.soulforce < 100) addButtonDisabled(1, "Demon", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(1, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedCowMinotaurHorns) && player.horns.type != Horns.COW_MINOTAUR && player.soulforce >= 100) addButton(2, "Cow/Mino", metamorphCowMinotaurHorns);
	else if (player.hasStatusEffect(StatusEffects.UnlockedCowMinotaurHorns) && player.horns.type == Horns.COW_MINOTAUR) addButtonDisabled(2, "Cow/Mino", "You already have cow/minotaur horns.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedCowMinotaurHorns) && player.horns.type != Horns.COW_MINOTAUR && player.soulforce < 100) addButtonDisabled(2, "Cow/Mino", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(2, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedDraconicX2) && player.horns.type != Horns.DRACONIC_X2 && player.soulforce >= 100) addButton(3, "DraconicX2", metamorphHornsDraconicX2);
	else if (player.hasStatusEffect(StatusEffects.UnlockedDraconicX2) && player.horns.type == Horns.DRACONIC_X2) addButtonDisabled(3, "DraconicX2", "You already have draconic horns.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedDraconicX2) && player.horns.type != Horns.DRACONIC_X2 && player.soulforce < 100) addButtonDisabled(3, "DraconicX2", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(3, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedDraconicX4) && player.horns.type == Horns.DRACONIC_X2 && player.soulforce >= 200) addButton(4, "DraconicX4", metamorphHornsDraconicX4);
	else if (player.hasStatusEffect(StatusEffects.UnlockedDraconicX4) && player.horns.type == Horns.DRACONIC_X4_12_INCH_LONG) addButtonDisabled(4, "DraconicX4", "You already have two pairs of drconic horns.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedDraconicX4) && player.horns.type == Horns.DRACONIC_X2 && player.soulforce < 200) addButtonDisabled(4, "DraconicX4", "You do not have enough Soulforce for this metamorphosis.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedDraconicX4) && player.horns.type != Horns.DRACONIC_X2) addButtonDisabled(4, "DraconicX4", "You do not have proper type of horns for this metamorphosis.");
	else addButtonDisabled(4, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedGoatHorns) && player.horns.type != Horns.GOAT && player.soulforce >= 100) addButton(6, "Goat", metamorphGoatHorns);
	else if (player.hasStatusEffect(StatusEffects.UnlockedGoatHorns) && player.horns.type == Horns.GOAT) addButtonDisabled(6, "Goat", "You already have goat horns.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedGoatHorns) && player.horns.type != Horns.GOAT && player.soulforce < 100) addButtonDisabled(6, "Goat", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(6, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedUnicornHorn) && player.horns.type != Horns.UNICORN && player.soulforce >= 100) addButton(7, "Unicorn", metamorphUnicornHorn);
	else if (player.hasStatusEffect(StatusEffects.UnlockedUnicornHorn) && player.horns.type == Horns.UNICORN) addButtonDisabled(7, "Unicorn", "You already have unicron horn.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedUnicornHorn) && player.horns.type != Horns.UNICORN && player.soulforce < 100) addButtonDisabled(7, "Unicorn", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(7, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedOniSingleHorn) && player.horns.type != Horns.ONI && player.soulforce >= 100) addButton(12, "Oni", metamorphOniSingleHorn);
	else if (player.hasStatusEffect(StatusEffects.UnlockedOniSingleHorn) && player.horns.type == Horns.ONI) addButtonDisabled(12, "Oni", "You already have oni horns.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedOniSingleHorn) && player.horns.type != Horns.ONI && player.soulforce < 100) addButtonDisabled(12, "Oni", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(12, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedOniTwinHorns) && player.horns.type != Horns.ONI_X2 && player.soulforce >= 100) addButton(13, "OniX2", metamorphOniDualHorns);
	else if (player.hasStatusEffect(StatusEffects.UnlockedOniTwinHorns) && player.horns.type == Horns.ONI_X2) addButtonDisabled(13, "OniX2", "You already have oni horns.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedOniTwinHorns) && player.horns.type != Horns.ONI_X2 && player.soulforce < 100) addButtonDisabled(13, "OniX2", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(13, "???", "You have not yet unlocked this metamorphosis!");
	addButton(14, "Back", accessPage1MetamorphMenu);
}
private function accessPage2HornsMenu():void {
	menu();
	if (player.hasStatusEffect(StatusEffects.UnlockedBicornHorns) && player.horns.type != Horns.BICORN && player.soulforce >= 100) addButton(0, "Bicorn", metamorphBicornHorns);
	else if (player.hasStatusEffect(StatusEffects.UnlockedBicornHorns) && player.horns.type == Horns.BICORN) addButtonDisabled(0, "Bicorn", "You already have goat horns.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedBicornHorns) && player.horns.type != Horns.BICORN && player.soulforce < 100) addButtonDisabled(0, "Bicorn", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(0, "???", "You have not yet unlocked this metamorphosis!");
	addButton(14, "Back", accessPage1MetamorphMenu);
}

private function accessPage2MetamorphMenu():void {
	menu();
	addButton(0, "Arms(1)", accessPage1ArmsMenu);
	addButton(1, "Arms(2)", accessPage2ArmsMenu);
	addButton(2, "Arms(3)", accessPage3ArmsMenu);
	addButton(3, "Wings(1)", accessPage1WingsMenu);
	addButton(4, "Wings(2)", accessPage2WingsMenu);
	addButton(5, "Wings(3)", accessPage3WingsMenu);
	addButton(14, "Back", accessMetamorphMenu);
}
private function accessPage1ArmsMenu():void {
	menu();
	if (player.hasStatusEffect(StatusEffects.UnlockedHumanArms) && player.arms.type != Arms.HUMAN && player.soulforce >= 500) addButton(0, "Human", metamorphHumanArms);
	else if (player.hasStatusEffect(StatusEffects.UnlockedHumanArms) && player.arms.type == Arms.HUMAN) addButtonDisabled(0, "Human", "You already have human arms.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedHumanArms) && player.arms.type != Arms.HUMAN && player.soulforce < 500) addButtonDisabled(0, "Human", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(0, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedHarpyArms) && player.arms.type != Arms.HARPY && player.soulforce >= 100) addButton(1, "Harpy", metamorphHarpyArms);
	else if (player.hasStatusEffect(StatusEffects.UnlockedHarpyArms) && player.arms.type == Arms.HARPY) addButtonDisabled(1, "Harpy", "You already have harpy arms.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedHarpyArms) && player.arms.type != Arms.HARPY && player.soulforce < 100) addButtonDisabled(1, "Harpy", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(1, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedSpiderArms) && player.arms.type != Arms.SPIDER && player.soulforce >= 100) addButton(2, "Spider", metamorphSpiderArms);
	else if (player.hasStatusEffect(StatusEffects.UnlockedSpiderArms) && player.arms.type == Arms.SPIDER) addButtonDisabled(2, "Spider", "You already have spider arms.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedSpiderArms) && player.arms.type != Arms.SPIDER && player.soulforce < 100) addButtonDisabled(2, "Spider", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(2, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedMantisArms) && player.arms.type != Arms.MANTIS && player.soulforce >= 100) addButton(3, "Mantis", metamorphMantisArms);
	else if (player.hasStatusEffect(StatusEffects.UnlockedMantisArms) && player.arms.type == Arms.MANTIS) addButtonDisabled(3, "Mantis", "You already have mantis arms.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedMantisArms) && player.arms.type != Arms.MANTIS && player.soulforce < 100) addButtonDisabled(3, "Mantis", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(3, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedBeeArms) && player.arms.type != Arms.BEE && player.soulforce >= 100) addButton(4, "Bee", metamorphBeeArms);
	else if (player.hasStatusEffect(StatusEffects.UnlockedBeeArms) && player.arms.type == Arms.BEE) addButtonDisabled(4, "Bee", "You already have bee arms.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedBeeArms) && player.arms.type != Arms.BEE && player.soulforce < 100) addButtonDisabled(4, "Bee", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(4, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedSalamanderArms) && player.arms.type != Arms.SALAMANDER && player.soulforce >= 100) addButton(5, "Salamander", metamorphSalamanderArms);
	else if (player.hasStatusEffect(StatusEffects.UnlockedSalamanderArms) && player.arms.type == Arms.SALAMANDER) addButtonDisabled(5, "Salamander", "You already have salamander arms.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedSalamanderArms) && player.arms.type != Arms.SALAMANDER && player.soulforce < 100) addButtonDisabled(5, "Salamander", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(5, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedPhoenixArms) && player.arms.type != Arms.PHOENIX && player.soulforce >= 100) addButton(6, "Phoenix", metamorphPhoenixArms);
	else if (player.hasStatusEffect(StatusEffects.UnlockedPhoenixArms) && player.arms.type == Arms.PHOENIX) addButtonDisabled(6, "Phoenix", "You already have phoenix arms.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedPhoenixArms) && player.arms.type != Arms.PHOENIX && player.soulforce < 100) addButtonDisabled(6, "Phoenix", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(6, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedSharkArms) && player.arms.type != Arms.SHARK && player.soulforce >= 100) addButton(8, "Shark", metamorphSharkArms);
	else if (player.hasStatusEffect(StatusEffects.UnlockedSharkArms) && player.arms.type == Arms.SHARK) addButtonDisabled(8, "Shark", "You already have shark arms.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedSharkArms) && player.arms.type != Arms.SHARK && player.soulforce < 100) addButtonDisabled(8, "Shark", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(8, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedLionArms) && player.arms.type != Arms.LION && player.soulforce >= 100) addButton(11, "Lion", metamorphLionArms);
	else if (player.hasStatusEffect(StatusEffects.UnlockedLionArms) && player.arms.type == Arms.LION) addButtonDisabled(11, "Lion", "You already have lion arms.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedLionArms) && player.arms.type != Arms.LION && player.soulforce < 100) addButtonDisabled(11, "Lion", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(11, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedFoxArms) && player.arms.type != Arms.FOX && player.soulforce >= 100) addButton(12, "Fox", metamorphArmsFox);
	else if (player.hasStatusEffect(StatusEffects.UnlockedFoxArms) && player.arms.type == Arms.FOX) addButtonDisabled(12, "Fox", "You already have fox arms.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedFoxArms) && player.arms.type != Arms.FOX && player.soulforce < 100) addButtonDisabled(12, "Fox", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(12, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedKitsuneArms) && player.arms.type != Arms.KITSUNE && player.soulforce >= 100) addButton(13, "Kitsune", metamorphKitsuneArms);
	else if (player.hasStatusEffect(StatusEffects.UnlockedKitsuneArms) && player.arms.type == Arms.KITSUNE) addButtonDisabled(13, "Kitsune", "You already have kitsune arms.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedKitsuneArms) && player.arms.type != Arms.KITSUNE && player.soulforce < 100) addButtonDisabled(13, "Kitsune", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(13, "???", "You have not yet unlocked this metamorphosis!");
	addButton(14, "Back", accessPage2MetamorphMenu);
}
private function accessPage2ArmsMenu():void {
	menu();
	if (player.hasStatusEffect(StatusEffects.UnlockedLizardArms) && player.arms.type != Arms.LIZARD && player.soulforce >= 100) addButton(0, "Lizard", metamorphLizardArms);
	else if (player.hasStatusEffect(StatusEffects.UnlockedLizardArms) && player.arms.type == Arms.LIZARD) addButtonDisabled(0, "Lizard", "You already have lizard arms.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedLizardArms) && player.arms.type != Arms.LIZARD && player.soulforce < 100) addButtonDisabled(0, "Lizard", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(0, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedDraconicArms) && player.arms.type != Arms.DRAGON && player.soulforce >= 100) addButton(1, "Dragon", metamorphDragonArms);
	else if (player.hasStatusEffect(StatusEffects.UnlockedDraconicArms) && player.arms.type == Arms.DRAGON) addButtonDisabled(1, "Dragon", "You already have dragon arms.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedDraconicArms) && player.arms.type != Arms.DRAGON && player.soulforce < 100) addButtonDisabled(1, "Dragon", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(1, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedOrcaArms) && player.arms.type != Arms.ORCA && player.soulforce >= 100) addButton(3, "Orca", metamorphOrcaArms);
	else if (player.hasStatusEffect(StatusEffects.UnlockedOrcaArms) && player.arms.type == Arms.ORCA) addButtonDisabled(3, "Orca", "You already have orca arms.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedOrcaArms) && player.arms.type != Arms.ORCA && player.soulforce < 100) addButtonDisabled(3, "Orca", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(3, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedDevilArms) && player.arms.type != Arms.DEVIL && player.soulforce >= 100) addButton(5, "Devil", metamorphDevilArms);
	else if (player.hasStatusEffect(StatusEffects.UnlockedDevilArms) && player.arms.type == Arms.DEVIL) addButtonDisabled(5, "Devil", "You already have devil arms.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedDevilArms) && player.arms.type != Arms.DEVIL && player.soulforce < 100) addButtonDisabled(5, "Devil", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(5, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedOniArms) && player.arms.type != Arms.ONI && player.soulforce >= 100) addButton(6, "Oni", metamorphOniArms);
	else if (player.hasStatusEffect(StatusEffects.UnlockedOniArms) && player.arms.type == Arms.ONI) addButtonDisabled(6, "Oni", "You already have oni arms.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedOniArms) && player.arms.type != Arms.ONI && player.soulforce < 100) addButtonDisabled(6, "Oni", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(6, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedElfArms) && player.arms.type != Arms.ELF && player.soulforce >= 100) addButton(7, "Elf", metamorphElfArms);
	else if (player.hasStatusEffect(StatusEffects.UnlockedElfArms) && player.arms.type == Arms.ELF) addButtonDisabled(7, "Elf", "You already have elf arms.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedElfArms) && player.arms.type != Arms.ELF && player.soulforce < 100) addButtonDisabled(7, "Elf", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(7, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedRaijuArms) && player.arms.type != Arms.RAIJU && player.soulforce >= 100) addButton(8, "Raiju", metamorphRaijuArms);
	else if (player.hasStatusEffect(StatusEffects.UnlockedRaijuArms) && player.arms.type == Arms.RAIJU) addButtonDisabled(8, "Raiju", "You already have raiju arms.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedRaijuArms) && player.arms.type != Arms.RAIJU && player.soulforce < 100) addButtonDisabled(8, "Raiju", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(8, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedRedPandaArms) && player.arms.type != Arms.RED_PANDA && player.soulforce >= 100) addButton(9, "Red Panda", metamorphRedPandaArms);
	else if (player.hasStatusEffect(StatusEffects.UnlockedRedPandaArms) && player.arms.type == Arms.RED_PANDA) addButtonDisabled(9, "Red Panda", "You already have red panda arms.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedRedPandaArms) && player.arms.type != Arms.RED_PANDA && player.soulforce < 100) addButtonDisabled(9, "Red Panda", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(9, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedCatArms) && player.arms.type != Arms.CAT && player.soulforce >= 100) addButton(11, "Cat", metamorphCatArms);
	else if (player.hasStatusEffect(StatusEffects.UnlockedCatArms) && player.arms.type == Arms.CAT) addButtonDisabled(11, "Cat", "You already have cat arms.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedCatArms) && player.arms.type != Arms.CAT && player.soulforce < 100) addButtonDisabled(11, "Cat", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(11, "???", "You have not yet unlocked this metamorphosis!");
	addButton(14, "Back", accessPage2MetamorphMenu);
}
private function accessPage3ArmsMenu():void {
	menu();
	if (player.hasStatusEffect(StatusEffects.UnlockedSphinxArms) && player.arms.type != Arms.SPHINX && player.soulforce >= 100) addButton(0, "Sphinx", metamorphSphinxArms);
	else if (player.hasStatusEffect(StatusEffects.UnlockedSphinxArms) && player.arms.type == Arms.SPHINX) addButtonDisabled(0, "Sphinx", "You already have sphinx arms.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedSphinxArms) && player.arms.type != Arms.SPHINX && player.soulforce < 100) addButtonDisabled(0, "Sphinx", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(0, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedPigArms) && player.arms.type != Arms.PIG && player.soulforce >= 100) addButton(1, "Pig", metamorphPigArms);
	else if (player.hasStatusEffect(StatusEffects.UnlockedPigArms) && player.arms.type == Arms.PIG) addButtonDisabled(1, "Pig", "You already have pig arms.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedPigArms) && player.arms.type != Arms.PIG && player.soulforce < 100) addButtonDisabled(1, "Pig", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(1, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedBoarArms) && player.arms.type != Arms.BOAR && player.soulforce >= 100) addButton(2, "Boar", metamorphBoarArms);
	else if (player.hasStatusEffect(StatusEffects.UnlockedBoarArms) && player.arms.type == Arms.BOAR) addButtonDisabled(2, "Boar", "You already have boar arms.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedBoarArms) && player.arms.type != Arms.BOAR && player.soulforce < 100) addButtonDisabled(2, "Boar", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(2, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedOrcArms) && player.arms.type != Arms.ORC && player.soulforce >= 100) addButton(3, "Orc", metamorphOrcArms);
	else if (player.hasStatusEffect(StatusEffects.UnlockedOrcArms) && player.arms.type == Arms.ORC) addButtonDisabled(3, "Orc", "You already have orc arms.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedOrcArms) && player.arms.type != Arms.ORC && player.soulforce < 100) addButtonDisabled(3, "Orc", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(3, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedDisplacerArms) && player.arms.type != Arms.DISPLACER && player.soulforce >= 100) addButton(4, "Displacer", metamorphDisplacerArms);
	else if (player.hasStatusEffect(StatusEffects.UnlockedDisplacerArms) && player.arms.type == Arms.DISPLACER) addButtonDisabled(4, "Displacer", "You already have displacer beast arms.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedDisplacerArms) && player.arms.type != Arms.DISPLACER && player.soulforce < 100) addButtonDisabled(4, "Displacer", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(4, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedRaijuArms2) && player.arms.type != Arms.RAIJU_2 && player.soulforce >= 100) addButton(12, "Raiju Paws", metamorphRaijuArms2);
	else if (player.hasStatusEffect(StatusEffects.UnlockedRaijuArms2) && player.arms.type == Arms.RAIJU_2) addButtonDisabled(12, "Raiju Paws", "You already have raiju paws.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedRaijuArms2) && player.arms.type != Arms.RAIJU_2 && player.soulforce < 100) addButtonDisabled(12, "Raiju Paws", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(12, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedBatWings) && player.arms.type != Arms.BAT && player.soulforce >= 100) addButton(9, "Bat", metamorphBatWings);
	else if (player.hasStatusEffect(StatusEffects.UnlockedBatWings) && player.arms.type == Arms.BAT) addButtonDisabled(9, "Bat", "You already have winged bat arms.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedBatWings) && player.arms.type != Arms.BAT && player.soulforce < 100) addButtonDisabled(9, "Bat", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(9, "???", "You have not yet unlocked this metamorphosis!");
	addButton(14, "Back", accessPage2MetamorphMenu);
}
private function accessPage1WingsMenu():void {
	menu();
	if (player.hasStatusEffect(StatusEffects.UnlockedHumanNoWings) && player.wings.type != Wings.NONE && player.soulforce >= 500) addButton(0, "Human", metamorphHumanNoWings);
	else if (player.hasStatusEffect(StatusEffects.UnlockedHumanNoWings) && player.wings.type == Wings.NONE) addButtonDisabled(0, "Human", "You already have no wings.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedHumanNoWings) && player.wings.type != Wings.NONE && player.soulforce < 500) addButtonDisabled(0, "Human", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(0, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedBeeWingsSmall) && player.wings.type != Wings.BEE_LIKE_SMALL && player.soulforce >= 100) addButton(1, "Bee(S)", metamorphBeeWingsSmall);
	else if (player.hasStatusEffect(StatusEffects.UnlockedBeeWingsSmall) && player.wings.type == Wings.BEE_LIKE_SMALL) addButtonDisabled(1, "Bee(S)", "You already have small bee wings.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedBeeWingsSmall) && player.wings.type != Wings.BEE_LIKE_SMALL && player.soulforce < 100) addButtonDisabled(1, "Bee(S)", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(1, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedBeeWingsLarge) && player.wings.type == Wings.BEE_LIKE_SMALL && player.soulforce >= 200) addButton(2, "Bee(L)", metamorphBeeWingsLarge);
	else if (player.hasStatusEffect(StatusEffects.UnlockedBeeWingsLarge) && player.wings.type == Wings.BEE_LIKE_LARGE) addButtonDisabled(2, "Bee(L)", "You already have large bee wings.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedBeeWingsLarge) && player.wings.type != Wings.BEE_LIKE_LARGE && player.soulforce < 200) addButtonDisabled(2, "Bee(L)", "You do not have enough Soulforce for this metamorphosis.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedBeeWingsLarge) && player.wings.type != Wings.BEE_LIKE_SMALL) addButtonDisabled(2, "Bee(L)", "You do not have proper type of wings for this metamorphosis.");
	else addButtonDisabled(2, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedDemonTinyBatWings) && player.wings.type != Wings.BAT_LIKE_TINY && player.soulforce >= 100) addButton(6, "Demon(S)", metamorphWingsDemonicTiny);
	else if (player.hasStatusEffect(StatusEffects.UnlockedDemonTinyBatWings) && player.wings.type == Wings.BAT_LIKE_TINY) addButtonDisabled(6, "Demon(S)", "You already have small bat wings.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedDemonTinyBatWings) && player.wings.type != Wings.BAT_LIKE_TINY && player.soulforce < 100) addButtonDisabled(6, "Demon(S)", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(6, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedDemonLargeBatWings) && player.wings.type == Wings.BAT_LIKE_TINY && player.soulforce >= 200) addButton(7, "Demon(L)", metamorphWingsDemoncLarge);
	else if (player.hasStatusEffect(StatusEffects.UnlockedDemonLargeBatWings) && player.wings.type == Wings.BAT_LIKE_LARGE) addButtonDisabled(7, "Demon(L)", "You already have large bat wings.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedDemonLargeBatWings) && player.wings.type != Wings.BAT_LIKE_LARGE && player.soulforce < 200) addButtonDisabled(7, "Demon(L)", "You do not have enough Soulforce for this metamorphosis.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedDemonLargeBatWings) && player.wings.type != Wings.BAT_LIKE_TINY) addButtonDisabled(7, "Demon(L)", "You do not have proper type of wings for this metamorphosis.");
	else addButtonDisabled(7, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedHarpyWings) && player.wings.type != Wings.FEATHERED_LARGE && player.soulforce >= 100) addButton(8, "Harpy", metamorphHarpyWings);
	else if (player.hasStatusEffect(StatusEffects.UnlockedHarpyWings) && player.wings.type == Wings.FEATHERED_LARGE) addButtonDisabled(8, "Harpy", "You already have harpy wings.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedHarpyWings) && player.wings.type != Wings.FEATHERED_LARGE && player.soulforce < 100) addButtonDisabled(8, "Harpy", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(8, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedDraconicWingsSmall) && player.wings.type != Wings.DRACONIC_SMALL && player.soulforce >= 100) addButton(9, "Dragon(S)", metamorphDragonWingsSmall);
	else if (player.hasStatusEffect(StatusEffects.UnlockedDraconicWingsSmall) && player.wings.type == Wings.DRACONIC_SMALL) addButtonDisabled(9, "Dragon(S)", "You already have small dragon wings.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedDraconicWingsSmall) && player.wings.type != Wings.DRACONIC_SMALL && player.soulforce < 100) addButtonDisabled(9, "Dragon(S)", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(9, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedDraconicWingsLarge) && player.wings.type == Wings.DRACONIC_SMALL && player.soulforce >= 200) addButton(10, "Dragon(L)", metamorphDragonWingsLarge);
	else if (player.hasStatusEffect(StatusEffects.UnlockedDraconicWingsLarge) && player.wings.type == Wings.DRACONIC_LARGE) addButtonDisabled(10, "Dragon(L)", "You already have large dragon wings.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedDraconicWingsLarge) && player.wings.type != Wings.DRACONIC_LARGE && player.soulforce < 200) addButtonDisabled(10, "Dragon(L)", "You do not have enough Soulforce for this metamorphosis.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedDraconicWingsLarge) && player.wings.type != Wings.DRACONIC_SMALL) addButtonDisabled(10, "Dragon(L)", "You do not have proper type of wings for this metamorphosis.");
	else addButtonDisabled(10, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedDemonLargeBatWings2) && player.wings.type == Wings.BAT_LIKE_LARGE && player.soulforce >= 300) addButton(12, "Demon(L2)", metamorphWingsDemonicLarge2);
	else if (player.hasStatusEffect(StatusEffects.UnlockedDemonLargeBatWings2) && player.wings.type == Wings.BAT_LIKE_LARGE_2) addButtonDisabled(12, "Demon(L2)", "You already have two large pairs of bat wings.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedDemonLargeBatWings2) && player.wings.type != Wings.BAT_LIKE_LARGE_2 && player.soulforce < 300) addButtonDisabled(12, "Demon(L2)", "You do not have enough Soulforce for this metamorphosis.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedDemonLargeBatWings2) && player.wings.type != Wings.BAT_LIKE_LARGE) addButtonDisabled(12, "Demon(L2)", "You do not have proper type of wings for this metamorphosis.");
	else addButtonDisabled(12, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedDraconicWingsHuge) && player.wings.type == Wings.DRACONIC_LARGE && player.soulforce >= 300) addButton(13, "Dragon(H)", metamorphDragonWingsHuge);
	else if (player.hasStatusEffect(StatusEffects.UnlockedDraconicWingsHuge) && player.wings.type == Wings.DRACONIC_HUGE) addButtonDisabled(13, "Dragon(H)", "You already have huge dragon wings.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedDraconicWingsHuge) && player.wings.type != Wings.DRACONIC_HUGE && player.soulforce < 300) addButtonDisabled(13, "Dragon(H)", "You do not have enough Soulforce for this metamorphosis.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedDraconicWingsHuge) && player.wings.type != Wings.DRACONIC_LARGE) addButtonDisabled(13, "Dragon(H)", "You do not have proper type of wings for this metamorphosis.");
	else addButtonDisabled(13, "???", "You have not yet unlocked this metamorphosis!");
	addButton(14, "Back", accessPage2MetamorphMenu);
}
private function accessPage2WingsMenu():void {
	menu();
	if (player.hasStatusEffect(StatusEffects.UnlockedPhoenixWings) && player.wings.type != Wings.FEATHERED_PHOENIX && player.soulforce >= 100) addButton(0, "Phoenix", metamorphPhoenixWings);
	else if (player.hasStatusEffect(StatusEffects.UnlockedPhoenixWings) && player.wings.type == Wings.FEATHERED_PHOENIX) addButtonDisabled(0, "Phoenix", "You already have phoenix wings.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedPhoenixWings) && player.wings.type != Wings.FEATHERED_PHOENIX && player.soulforce < 100) addButtonDisabled(0, "Phoenix", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(0, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedAlicornWings) && player.wings.type != Wings.FEATHERED_ALICORN && player.soulforce >= 200) addButton(1, "Alicorn", metamorphAlicornWings);
	else if (player.hasStatusEffect(StatusEffects.UnlockedAlicornWings) && player.wings.type == Wings.FEATHERED_ALICORN) addButtonDisabled(1, "Alicorn", "You already have alicorn wings.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedAlicornWings) && player.wings.type != Wings.FEATHERED_ALICORN && player.soulforce < 200) addButtonDisabled(1, "Alicorn", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(1, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedMantisWingsSmall) && player.wings.type != Wings.MANTIS_LIKE_SMALL && player.soulforce >= 100) addButton(2, "Mantis(S)", metamorphMantisWingsSmall);
	else if (player.hasStatusEffect(StatusEffects.UnlockedMantisWingsSmall) && player.wings.type == Wings.MANTIS_LIKE_SMALL) addButtonDisabled(2, "Mantis(S)", "You already have mantis small wings.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedMantisWingsSmall) && player.wings.type != Wings.MANTIS_LIKE_SMALL && player.soulforce < 100) addButtonDisabled(2, "Mantis(S)", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(2, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedMantisWingsLarge) && player.wings.type == Wings.MANTIS_LIKE_SMALL && player.soulforce >= 200) addButton(3, "Mantis(L)", metamorphMantisWingsLarge);
	else if (player.hasStatusEffect(StatusEffects.UnlockedMantisWingsLarge) && player.wings.type == Wings.MANTIS_LIKE_LARGE) addButtonDisabled(3, "Mantis(L)", "You already have large mantis wings.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedMantisWingsLarge) && player.wings.type != Wings.MANTIS_LIKE_LARGE && player.soulforce < 200) addButtonDisabled(3, "Mantis(L)", "You do not have enough Soulforce for this metamorphosis.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedMantisWingsLarge) && player.wings.type != Wings.MANTIS_LIKE_SMALL) addButtonDisabled(3, "Mantis(L)", "You do not have proper type of wings for this metamorphosis.");
	else addButtonDisabled(3, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedManticoreWingsSmall) && player.wings.type != Wings.MANTICORE_LIKE_SMALL && player.soulforce >= 100) addButton(7, "Manticore(S)", metamorphManticoreWingsSmall);
	else if (player.hasStatusEffect(StatusEffects.UnlockedManticoreWingsSmall) && player.wings.type == Wings.MANTICORE_LIKE_SMALL) addButtonDisabled(7, "Manticore(S)", "You already have manticore small wings.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedManticoreWingsSmall) && player.wings.type != Wings.MANTICORE_LIKE_SMALL && player.soulforce < 100) addButtonDisabled(7, "Manticore(S)", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(7, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedManticoreWingsLarge) && player.wings.type == Wings.MANTICORE_LIKE_SMALL && player.soulforce >= 200) addButton(8, "Manticore(L)", metamorphManticoreWingsLarge);
	else if (player.hasStatusEffect(StatusEffects.UnlockedManticoreWingsLarge) && player.wings.type == Wings.MANTICORE_LIKE_LARGE) addButtonDisabled(8, "Manticore(L)", "You already have large manticore wings.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedManticoreWingsLarge) && player.wings.type != Wings.MANTICORE_LIKE_LARGE && player.soulforce < 200) addButtonDisabled(8, "Manticore(L)", "You do not have enough Soulforce for this metamorphosis.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedManticoreWingsLarge) && player.wings.type != Wings.MANTICORE_LIKE_SMALL) addButtonDisabled(8, "Manticore(L)", "You do not have proper type of wings for this metamorphosis.");
	else addButtonDisabled(8, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedVampireWings) && player.wings.type != Wings.VAMPIRE && player.soulforce >= 100) addButton(10, "Vampire", metamorphVampireWings);
	else if (player.hasStatusEffect(StatusEffects.UnlockedVampireWings) && player.wings.type == Wings.VAMPIRE) addButtonDisabled(10, "Vampire", "You already have vampire wings.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedVampireWings) && player.wings.type != Wings.VAMPIRE && player.soulforce < 100) addButtonDisabled(10, "Vampire", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(10, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedNightmareWings) && player.wings.type != Wings.NIGHTMARE && player.soulforce >= 200) addButton(13, "Nightmare", metamorphNightmareWings);
	else if (player.hasStatusEffect(StatusEffects.UnlockedNightmareWings) && player.wings.type == Wings.NIGHTMARE) addButtonDisabled(13, "Nightmare", "You already have nightmare wings.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedNightmareWings) && player.wings.type != Wings.NIGHTMARE && player.soulforce < 200) addButtonDisabled(13, "Nightmare", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(13, "???", "You have not yet unlocked this metamorphosis!");
	addButton(14, "Back", accessPage2MetamorphMenu);
}
private function accessPage3WingsMenu():void {
	menu();
	if (player.hasStatusEffect(StatusEffects.UnlockedSphinxWings) && player.wings.type != Wings.FEATHERED_SPHINX && player.soulforce >= 100) addButton(0, "Sphinx", metamorphSphinxWings);
	else if (player.hasStatusEffect(StatusEffects.UnlockedSphinxWings) && player.wings.type == Wings.FEATHERED_SPHINX) addButtonDisabled(0, "Sphinx", "You already have sphinx wings.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedSphinxWings) && player.wings.type != Wings.FEATHERED_SPHINX && player.soulforce < 100) addButtonDisabled(0, "Sphinx", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(0, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedRaijuThunderousAura) && player.wings.type != Wings.THUNDEROUS_AURA && player.soulforce >= 100) addButton(2, "Raiju", metamorphRaijuThunderousAura);
	else if (player.hasStatusEffect(StatusEffects.UnlockedRaijuThunderousAura) && player.wings.type == Wings.THUNDEROUS_AURA) addButtonDisabled(2, "Raiju", "You already have raiju thunderous aura.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedRaijuThunderousAura) && player.wings.type != Wings.THUNDEROUS_AURA && player.soulforce < 100) addButtonDisabled(2, "Raiju", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(2, "???", "You have not yet unlocked this metamorphosis!");
	addButton(14, "Back", accessPage2MetamorphMenu);
}
private function accessPage3MetamorphMenu():void {
	menu();
	addButton(0, "Skin", accessSkinMenuOld);
	addButton(1, "SkinPat.", accessSkinPatternsMenuOld);
	addButton(2, "Rear B.", accessRearBodyMenuOld);
	addButton(3, "Antennae", accessAntennaeMenuOld);
	addButton(4, "Gills", accessGillsMenuOld);
	addButton(5, "Tail(1)", accessPage1TailMenu);
	addButton(6, "Tail(2)", accessPage2TailMenu);
	addButton(7, "Tail(3)", accessPage3TailMenu);
	addButton(8, "Tail(4)", accessPage4TailMenu);
	addButton(9, "Tail(5)", accessPage5TailMenu);
	addButton(14, "Back", accessMetamorphMenu);
}
private function accessSkinMenuOld():void {
	menu();
	if (player.hasStatusEffect(StatusEffects.UnlockedHumanSkin) && player.skinType != Skin.PLAIN && player.soulforce >= 500) addButton(0, "Human", metamorphHumanSkin);
	else if (player.hasStatusEffect(StatusEffects.UnlockedHumanSkin) && player.skinType == Skin.PLAIN) addButtonDisabled(0, "Human", "You already have plain human skin.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedHumanSkin) && player.skinType != Skin.PLAIN && player.soulforce < 500) addButtonDisabled(0, "Human", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(0, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedFur) && player.skinType != Skin.FUR && player.soulforce >= 100) addButton(1, "Fur", metamorphFur);
	else if (player.hasStatusEffect(StatusEffects.UnlockedFur) && player.skinType == Skin.FUR) addButtonDisabled(1, "Fur", "You already have fur.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedFur) && player.skinType != Skin.FUR && player.soulforce < 100) addButtonDisabled(1, "Fur", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(1, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedScales) && player.skinType != Skin.SCALES && player.soulforce >= 100) addButton(2, "Scales", metamorphScales);
	else if (player.hasStatusEffect(StatusEffects.UnlockedScales) && player.skinType == Skin.SCALES) addButtonDisabled(2, "Scales", "You already have scales.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedScales) && player.skinType != Skin.SCALES && player.soulforce < 100) addButtonDisabled(2, "Scales", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(2, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedChitin) && !player.hasCoatOfType(Skin.CHITIN) && player.soulforce >= 100) addButton(4, "Chitin", metamorphChitin);
	else if (player.hasStatusEffect(StatusEffects.UnlockedChitin) && player.hasCoatOfType(Skin.CHITIN)) addButtonDisabled(4, "Chitin", "You already have chitin.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedChitin) && !player.hasCoatOfType(Skin.CHITIN) && player.soulforce < 100) addButtonDisabled(4, "Chitin", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(4, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedDragonScales) && player.skinType != Skin.DRAGON_SCALES && player.soulforce >= 150) addButton(8, "D.Scales", metamorphDragonScales);
	else if (player.hasStatusEffect(StatusEffects.UnlockedDragonScales) && player.skinType == Skin.DRAGON_SCALES) addButtonDisabled(8, "D.Scales", "You already have dragon scales.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedDragonScales) && player.skinType != Skin.DRAGON_SCALES && player.soulforce < 150) addButtonDisabled(8, "D.Scales", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(8, "???", "You have not yet unlocked this metamorphosis!");
	addButton(14, "Back", accessPage3MetamorphMenu);
}
private function accessSkinPatternsMenuOld():void {
	menu();
	if (player.hasStatusEffect(StatusEffects.UnlockedHumanNoSkinPattern) && player.skin.base.pattern != Skin.PATTERN_NONE && player.soulforce >= 500) addButton(0, "Human", metamorphHumanNoSkinPatterns);
	else if (player.hasStatusEffect(StatusEffects.UnlockedHumanNoSkinPattern) && player.skin.base.pattern == Skin.PATTERN_NONE) addButtonDisabled(0, "Human", "You already have no skin patterns.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedHumanNoSkinPattern) && player.skin.base.pattern != Skin.PATTERN_NONE && player.soulforce < 500) addButtonDisabled(0, "Human", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(0, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedTattoed) && player.skin.base.pattern != Skin.PATTERN_MAGICAL_TATTOO && player.soulforce >= 100) addButton(1, "Kitsune", metamorphKitsuneSkinPattern);
	else if (player.hasStatusEffect(StatusEffects.UnlockedTattoed) && player.skin.base.pattern == Skin.PATTERN_MAGICAL_TATTOO) addButtonDisabled(1, "Kitsune", "You already have kitsune skin patterns.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedTattoed) && player.skin.base.pattern != Skin.PATTERN_MAGICAL_TATTOO && player.soulforce < 100) addButtonDisabled(1, "Kitsune", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(1, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedBattleTattoed) && player.skin.base.pattern != Skin.PATTERN_BATTLE_TATTOO && player.soulforce >= 100) addButton(5, "Oni", metamorphOniSkinPattern);
	else if (player.hasStatusEffect(StatusEffects.UnlockedBattleTattoed) && player.skin.base.pattern == Skin.PATTERN_BATTLE_TATTOO) addButtonDisabled(5, "Oni", "You already have oni skin patterns.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedBattleTattoed) && player.skin.base.pattern != Skin.PATTERN_BATTLE_TATTOO && player.soulforce < 100) addButtonDisabled(5, "Oni", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(5, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedLightningTattoed) && player.skin.base.pattern != Skin.PATTERN_LIGHTNING_SHAPED_TATTOO && player.soulforce >= 100) addButton(7, "Raiju", metamorphRaijuSkinPattern);
	else if (player.hasStatusEffect(StatusEffects.UnlockedLightningTattoed) && player.skin.base.pattern == Skin.PATTERN_LIGHTNING_SHAPED_TATTOO) addButtonDisabled(7, "Raiju", "You already have raiju skin patterns.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedLightningTattoed) && player.skin.base.pattern != Skin.PATTERN_LIGHTNING_SHAPED_TATTOO && player.soulforce < 100) addButtonDisabled(7, "Raiju", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(7, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedScarTattoed) && player.skin.base.pattern != Skin.PATTERN_SCAR_SHAPED_TATTOO && player.soulforce >= 100) addButton(9, "Orc", metamorphOrcSkinPattern);
	else if (player.hasStatusEffect(StatusEffects.UnlockedScarTattoed) && player.skin.base.pattern == Skin.PATTERN_SCAR_SHAPED_TATTOO) addButtonDisabled(9, "Orc", "You already have orc skin patterns.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedScarTattoed) && player.skin.base.pattern != Skin.PATTERN_SCAR_SHAPED_TATTOO && player.soulforce < 100) addButtonDisabled(9, "Orc", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(9, "???", "You have not yet unlocked this metamorphosis!");
	addButton(14, "Back", accessPage3MetamorphMenu);
}
private function accessRearBodyMenuOld():void {
	menu();
	if (player.hasStatusEffect(StatusEffects.UnlockedHumanNoRearBody) && player.rearBody.type != RearBody.NONE && player.soulforce >= 500) addButton(0, "Human", metamorphHumanNoRearBody);
	else if (player.hasStatusEffect(StatusEffects.UnlockedHumanNoRearBody) && player.rearBody.type == RearBody.NONE) addButtonDisabled(0, "Human", "You already have human rear body.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedHumanNoRearBody) && player.rearBody.type != RearBody.NONE && player.soulforce < 500) addButtonDisabled(0, "Human", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(0, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedLionMane) && player.rearBody.type != RearBody.LION_MANE && player.soulforce >= 100) addButton(4, "Lion", metamorphLionMane);
	else if (player.hasStatusEffect(StatusEffects.UnlockedLionMane) && player.rearBody.type == RearBody.LION_MANE) addButtonDisabled(4, "Lion", "You already have lion mane.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedLionMane) && player.rearBody.type != RearBody.LION_MANE && player.soulforce < 100) addButtonDisabled(4, "Lion", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(4, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedSharkFin) && player.rearBody.type != RearBody.SHARK_FIN && player.soulforce >= 100) addButton(6, "Shark", metamorphSharkFin);
	else if (player.hasStatusEffect(StatusEffects.UnlockedSharkFin) && player.rearBody.type == RearBody.SHARK_FIN) addButtonDisabled(6, "Shark", "You already have shark back fin.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedSharkFin) && player.rearBody.type != RearBody.SHARK_FIN && player.soulforce < 100) addButtonDisabled(6, "Shark", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(6, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedOrcaBlowhole) && player.rearBody.type != RearBody.ORCA_BLOWHOLE && player.soulforce >= 100) addButton(7, "Orca", metamorphOrcaBlowhole);
	else if (player.hasStatusEffect(StatusEffects.UnlockedOrcaBlowhole) && player.rearBody.type == RearBody.ORCA_BLOWHOLE) addButtonDisabled(7, "Orca", "You already have orca blowhole.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedOrcaBlowhole) && player.rearBody.type != RearBody.ORCA_BLOWHOLE && player.soulforce < 100) addButtonDisabled(7, "Shark", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(7, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedRaijuMane) && player.rearBody.type != RearBody.RAIJU_MANE && player.soulforce >= 100) addButton(8, "Raiju", metamorphRaijuMane);
	else if (player.hasStatusEffect(StatusEffects.UnlockedRaijuMane) && player.rearBody.type == RearBody.RAIJU_MANE) addButtonDisabled(8, "Raiju", "You already have raiju mane.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedRaijuMane) && player.rearBody.type != RearBody.RAIJU_MANE && player.soulforce < 100) addButtonDisabled(8, "Raiju", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(8, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedBatCollar) && player.rearBody.type != RearBody.BAT_COLLAR && player.soulforce >= 100) addButton(9, "Bat", metamorphBatCollar);
	else if (player.hasStatusEffect(StatusEffects.UnlockedBatCollar) && player.rearBody.type == RearBody.BAT_COLLAR) addButtonDisabled(9, "Bat", "You already have bat collar.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedBatCollar) && player.rearBody.type != RearBody.BAT_COLLAR && player.soulforce < 100) addButtonDisabled(9, "Bat", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(9, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedDisplacerBTentacles) && player.rearBody.type != RearBody.DISPLACER_TENTACLES && player.soulforce >= 100) addButton(11, "Displacer", metamorphDisplacerBackTentacles);
	else if (player.hasStatusEffect(StatusEffects.UnlockedDisplacerBTentacles) && player.rearBody.type == RearBody.DISPLACER_TENTACLES) addButtonDisabled(11, "Displacer", "You already have displacer beast back tentacles.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedDisplacerBTentacles) && player.rearBody.type != RearBody.DISPLACER_TENTACLES && player.soulforce < 100) addButtonDisabled(11, "Displacer", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(11, "???", "You have not yet unlocked this metamorphosis!");
	addButton(14, "Back", accessPage3MetamorphMenu);
}
private function accessAntennaeMenuOld():void {
	menu();
	if (player.hasStatusEffect(StatusEffects.UnlockedMantisAntennae) && player.antennae.type != Antennae.NONE && player.soulforce >= 500) addButton(0, "Human", metamorphHumanNoAntennae);
	else if (player.hasStatusEffect(StatusEffects.UnlockedMantisAntennae) && player.antennae.type == Antennae.NONE) addButtonDisabled(0, "Human", "You already have no antennaes.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedMantisAntennae) && player.antennae.type != Antennae.NONE && player.soulforce < 500) addButtonDisabled(0, "Human", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(0, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedMantisAntennae) && player.antennae.type != Antennae.MANTIS && player.soulforce >= 100) addButton(1, "Mantis", metamorphMantisAntennae);
	else if (player.hasStatusEffect(StatusEffects.UnlockedMantisAntennae) && player.antennae.type == Antennae.MANTIS) addButtonDisabled(1, "Mantis", "You already have mantis antennaes.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedMantisAntennae) && player.antennae.type != Antennae.MANTIS && player.soulforce < 100) addButtonDisabled(1, "Mantis", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(1, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedBeeAntennae) && player.antennae.type != Antennae.BEE && player.soulforce >= 100) addButton(2, "Bee", metamorphBeeAntennae);
	else if (player.hasStatusEffect(StatusEffects.UnlockedBeeAntennae) && player.antennae.type == Antennae.BEE) addButtonDisabled(2, "Bee", "You already have bee antennaes.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedBeeAntennae) && player.antennae.type != Antennae.BEE && player.soulforce < 100) addButtonDisabled(2, "Bee", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(2, "???", "You have not yet unlocked this metamorphosis!");
	addButton(14, "Back", accessPage3MetamorphMenu);
}
private function accessGillsMenuOld():void {
	menu();
	if (player.hasStatusEffect(StatusEffects.UnlockedFishGills) && player.gills.type != Gills.NONE && player.soulforce >= 500) addButton(0, "Human", metamorphHumanNoGills);
	else if (player.hasStatusEffect(StatusEffects.UnlockedFishGills) && player.gills.type == Gills.NONE) addButtonDisabled(0, "Human", "You already have no gills.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedFishGills) && player.gills.type != Gills.NONE && player.soulforce < 500) addButtonDisabled(0, "Human", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(0, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedFishGills) && player.gills.type != Gills.FISH && player.soulforce >= 100) addButton(2, "Fish", metamorphFishGills);
	else if (player.hasStatusEffect(StatusEffects.UnlockedFishGills) && player.gills.type == Gills.FISH) addButtonDisabled(2, "Fish", "You already have fish gills.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedFishGills) && player.gills.type != Gills.FISH && player.soulforce < 100) addButtonDisabled(2, "Fish", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(2, "???", "You have not yet unlocked this metamorphosis!");
	addButton(14, "Back", accessPage3MetamorphMenu);
}
private function accessPage1TailMenu():void {
	menu();
	if (player.hasStatusEffect(StatusEffects.UnlockedHumanNoTail) && player.tailType != Tail.NONE && player.soulforce >= 500) addButton(0, "Human", metamorphHumanNoTail);
	else if (player.hasStatusEffect(StatusEffects.UnlockedHumanNoTail) && player.tailType == Tail.NONE) addButtonDisabled(0, "Human", "You already not have tail.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedHumanNoTail) && player.tailType != Tail.NONE && player.soulforce < 500) addButtonDisabled(0, "Human", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(0, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedHorseTail) && player.tailType != Tail.HORSE && player.soulforce >= 100) addButton(1, "Horse", metamorphHorseTail);
	else if (player.hasStatusEffect(StatusEffects.UnlockedHorseTail) && player.tailType == Tail.HORSE) addButtonDisabled(1, "Horse", "You already have horse tail.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedHorseTail) && player.tailType != Tail.HORSE && player.soulforce < 100) addButtonDisabled(1, "Horse", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(1, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedDemonTail) && player.tailType != Tail.DEMONIC && player.soulforce >= 100) addButton(3, "Demon", metamorphTailDemonic);
	else if (player.hasStatusEffect(StatusEffects.UnlockedDemonTail) && player.tailType == Tail.DEMONIC) addButtonDisabled(3, "Demon", "You already have demon tail.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedDemonTail) && player.tailType != Tail.DEMONIC && player.soulforce < 100) addButtonDisabled(3, "Demon", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(3, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedCowTail) && player.tailType != Tail.COW && player.soulforce >= 100) addButton(4, "Cow", metamorphCowTail);
	else if (player.hasStatusEffect(StatusEffects.UnlockedCowTail) && player.tailType == Tail.COW) addButtonDisabled(4, "Cow", "You already have cow tail.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedCowTail) && player.tailType != Tail.COW && player.soulforce < 100) addButtonDisabled(4, "Cow", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(4, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedSpiderTail) && player.tailType != Tail.SPIDER_ADBOMEN && player.soulforce >= 100) addButton(5, "Spider", metamorphSpiderTail);
	else if (player.hasStatusEffect(StatusEffects.UnlockedSpiderTail) && player.tailType == Tail.SPIDER_ADBOMEN) addButtonDisabled(5, "Spider", "You already have spider abdomen.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedSpiderTail) && player.tailType != Tail.SPIDER_ADBOMEN && player.soulforce < 100) addButtonDisabled(5, "Spider", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(5, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedBeeTail) && player.tailType != Tail.BEE_ABDOMEN && player.soulforce >= 100) addButton(6, "Bee", metamorphBeeTail);
	else if (player.hasStatusEffect(StatusEffects.UnlockedBeeTail) && player.tailType == Tail.BEE_ABDOMEN) addButtonDisabled(6, "Bee", "You already have bee tail.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedBeeTail) && player.tailType != Tail.BEE_ABDOMEN && player.soulforce < 100) addButtonDisabled(6, "Bee", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(6, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedSharkTail) && player.tailType != Tail.SHARK && player.soulforce >= 100) addButton(7, "Shark", metamorphSharkTail);
	else if (player.hasStatusEffect(StatusEffects.UnlockedSharkTail) && player.tailType == Tail.SHARK) addButtonDisabled(7, "Shark", "You already have shark tail.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedSharkTail) && player.tailType != Tail.SHARK && player.soulforce < 100) addButtonDisabled(7, "Shark", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(7, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedCatTail) && (player.tailType != Tail.CAT || (player.tailType == Tail.CAT && player.tailCount >= 2)) && player.soulforce >= 100) addButton(8, "Cat", metamorphCatTail);
	else if (player.hasStatusEffect(StatusEffects.UnlockedCatTail) && player.tailType == Tail.CAT && player.tailCount == 1) addButtonDisabled(8, "Cat", "You already have single cat tail.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedCatTail) && player.tailType != Tail.CAT && player.soulforce < 100) addButtonDisabled(8, "Cat", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(8, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedCatTail2nd) && player.tailType == Tail.NEKOMATA_FORKED_2_3 && player.soulforce >= 400) addButton(9, "Nekomata", metamorphCat2ndTail);
	else if (player.hasStatusEffect(StatusEffects.UnlockedCatTail2nd) && player.tailType == Tail.CAT && player.tailCount >= 2) addButtonDisabled(9, "Nekomata", "You already have twin cat tail.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedCatTail2nd) && player.tailType != Tail.CAT && player.tailCount < 2 && player.soulforce < 400) addButtonDisabled(9, "Nekomata", "You do not have enough Soulforce for this metamorphosis.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedCatTail2nd) && player.tailType != Tail.NEKOMATA_FORKED_2_3) addButtonDisabled(9, "Nekomata", "You do not have proper type of tail for this metamorphosis.");
	else addButtonDisabled(2, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedLizardTail) && player.tailType != Tail.LIZARD && player.soulforce >= 100) addButton(10, "Lizard", metamorphLizardTail);
	else if (player.hasStatusEffect(StatusEffects.UnlockedLizardTail) && player.tailType == Tail.LIZARD) addButtonDisabled(10, "Lizard", "You already have lizard tail.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedLizardTail) && player.tailType != Tail.LIZARD && player.soulforce < 100) addButtonDisabled(10, "Lizard", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(10, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedHarpyTail) && player.tailType != Tail.HARPY && player.soulforce >= 100) addButton(12, "Harpy", metamorphHarpyTail);
	else if (player.hasStatusEffect(StatusEffects.UnlockedHarpyTail) && player.tailType == Tail.HARPY) addButtonDisabled(12, "Harpy", "You already have harpy tail.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedHarpyTail) && player.tailType != Tail.HARPY && player.soulforce < 100) addButtonDisabled(12, "Harpy", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(12, "???", "You have not yet unlocked this metamorphosis!");
	addButton(14, "Back", accessPage3MetamorphMenu);
}
private function accessPage2TailMenu():void {
	menu();
	if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail) && (player.tailType != Tail.FOX || (player.tailType == Tail.FOX && player.tailCount >= 2)) && player.soulforce >= 100) addButton(0, "Fox", metamorphTailFox);
	else if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail) && player.tailType == Tail.FOX && player.tailCount == 1) addButtonDisabled(0, "Fox", "You already have single fox tail.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail) && player.tailType != Tail.FOX && player.soulforce < 100) addButtonDisabled(0, "Fox", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(0, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail2nd) && player.tailType == Tail.FOX && player.tailCount == 1 && player.soulforce >= 200) addButton(1, "Fox 2nd", metamorphTailFox2nd);
	else if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail2nd) && player.tailType == Tail.FOX) {
		if (player.tailCount == 2) addButtonDisabled(1, "Fox 2nd", "You already have two fox tails.");
		else if (player.tailCount == 1 && player.soulforce < 200) addButtonDisabled(1, "Fox 2nd", "You do not have enough Soulforce for this metamorphosis.");
		else addButtonDisabled(1, "Fox 2nd", "You need to have only one fox tail to use this metamophosis.");
	}
	else if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail2nd) && player.tailType != Tail.FOX) {
		if (player.tailCount != 1) addButtonDisabled(1, "Fox 2nd", "You do not have proper type of tails for this metamorphosis.");
		else addButtonDisabled(1, "Fox 2nd", "You do not have proper type and amount of tails for this metamorphosis.");
	}
	else addButtonDisabled(1, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail3rd) && player.tailType == Tail.FOX && player.tailCount == 2 && player.soulforce >= 300) addButton(2, "Fox 3rd", metamorphTailFox3rd);
	else if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail3rd) && player.tailType == Tail.FOX) {
		if (player.tailCount == 3) addButtonDisabled(2, "Fox 3rd", "You already have three fox tails.");
		else if (player.tailCount == 2 && player.soulforce < 300) addButtonDisabled(2, "Fox 3rd", "You do not have enough Soulforce for this metamorphosis.");
		else addButtonDisabled(2, "Fox 3rd", "You need to have two fox tails to use this metamophosis.");
	}
	else if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail3rd) && player.tailType != Tail.FOX && player.tailCount != 2) addButtonDisabled(2, "Fox 3rd", "You do not have proper type and amount of tails for this metamorphosis.");
	else addButtonDisabled(2, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail4th) && player.tailType == Tail.FOX && player.tailCount == 3 && player.soulforce >= 400) addButton(3, "Fox 4th", metamorphTailFox4th);
	else if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail4th) && player.tailType == Tail.FOX) {
		if (player.tailCount == 4) addButtonDisabled(3, "Fox 4th", "You already have four fox tails.");
		else if (player.tailCount == 3 && player.soulforce < 400) addButtonDisabled(3, "Fox 4th", "You do not have enough Soulforce for this metamorphosis.");
		else addButtonDisabled(3, "Fox 4th", "You need to have three fox tails to use this metamophosis.");
	}
	else if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail4th) && player.tailType != Tail.FOX && player.tailCount != 3) addButtonDisabled(3, "Fox 4th", "You do not have proper type and amount of tails for this metamorphosis.");
	else addButtonDisabled(3, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail5th) && player.tailType == Tail.FOX && player.tailCount == 4 && player.soulforce >= 500) addButton(4, "Fox 5th", metamorphTailFox5th);
	else if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail5th) && player.tailType == Tail.FOX) {
		if (player.tailCount == 5) addButtonDisabled(4, "Fox 5th", "You already have five fox tails.");
		else if (player.tailCount == 4 && player.soulforce < 500) addButtonDisabled(4, "Fox 5th", "You do not have enough Soulforce for this metamorphosis.");
		else addButtonDisabled(4, "Fox 5th", "You need to have four fox tails to use this metamophosis.");
	}
	else if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail5th) && player.tailType != Tail.FOX && player.tailCount != 4) addButtonDisabled(4, "Fox 5th", "You do not have proper type and amount of tails for this metamorphosis.");
	else addButtonDisabled(4, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail6th) && player.tailType == Tail.FOX && player.tailCount == 5 && player.soulforce >= 600) addButton(5, "Fox 6th", metamorphTailFox6th);
	else if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail6th) && player.tailType == Tail.FOX) {
		if (player.tailCount == 6) addButtonDisabled(5, "Fox 6th", "You already have six fox tails.");
		else if (player.tailCount == 5 && player.soulforce < 600) addButtonDisabled(5, "Fox 6th", "You do not have enough Soulforce for this metamorphosis.");
		else addButtonDisabled(5, "Fox 6th", "You need to have five fox tails to use this metamophosis.");
	}
	else if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail6th) && player.tailType != Tail.FOX && player.tailCount != 5) addButtonDisabled(5, "Fox 6th", "You do not have proper type and amount of tails for this metamorphosis.");
	else addButtonDisabled(5, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail7th) && player.tailType == Tail.FOX && player.tailCount == 6 && player.soulforce >= 700) addButton(6, "Fox 7th", metamorphTailFox7th);
	else if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail7th) && player.tailType == Tail.FOX) {
		if (player.tailCount == 7) addButtonDisabled(6, "Fox 7th", "You already have seven fox tails.");
		else if (player.tailCount == 6 && player.soulforce < 700) addButtonDisabled(6, "Fox 7th", "You do not have enough Soulforce for this metamorphosis.");
		else addButtonDisabled(6, "Fox 7th", "You need to have six fox tails to use this metamophosis.");
	}
	else if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail7th) && player.tailType != Tail.FOX && player.tailCount != 6) addButtonDisabled(6, "Fox 7th", "You do not have proper type and amount of tails for this metamorphosis.");
	else addButtonDisabled(6, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail8th) && player.tailType == Tail.FOX && player.tailCount == 7 && player.soulforce >= 800) addButton(7, "Fox 8th", metamorphTailFox8th);
	else if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail8th) && player.tailType == Tail.FOX) {
		if (player.tailCount == 8) addButtonDisabled(7, "Fox 8th", "You already have eight fox tails.");
		else if (player.tailCount == 7 && player.soulforce < 800) addButtonDisabled(7, "Fox 8th", "You do not have enough Soulforce for this metamorphosis.");
		else addButtonDisabled(7, "Fox 8th", "You need to have seven fox tails to use this metamophosis.");
	}
	else if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail8th) && player.tailType != Tail.FOX && player.tailCount != 7) addButtonDisabled(7, "Fox 8th", "You do not have proper type and amount of tails for this metamorphosis.");
	else addButtonDisabled(7, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail9th) && player.tailType == Tail.FOX && player.tailCount == 8 && player.soulforce >= 900) addButton(8, "Fox 9th", metamorphTailFox9th);
	else if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail9th) && player.tailType == Tail.FOX) {
		if (player.tailCount == 9) addButtonDisabled(8, "Fox 9th", "You already have nine fox tails.");
		else if (player.tailCount == 8 && player.soulforce < 900) addButtonDisabled(8, "Fox 9th", "You do not have enough Soulforce for this metamorphosis.");
		else addButtonDisabled(8, "Fox 9th", "You need to have eight fox tails to use this metamophosis.");
	}
	else if (player.hasStatusEffect(StatusEffects.UnlockedFoxTail9th) && player.tailType != Tail.FOX && player.tailCount != 8) addButtonDisabled(8, "Fox 9th", "You do not have proper type and amount of tails for this metamorphosis.");
	else addButtonDisabled(8, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedDraconicTail) && player.tailType != Tail.DRACONIC && player.soulforce >= 100) addButton(9, "Dragon", metamorphDragonTail);
	else if (player.hasStatusEffect(StatusEffects.UnlockedDraconicTail) && player.tailType == Tail.DRACONIC) addButtonDisabled(9, "Dragon", "You already have dragon tail.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedDraconicTail) && player.tailType != Tail.DRACONIC && player.soulforce < 100) addButtonDisabled(9, "Dragon", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(9, "???", "You have not yet unlocked this metamorphosis!");
	addButton(14, "Back", accessPage3MetamorphMenu);
}
private function accessPage3TailMenu():void {
	menu();
	if (player.hasStatusEffect(StatusEffects.UnlockedPigTail) && player.tailType != Tail.PIG && player.soulforce >= 100) addButton(0, "Pig", metamorphPigTail);
	else if (player.hasStatusEffect(StatusEffects.UnlockedPigTail) && player.tailType == Tail.PIG) addButtonDisabled(0, "Pig", "You already have pig tail.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedPigTail) && player.tailType != Tail.PIG && player.soulforce < 100) addButtonDisabled(0, "Pig", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(0, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedScorpionTail) && player.tailType != Tail.SCORPION && player.soulforce >= 100) addButton(1, "Scorpion", metamorphScorpionTail);
	else if (player.hasStatusEffect(StatusEffects.UnlockedScorpionTail) && player.tailType == Tail.SCORPION) addButtonDisabled(1, "Scorpion", "You already have scorpion tail.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedScorpionTail) && player.tailType != Tail.SCORPION && player.soulforce < 100) addButtonDisabled(1, "Scorpion", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(1, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedGoatTail) && player.tailType != Tail.GOAT && player.soulforce >= 100) addButton(2, "Goat", metamorphGoatTail);
	else if (player.hasStatusEffect(StatusEffects.UnlockedGoatTail) && player.tailType == Tail.GOAT) addButtonDisabled(2, "Goat", "You already have goat tail.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedGoatTail) && player.tailType != Tail.GOAT && player.soulforce < 100) addButtonDisabled(2, "Goat", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(2, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedSalamanderTail) && player.tailType != Tail.SALAMANDER && player.soulforce >= 100) addButton(6, "Salamander", metamorphSalamanderTail);
	else if (player.hasStatusEffect(StatusEffects.UnlockedSalamanderTail) && player.tailType == Tail.SALAMANDER) addButtonDisabled(6, "Salamander", "You already have salamander tail.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedSalamanderTail) && player.tailType != Tail.SALAMANDER && player.soulforce < 100) addButtonDisabled(6, "Salamander", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(6, "???", "You have not yet unlocked this metamorphosis!");
	//7 to 13 -> kitshoo tails 1st to 7th
	addButton(14, "Back", accessPage3MetamorphMenu);
}
private function accessPage4TailMenu():void {
	menu();
	//0 and 1 -> kitshoo tails 8th & 9th
	if (player.hasStatusEffect(StatusEffects.UnlockedMantisTail) && player.tailType != Tail.MANTIS_ABDOMEN && player.soulforce >= 100) addButton(2, "Mantis", metamorphMantisTail);
	else if (player.hasStatusEffect(StatusEffects.UnlockedMantisTail) && player.tailType == Tail.MANTIS_ABDOMEN) addButtonDisabled(2, "Mantis", "You already have mantis abdomen.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedMantisTail) && player.tailType != Tail.MANTIS_ABDOMEN && player.soulforce < 100) addButtonDisabled(2, "Mantis", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(2, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedManticoreTail) && player.tailType == Tail.SCORPION) {
		if (player.tailType != Tail.MANTICORE_PUSSYTAIL && player.soulforce >= 200) {
			if (player.hasCock()) addButtonDisabled(3, "Manticore", "You can't use this metamorphosis as long you not get rid of your manhood.");
			else addButton(3, "Manticore", metamorphManticoreTail);
		}
		else if (player.tailType == Tail.MANTICORE_PUSSYTAIL) addButtonDisabled(3, "Manticore", "You already have manticore pussytail.");
		else if (player.tailType != Tail.MANTICORE_PUSSYTAIL && player.soulforce < 200) addButtonDisabled(3, "Manticore", "You do not have enough Soulforce for this metamorphosis.");
	}
	else if (player.hasStatusEffect(StatusEffects.UnlockedManticoreTail) && player.tailType != Tail.SCORPION) addButtonDisabled(3, "Manticore", "You do not have proper type of tail for this metamorphosis.");
	else addButtonDisabled(3, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedOrcaTail) && player.tailType != Tail.ORCA && player.soulforce >= 100) addButton(6, "Orca", metamorphOrcaTail);
	else if (player.hasStatusEffect(StatusEffects.UnlockedOrcaTail) && player.tailType == Tail.ORCA) addButtonDisabled(6, "Orca", "You already have orca tail.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedOrcaTail) && player.tailType != Tail.ORCA && player.soulforce < 100) addButtonDisabled(6, "Orca", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(6, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedRaijuTail) && player.tailType != Tail.RAIJU && player.soulforce >= 100) addButton(8, "Raiju", metamorphRaijuTail);
	else if (player.hasStatusEffect(StatusEffects.UnlockedRaijuTail) && player.tailType == Tail.RAIJU) addButtonDisabled(8, "Raiju", "You already have raiju tail.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedRaijuTail) && player.tailType != Tail.RAIJU && player.soulforce < 100) addButtonDisabled(8, "Raiju", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(8, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedRedPandaTail) && player.tailType != Tail.RED_PANDA && player.soulforce >= 100) addButton(9, "Red Panda", metamorphRedPandaTail);
	else if (player.hasStatusEffect(StatusEffects.UnlockedRedPandaTail) && player.tailType == Tail.RED_PANDA) addButtonDisabled(9, "Red Panda", "You already have red panda tail.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedRedPandaTail) && player.tailType != Tail.RED_PANDA && player.soulforce < 100) addButtonDisabled(9, "Red Panda", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(9, "???", "You have not yet unlocked this metamorphosis!");
	addButton(14, "Back", accessPage3MetamorphMenu);
}
private function accessPage5TailMenu():void {
	menu();
	if (player.hasStatusEffect(StatusEffects.UnlockedHellcatBurningTail) && player.tailType != Tail.BURNING && player.soulforce >= 100) addButton(0, "Hellcat", metamorphHellcatBurningTail);
	else if (player.hasStatusEffect(StatusEffects.UnlockedHellcatBurningTail) && player.tailType == Tail.BURNING) addButtonDisabled(0, "Hellcat", "You already have hellcat burning tail.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedHellcatBurningTail) && player.tailType != Tail.BURNING && player.soulforce < 100) addButtonDisabled(0, "Hellcat", "You do not have enough Soulforce for this metamorphosis.");
	else addButtonDisabled(0, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedNekomataForkedTail1) && player.tailType != Tail.NEKOMATA_FORKED_1_3 && player.soulforce >= 200) addButton(1, "Forked 1/3", metamorphNekomataOneThirdForkedTail);
	else if (player.hasStatusEffect(StatusEffects.UnlockedNekomataForkedTail1) && player.tailType == Tail.NEKOMATA_FORKED_1_3) addButtonDisabled(1, "Forked 1/3", "You already have 1/3 forked cat tail.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedNekomataForkedTail1) && player.tailType != Tail.NEKOMATA_FORKED_1_3 && player.soulforce < 200) addButtonDisabled(1, "Forked 1/3", "You do not have enough Soulforce for this metamorphosis.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedNekomataForkedTail1) && player.tailType != Tail.CAT && player.tailCount != 1) addButtonDisabled(2, "Forked 1/3", "You do not have proper type of tail for this metamorphosis.");
	else addButtonDisabled(1, "???", "You have not yet unlocked this metamorphosis!");
	if (player.hasStatusEffect(StatusEffects.UnlockedNekomataForkedTail2) && player.tailType != Tail.NEKOMATA_FORKED_2_3 && player.soulforce >= 300) addButton(2, "Forked 2/3", metamorphNekomataTwoThirdForkedTail);
	else if (player.hasStatusEffect(StatusEffects.UnlockedNekomataForkedTail2) && player.tailType == Tail.NEKOMATA_FORKED_2_3) addButtonDisabled(2, "Forked 2/3", "You already have 2/3 forked cat tail.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedNekomataForkedTail2) && player.tailType != Tail.NEKOMATA_FORKED_2_3 && player.soulforce < 300) addButtonDisabled(2, "Forked 2/3", "You do not have enough Soulforce for this metamorphosis.");
	else if (player.hasStatusEffect(StatusEffects.UnlockedNekomataForkedTail2) && player.tailType != Tail.NEKOMATA_FORKED_1_3) addButtonDisabled(2, "Forked 2/3", "You do not have proper type of tail for this metamorphosis.");
	else addButtonDisabled(2, "???", "You have not yet unlocked this metamorphosis!");
	addButton(14, "Back", accessPage3MetamorphMenu);
}
private function accessPageEx1MetamorphMenu():void {
	menu();
	if (player.soulforce >= 300) addButton(0, "Height +1", metamorphHeight1U);
	else addButtonDisabled(0, "Height +1", "You do not have enough Soulforce for this metamorphosis.");
	if (player.soulforce >= 700) addButton(1, "Height +2", metamorphHeight2U);
	else addButtonDisabled(1, "Height +2", "You do not have enough Soulforce for this metamorphosis.");
	if (player.soulforce >= 100) addButton(2, "Height -1", metamorphHeight1D);
	else addButtonDisabled(2, "Height -1", "You do not have enough Soulforce for this metamorphosis.");
	if (player.soulforce >= 300) addButton(3, "Height -2", metamorphHeight2D);
	else addButtonDisabled(3, "Height -2", "You do not have enough Soulforce for this metamorphosis.");
	if (player.soulforce >= 300) addButton(4, "Hair +1", metamorphHair1U);
	else addButtonDisabled(4, "Hair +1", "You do not have enough Soulforce for this metamorphosis.");
	//addButton(5, "Back", accessMetamorphMenu);
	//addButton(6, "Back", accessMetamorphMenu);
	//addButton(7, "Back", accessMetamorphMenu);
	//addButton(8, "Back", accessMetamorphMenu);
	if (player.soulforce >= 100) addButton(9, "Hair -1", metamorphHair1D);
	else addButtonDisabled(9, "Hair -1", "You do not have enough Soulforce for this metamorphosis.");
	//addButton(10, "Back", accessMetamorphMenu);
	//addButton(11, "Back", accessMetamorphMenu);
	//addButton(12, "Back", accessMetamorphMenu);
	//addButton(13, "Back", accessMetamorphMenu);
	addButton(14, "Back", accessMetamorphMenu);
}
private function accessPageEx2MetamorphMenu():void {
	menu();
	addButton(0, "Back", accessMetamorphMenu);
	addButton(1, "Back", accessMetamorphMenu);
	addButton(2, "Back", accessMetamorphMenu);
	addButton(3, "Back", accessMetamorphMenu);
	addButton(4, "Back", accessMetamorphMenu);
	addButton(5, "Back", accessMetamorphMenu);
	addButton(6, "Back", accessMetamorphMenu);
	addButton(7, "Back", accessMetamorphMenu);
	addButton(8, "Back", accessMetamorphMenu);
	addButton(9, "Back", accessMetamorphMenu);
	addButton(10, "Back", accessMetamorphMenu);
	addButton(11, "Back", accessMetamorphMenu);
	addButton(12, "Back", accessMetamorphMenu);
	addButton(13, "Back", accessMetamorphMenu);
	addButton(14, "Back", accessMetamorphMenu);
}
private function accessPageEx3MetamorphMenu():void {
	menu();
	addButton(0, "Skin", accessMetamorphMenu);
	addButton(1, "Hair", accessMetamorphMenu);
	addButton(2, "Fur", accessMetamorphMenu);/*
	addButton(3, "Back", accessMetamorphMenu);
	addButton(4, "Back", accessMetamorphMenu);
	addButton(5, "Back", accessMetamorphMenu);
	addButton(6, "Back", accessMetamorphMenu);
	addButton(7, "Back", accessMetamorphMenu);
	addButton(8, "Back", accessMetamorphMenu);
	addButton(9, "Back", accessMetamorphMenu);
	addButton(10, "Back", accessMetamorphMenu);
	addButton(11, "Back", accessMetamorphMenu);
	addButton(12, "Back", accessMetamorphMenu);
	addButton(13, "Back", accessMetamorphMenu);*/
	addButton(14, "Back", accessMetamorphMenu);
}
private function metamorphHeight1U():void {
	clearOutput();
	player.soulforce -= 300;
	outputText("\n\nWhoa wait did you just gain some height!? You indeed notice you've grown by an inch.");
	player.tallness += 1;
	if (player.tallness >= 132) player.tallness = 132;
	doNext(accessPageEx1MetamorphMenu);
}
private function metamorphHeight2U():void {
	clearOutput();
	player.soulforce -= 700;
	outputText("\n\nWhoa wait did you just gain some height!? You indeed notice you've grown by two inches.");
	player.tallness += 2;
	if (player.tallness >= 132) player.tallness = 132;
	doNext(accessPageEx1MetamorphMenu);
}
private function metamorphHeight1D():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nWhoa wait did you just lost some height!? You indeed notice you've shrunk by an inch.");
	player.tallness -= 1;
	if (player.tallness < 42) player.tallness = 42;
	doNext(accessPageEx1MetamorphMenu);
}
private function metamorphHeight2D():void {
	clearOutput();
	player.soulforce -= 300;
	outputText("\n\nWhoa wait did you just lost some height!? You indeed notice you've shrunk by two inches.");
	player.tallness -= 2;
	if (player.tallness < 42) player.tallness = 42;
	doNext(accessPageEx1MetamorphMenu);
}
private function metamorphHair1U():void {
	clearOutput();
	player.soulforce -= 300;
	outputText("\n\nWhoa wait did your hair just lenghten!? You indeed notice they're longer by an inch.");
	player.hairLength += 1;
	doNext(accessPageEx1MetamorphMenu);
}
private function metamorphHair1D():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nWhoa wait did your hair just lost some lenght!? You indeed notice they shortened by an inch.");
	player.hairLength -= 1;
	if (player.hairLength < 0) player.hairLength = 0;
	doNext(accessPageEx1MetamorphMenu);
}


private function metamorph000Fur():void {
	clearOutput();
	player.soulforce -= 100;


	doNext(accessMetamorphMenu);
}
private function metamorph001Fur():void {
	clearOutput();
	player.soulforce -= 100;


	doNext(accessMetamorphMenu);
}
private function metamorph002Fur():void {
	clearOutput();
	player.soulforce -= 100;


	doNext(accessMetamorphMenu);
}

private function metamorphSphinxArms():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\n");
	if (player.arms.type != Arms.HUMAN) outputText("You watch, spellbound, while your arms gradually changing it entire outer structure into plain human-like form. ");
	outputText("Your hands suddenly start to tingle as your arms grow a thin layer of -fur color- fur up to your shoulders. You watch, enthralled, as your nails fall off your fingers, feline claws taking their place on your five-fingered hands. That said, they don't look exactly like paws as your hands retain their dexterity and general appearance which is a perfect mix between human and leonine features. Thanks to their shape, your new bestial hands should not hinder your spellcasting abilities.. <b>Your arms are now covered in fur and end with clawed hands like those of a sphinx.</b>");
	player.arms.type = Arms.SPHINX;
	doNext(accessPage3ArmsMenu);
}
private function metamorphSphinxWings():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\n");
	if (player.wings.type != Wings.NONE) removeOldWings();
	outputText("Pain lances through your back, the muscles knotting oddly and pressing up to bulge your [skin.type]. It hurts, oh gods does it hurt, but you can't get a good angle to feel at the source of your agony. A loud crack splits the air, and then your body is forcing a pair of narrow limbs through a gap in your [armor]. Blood pumps through the new appendages, easing the pain as they fill out and grow. Tentatively, you find yourself flexing muscles you didn't know you had, and <b>you're able to curve the new growths far enough around to behold your brand new, [haircolor] wings.</b>");
	player.wings.type = Wings.FEATHERED_SPHINX;
	player.wings.desc = "large feathered";
	doNext(accessPage3WingsMenu);
}
private function metamorphManticoreWingsLarge():void {
	clearOutput();
	player.soulforce -= 200;
	outputText("\n\nYour feel your wings growing larger by the second. They keep growing until they reach three times their original size. The transformation finally stops as your wings reach a span of twice your arms length. These will be really useful should you want to fly around in search of a meal. <b>You now have fully grown manticore wings.</b>");
	player.wings.type = Wings.MANTICORE_LIKE_LARGE;
	player.wings.desc = "large manticore-like";
	doNext(accessPage2WingsMenu);
}
private function metamorphManticoreWingsSmall():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\n");
	if (player.wings.type != Wings.NONE) removeOldWings();
	outputText("You scream something akin to a roar from the tremendous amount of pain you're suddenly experiencing as something starts to push out from your back. Your claws start digging large marks into the ground as the things stretch out and burst through your skin. Large bones covered in a thin, yet sturdy layer of skin, forming a pair of small bat-like wings slowly push out before finally staying in place. They are too small right now to allow you to take flight but they sure look good on you. <b>You now have small manticore wings.</b>");
	player.wings.type = Wings.MANTICORE_LIKE_SMALL;
	player.wings.desc = "small manticore-like";
	doNext(accessPage2WingsMenu);
}
private function metamorphManticoreTail():void {
	clearOutput();
	player.soulforce -= 200;
	outputText("\n\nYour scorpion tail starts shifting as your stinger falls to the ground, leaving you with a wide hole at the tip of your tail. You have a feeling of emptiness in your tail, like if it was hollowed from the inside. The end of your tail where the stinger used to be suddenly explodes into a flower-like bulb of flesh. The petals open into what looks like the inside of a pussy, its folds moist and well lubricated. ");
	outputText("Right after the previous transformation’s finished, spikes starts to grow out of the bulbous tip giving your tail tip the appearance of a spiked bulb. Flinging your tail randomly to test your new appendage you shoot one of them straight into a nearby tree. You idly wonder what it will feels like to milk men with this. <b>It seems you've grown the tail of a manticore.</b>");
	player.tailType = Tail.MANTICORE_PUSSYTAIL;
	doNext(accessPage4TailMenu);
}
private function metamorphScorpionTail():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.tailType != Tail.NONE) outputText("\n\nPainful swelling just above your " + Appearance.buttDescription(player) + " doubles you over, and you hear the sound of your tail dropping off onto the ground! Before you can consider the implications, the pain gets worse, and you feel your backside bulge outward sickeningly, cracking and popping as a segmented scorpion-like tail grows in place of your old one. It grows large enough to be impossible to hide, and with a note of finality, your stinger slides free with an audible 'snick'. <b>You have a scorpion tail.</b>");
	else outputText("\n\nPainful swelling just above your " + Appearance.buttDescription(player) + " doubles you over. It gets worse and worse as the swollen lump begins to protrude from your backside, swelling and extending with a series of pops until you have a segmented tail hanging just above your butt. The whole thing is covered in a hard chitinous material, and large enough to be impossible to hide. You sigh as your stinger slides into place with a 'snick', finishing the transformation. <b>You have a scorpion tail.</b>");
	player.tailType = Tail.SCORPION;
	player.tailCount = 1;
	player.tailVenom = 15;
	player.tailRecharge = 5;
	doNext(accessPage3TailMenu);
}
private function metamorphLionArms():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\n");
	if (player.arms.type != Arms.HUMAN) outputText("You watch, spellbound, while your arms gradually changing it entire outer structure into plain human-like form. ");
	outputText("Your hands suddenly start to hurt as your arms grows a thick coat of [skin coat.color] fur up to your shoulders where it turns [haircolor]. You watch enthralled as your nails fall off your fingers, feline claws taking their place on your now five-fingered paw-like hands. <b>You now have leonine paw hands.</b>");
	player.arms.type = Arms.LION;
	doNext(accessPage1ArmsMenu);
}
private function metamorphLionMane():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nYou suddenly feel hair growing all around your neck at a crazy pace. It soon get so thick it almost looks as if you're wearing a [haircolor] fur collar. <b>You now have a full lion mane around your neck.</b>");
	player.rearBody.type = RearBody.LION_MANE;
	doNext(accessRearBodyMenuOld);
}
private function metamorphCat2ndTail():void {
	clearOutput();
	player.soulforce -= 400;
	outputText("\n\nA tingling pressure builds on your backside, and your soft, glossy, and partially forked tail begins to glow with an eerie, ghostly light. With a crackle of electrical energy, your tail finishes splitting in two! <b>You now have a pair of cat-tails.</b>");
	player.tailType = Tail.CAT;
	player.tailCount = 2;
	doNext(accessPage1TailMenu);
}
private function metamorphNekomataTwoThirdForkedTail():void {
	clearOutput();
	player.soulforce -= 300;
	outputText("\n\nA tingling pressure builds on your backside, and your soft, glossy, and partially forked tail begins to glow with an eerie, ghostly light. With a crackle of electrical energy, it starts splitting into two, stopping as another third of its length becomes forked! <b>You now have a cat tail that is forked at two thirds of its length.</b>");
	player.tailType = Tail.NEKOMATA_FORKED_2_3;
	doNext(accessPage5TailMenu);
}
private function metamorphNekomataOneThirdForkedTail():void {
	clearOutput();
	player.soulforce -= 200;
	outputText("\n\nA tingling pressure builds on your backside, and your soft, glossy tail begins to glow with an eerie, ghostly light. With a crackle of electrical energy, it starts splitting into two, stopping once the split reaches a third of the way down the length! <b>You now have a cat tail that is forked on the last third of its length.</b>");
	player.tailType = Tail.NEKOMATA_FORKED_1_3;
	doNext(accessPage5TailMenu);
}
private function metamorphHellcatBurningTail():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nWarmth then rampage all around body altering your body. It heads for your tail exploding there in a sheath of flame before spiraling toward your head. <b>You now have burning tail.</b>");
	player.tailType = Tail.BURNING;
	player.tailCount = 1;
	doNext(accessPage5TailMenu);
}
private function metamorphLionEars():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nYour ears suddenly stretch painfully, making you scream in pain as they move toward the top of your head, growing rounder and bigger. Putting your hands to your ears you discover they are now covered with a fair amount of dark fur. <b>You now have lion ears.</b>");
	player.ears.type = Ears.LION;
	doNext(accessPage2EarsMenu);
}
private function metamorphDisplacerEars():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nYour ears begin to prickle and burn as the skin tears and stretches migrating to the top of your head as they change into long wide, deep ears, perfect for catching any stray sound. Which becomes apparent when your hearing becomes far more clear than it has ever been. <b>Sound has become an entirely new experience now that you have displacer beast ears!</b>");
	player.ears.type = Ears.DISPLACER;
	doNext(accessPage3EarsMenu);
}
private function metamorphDisplacerArms():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.arms.type != Arms.HUMAN) restoreHumanArms();
	outputText("\n\nSomething weird is happening around the level of your ribcage. Painfully large bumps start expanding on the side of your body. You fall on all fours panting heavily from the pain as two new limbs surge under your arms. As you sit, trying to grab these new limbs to check them out, you grab your arms instead. No wait your arm grabbed your arm that grabs another arm?! As you examine yourself you discover a second set of limbs grew under your arms. <b>Guess if your mind actually managed to process the action correctly you could actually use four weapons at once, instead you move around on your three set of limbs not unlike a displacer beast.</b>");
	player.arms.type = Arms.DISPLACER;
	doNext(accessPage3ArmsMenu);
}
private function metamorphDisplacerBackTentacles():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\n");
	if (player.rearBody.type != RearBody.NONE) outputText("A wave of tightness spreads through your back, and it feels as if someone is stabbing a dagger in it. After a moment the pain passes, though your back is back to what you looked like when you entered this realm! ");
	outputText("Two large fleshy lumps explode from your shoulders and you scream in pain. These fleshy appendages weave and move like whips in your back and only stop doing so when you finally manage to calm yourself. <b>As you look back to see what's going on, you notice you now have a pair of tentacles with thick, fleshy heads. You can feel the air brushing over the sensitive needles and suction cups that cover both of them, your new venom glistening on the tips.</b>");
	player.rearBody.type = RearBody.DISPLACER_TENTACLES;
	doNext(accessRearBodyMenuOld);
}

private function metamorphCatArms():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.arms.type != Arms.HUMAN) restoreHumanArms();
	outputText("\n\nYour hands suddenly start to hurt as your arms grows a thick coat of [skin coat.color] fur up to your shoulders. You watch enthralled as your nails fall off your fingers, feline claws taking their place on your now five-fingered paw-like hands. <b>You now have cat paw hands.</b>");
	player.arms.type = Arms.CAT;
	doNext(accessPage2ArmsMenu);
}
private function metamorphCatTail():void {
	clearOutput();
	var choice:int;
	player.soulforce -= 100;
	if (player.tailType == Tail.NONE) {
		choice = rand(3);
		if (choice == 0) outputText("\n\nA pressure builds in your backside. You feel under your [armor] and discover an odd bump that seems to be growing larger by the moment. In seconds it passes between your fingers, bursts out the back of your clothes and grows most of the way to the ground. A thick coat of fur springs up to cover your new tail. You instinctively keep adjusting it to improve your balance. <b>You now have a cat-tail.</b>");
		if (choice == 1) outputText("\n\nYou feel your backside shift and change, flesh molding and displacing into a long, flexible tail! <b>You now have a cat tail.</b>");
		if (choice == 2) outputText("\n\nYou feel an odd tingling in your spine and your tail bone starts to throb and then swell. Within a few moments it begins to grow, adding new bones to your spine. Before you know it, you have a tail. Just before you think it's over, the tail begins to sprout soft, glossy [skin coat.color] fur. <b>You now have a cat tail.</b>");
	}
	else outputText("\n\nYou pause and tilt your head... something feels different. Ah, that's what it is; you turn around and look down at your tail as it starts to change shape, narrowing and sprouting glossy fur. <b>You now have a cat tail.</b>");
	player.tailType = Tail.CAT;
	player.tailCount = 1;
	doNext(accessPage1TailMenu);
}
private function metamorphCatEars():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.ears.type == Ears.HUMAN) {
		if (rand(2) == 0) outputText("\n\nThe skin on the sides of your face stretches painfully as your ears migrate upwards, towards the top of your head. They shift and elongate a little, fur growing on them as they become feline in nature. <b>You now have cat ears.</b>");
		else outputText("\n\nYour ears begin to tingle. You reach up with one hand and gently rub them. They appear to be growing fur. Within a few moments, they've migrated up to the top of your head and increased in size. The tingling stops and you find yourself hearing noises in a whole new way. <b>You now have cat ears.</b>");
	}
	else {
		if (rand(2) == 0) outputText("\n\nYour ears change shape, morphing into pointed, feline ears! They swivel about reflexively as you adjust to them. <b>You now have cat ears.</b>");
		else outputText("\n\nYour ears tingle and begin to change shape. Within a few moments, they've become long and feline. Thanks to the new fuzzy organs, you find yourself able to hear things that eluded your notice up until now. <b>You now have cat ears.</b>");
	}
	player.ears.type = Ears.CAT;
	doNext(accessPage1EarsMenu);
}
private function metamorphRedPandaTail():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\n");
	if (player.tailCount > 1) {
		outputText("Your tails seem to move on their own, tangling together in a single mass. Before you can ever feel it happening, you realize that they’re merging! An increased sensation of heat, not unlike the flavor of the roots, rushes through your body, and once that it fades, you realize that you now have a single tail.");
		outputText("\n\nThe process doesn’t stop here though, as the feel of that spicy root returns, but now the heat is felt only in your tail, as it shakes wildly while it elongates and becomes more bushy. Soon it has become almost as long as you. A very thick mass of soft, fluffy furs covers it in a matter of seconds. It acquires a lovely ringed pattern of red-russet and copperish-orange.");
		outputText("\n\nWhen the effects finally subside, you decide to test the tail, making it coil around your body, realizing soon that you can control its movements with ease, and that its fur feels wonderful to the touch. Anyways, <b>you now have a long, bushy, red-panda tail!</b>");
	}
	else if (player.tailType == Tail.NONE) {
		outputText("Feeling an uncomfortable sensation on your butt, you stretch yourself, attributing it to having sat on a rough surface. A burning sensation runs through your body, similar to the one that you had after eating the root. When it migrates to your back, your attention goes to a mass of fluff that has erupted from your backside. Before you can check it properly, it seems to move on its own, following the heated sensation that now pulsates through your body, and when the heated pulses seem to have stopped, it has become a long, fluffy tube");
		outputText("\n\nShortly after, the feel of that spicy root returns, but now the heat is felt only in your tail, which shakes wildly while it elongates and becomes more bushy. Soon it has become almost as long as you. A very thick mass of soft, fluffy furs covers it in a matter of seconds. It acquires a lovely ringed pattern of red-russet and copperish-orange.");
		outputText("\n\nWhen the effects finally subside, you decide to test the tail, making it coil around your body, realizing soon that you can control its movements with ease, and that its fur feels wonderful at the touch. Anyways, <b>you now have a long, bushy, red-panda tail!</b>");
	}
	else if (player.tailType == Tail.BEE_ABDOMEN || player.tailType == Tail.SPIDER_ADBOMEN || player.tailType == Tail.MANTIS_ABDOMEN) {
		outputText("Your insectile backside seems affected by the root properties, as your venom production suddenly stops. The flesh within the abdomen retracts into your backside, the chiting covering falling, leaving exposed a layer of soft, bare skin. When the abdomen disappears, your left with a comically sized butt, that soon reverts to its usual size.");
		outputText("\n\nThe root keeps doing its thing, as you feel an uncomfortable sensation on your butt. A burning sensation runs through your body, similar to the one that you had after eating the root. When it migrates to your back, your attention goes to a mass of fluff that has erupted from your backside. Before you can check it properly, it seems to move on its own, following the heated sensation that now pulsates through your body, and when the heated pulses seem to have stopped, it has become a long, fluffy tube, quite different from your former abdomen.");
		outputText("\n\nShortly after, the feel of that spicy root returns, but now the heat is felt only in your tail, which shakes wildly while it elongates and becomes more bushy. Soon it has become almost as long as you. A very thick mass of soft, fluffy furs covers it in a matter of seconds. It acquires a lovely ringed pattern of red-russet and copperish-orange.");
		outputText("\n\nWhen the effects finally subside, you decide to test the tail, making it coil around your body, realizing soon that you can control its movements with ease, and that its fur feels wonderful at the touch. Anyways, <b>you now have a long, bushy, red-panda tail!</b>");
	}
	else {
		outputText("The feel of that spicy root returns, but now the heat is felt on your tail, that shakes wildly while it elongates and becomes more bushy. Soon it has become almost as long as you. A very thick mass of soft, fluffy furs covers it in a matter of seconds. It acquires a lovely ringed pattern of red-russet and copperish-orange.");
		outputText("\n\nWhen the effects finally subside, you decide to test the tail, making it coil around your body, realizing soon that you can control their moves with easy, and that its fur feels wonderful at the touch. Anyways, <b>you now have a long, bushy, red-panda tail!</b>");
	}
	player.tailType = Tail.RED_PANDA;
	doNext(accessPage4TailMenu);
}
private function metamorphRedPandaArms():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nWeakness overcomes your arms, and no matter what you do, you can’t muster the strength to raise or move them. Sighing you attribute this to the consumption of that strange root. Sitting on the ground, you wait for the limpness to end. As you do so, you realize that the bones at your hands are changing, as well as the muscles on your arms. They’re soon covered, from the shoulders to the tip of your digits, on a layer of soft, fluffy black-brown fur. Your hands gain pink, padded paws where your palms were once, and your nails become short claws, not sharp enough to tear flesh, but nimble enough to make climbing and exploring much easier. <b>Your arms have become like those of a red-panda!</b>");
	player.arms.type = Arms.RED_PANDA;
	doNext(accessPage2ArmsMenu);
}
private function metamorphRedPandaEars():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nA sudden dizziness seems to overcome your head. Your ears tingle, and you’re sure you can feel the flesh on them shifting, as you gradually have trouble hearing. A couple of minutes later the feeling stops. Curious of what has changed you go to check yourself on the stream, only to find that they’ve changed into cute, triangular ears, covered with white fur. <b>You’ve got red-panda ears!</b>");
	player.ears.type = Ears.RED_PANDA;
	doNext(accessPage3EarsMenu);
}
private function metamorphNightmareWings():void {
	clearOutput();
	player.soulforce -= 200;
	if (player.wings.type != Wings.NONE) removeOldWings();
	outputText("\n\nPain lances through your back, the muscles knotting oddly and pressing up to bulge your [skin.type]. It hurts, oh gods does it hurt, but you can't get a good angle to feel at the source of your agony. A loud crack splits the air, and then your body is forcing a pair of narrow limbs through a gap in your [armor]. Blood pumps through the new appendages, easing the pain as they fill out and grow. Tentatively, you find yourself flexing muscles you didn't know you had, and <b>you're able to curve the new growths far enough around to behold your brand new, white wings.</b>");
	player.wings.type = Wings.NIGHTMARE;
	player.wings.desc = "large black leathery";
	doNext(accessPage2WingsMenu);
}
private function metamorphBicornHorns():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.horns.type == Horns.NONE) outputText("\n\nWith painful pressure, the skin on your forehead splits around two tiny nub-like horn, a little bit similar to that you would see on the cattle back in your homeland.");
	else outputText("\n\nYour horns vibrate and shift as if made of clay, reforming into horns with a bicorn-like shape.");
	player.horns.count = 2;
	player.horns.type = Horns.BICORN;
	doNext(accessPage2HornsMenu);
}
private function metamorphAlicornWings():void {
	clearOutput();
	player.soulforce -= 200;
	if (player.wings.type != Wings.NONE) removeOldWings();
	outputText("\n\nPain lances through your back, the muscles knotting oddly and pressing up to bulge your [skin.type]. It hurts, oh gods does it hurt, but you can't get a good angle to feel at the source of your agony. A loud crack splits the air, and then your body is forcing a pair of narrow limbs through a gap in your [armor]. Blood pumps through the new appendages, easing the pain as they fill out and grow. Tentatively, you find yourself flexing muscles you didn't know you had, and <b>you're able to curve the new growths far enough around to behold your brand new, white wings.</b>");
	player.wings.type = Wings.FEATHERED_ALICORN;
	player.wings.desc = "large white feathered";
	doNext(accessPage2WingsMenu);
}
private function metamorphUnicornHorn():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.horns.type == Horns.NONE) outputText("\n\nWith painful pressure, the skin on your forehead splits around tiny nub-like horn, a little bit similar to that you would see on the cattle back in your homeland.");
	else outputText("\n\nYour horns vibrate and shift as if made of clay, reforming into horn with a unicorn-like shape.");
	player.horns.count = 2;
	player.horns.type = Horns.UNICORN;
	doNext(accessPage1HornsMenu);
}
private function metamorphHorseTail():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.tailType == 0) outputText("\n\nThere is a sudden tickling on your ass, and you notice you have sprouted a long shiny horsetail of the same [haircolor] color as your hair.");
	if (player.tailType > Tail.HORSE && player.tailType <= Tail.COW) outputText("\n\nPain lances up your " + Appearance.assholeDescript(player) + " as your tail shifts and morphs disgustingly. With one last wave of pain, it splits into hundreds of tiny filaments, transforming into a horsetail.");
	if ((player.tailType > Tail.COW && player.tailType < Tail.SHARK) || player.tailType == Tail.SCORPION || player.tailType == Tail.MANTIS_ABDOMEN) outputText("\n\nYour insect-like abdomen bunches up as it begins shrinking, exoskeleton flaking off like a snake sheds its skin. It bunches up until it is as small as a tennis ball, then explodes outwards, growing into an animalistic tail shape. Moments later, it explodes into filaments of pain, dividing into hundreds of strands and turning into a shiny horsetail.");
	if (player.tailType >= Tail.SHARK) outputText("\n\nPain lances up your " + player.assholeDescript() + " as your tail shifts and morphs disgustingly. With one last wave of pain, it splits into hundreds of tiny filaments, transforming into a horsetail.");
	outputText(" <b>You now have a horse-tail.</b>");
	player.tailType = Tail.HORSE;
	doNext(accessPage1TailMenu);
}
private function metamorphHorseEars():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.ears.type == Ears.HUMAN) outputText("\n\nYour ears tug painfully on your face as they begin shifting, moving upwards to the top of your head and transforming into a upright animalistic ears. ");
	if (player.ears.type == Ears.DOG) outputText("\n\nYour ears change shape, morphing into from their doglike shape into equine-like ears! ");
	else outputText("\n\nYour ears change shape, morphing into teardrop-shaped horse ears! ");
	outputText("<b>You now have horse ears.</b>");
	player.ears.type = Ears.HORSE;
	doNext(accessPage1EarsMenu);
}
private function metamorphOrcSkinPattern():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nYou double over suddenly as a harsh, stabbing pain runs across your skin, tattoos in the shape of scars forming on various parts of your body. Considering how you look now, you might as well proudly display your <b>Orc scar tattooed skin.</b>");
	player.skin.base.pattern = Skin.PATTERN_SCAR_SHAPED_TATTOO;
	player.skin.base.adj = "scar shaped tattooed";
	doNext(accessSkinPatternsMenuOld);
}
private function metamorphOrcArms():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.arms.type != Arms.HUMAN) restoreHumanArms();
	outputText("\n\nThe skin on your arms feels as if they’re being cut open as a whole new set of intricate scar-like tattoos covers them. Furthermore your nails become increasingly pointed just like a set of claws and your arms in general grow a bit longer. Well, it seems you’re going to have some issues hiding your <b>scar tattooed arms and sharp nails.</b>");
	player.arms.type = Arms.ORC;
	doNext(accessPage3ArmsMenu);
}
private function metamorphHumanNoRearBody():void {
	clearOutput();
	player.soulforce -= 500;
	outputText("\n\nA wave of tightness spreads through your back, and it feels as if someone is stabbing a dagger in it. After a moment the pain passes, though your back is back to what you looked like when you entered this realm!");
	player.rearBody.type = RearBody.NONE;
	doNext(accessRearBodyMenuOld);
}
private function metamorphHumanNoTail():void {
	clearOutput();
	player.soulforce -= 500;
	outputText("\n\nYou feel something shifting in your backside. Then something detaches from your backside and it falls onto the ground. <b>You no longer have a tail!</b>");
	player.tailType = Tail.NONE;
	player.tailCount = 0;
	player.tailVenom = 0;
	player.tailRecharge = 5;
	doNext(accessPage1TailMenu);
}
private function metamorphHumanNoWings():void {
	clearOutput();
	player.soulforce -= 500;
	outputText("\n\nA wave of tightness spreads through your back, and it feels as if someone is stabbing a dagger into each of your shoulder-blades. After a moment the pain passes, though your wings are gone!");
	player.wings.type = Wings.NONE;
	player.wings.desc = "non-existant";
	doNext(accessPage1WingsMenu);
}
private function metamorphHumanNoHorns():void {
	clearOutput();
	player.soulforce -= 500;
	if (player.horns.type == Horns.ORCHID) outputText("\n\nYour orchid flowers crumble, falling apart");
	else outputText("\n\nYour horns crumble, falling apart in large chunks");
	outputText(" until they flake away to nothing.");
	player.horns.count = 0;
	player.horns.type = Horns.NONE;
	doNext(accessPage1HornsMenu);
}
private function metamorphHumanNoAntennae():void {
	clearOutput();
	player.soulforce -= 500;
	outputText("\n\nThe muscles in your brow clench tightly, and you feel a tremendous pressure on your upper forehead. When it passes, you touch yourself and discover your antennae.type have vanished!");
	player.antennae.type = Antennae.NONE;
	doNext(accessAntennaeMenuOld);
}
private function metamorphHumanNoGills():void {
	clearOutput();
	player.soulforce -= 500;
	if (player.gills.type == Gills.ANEMONE) outputText("\n\nYour chest itches, and as you reach up to scratch it, you realize your gills have withdrawn into your skin.");
	if (player.gills.type == Gills.FISH) outputText("\n\nYou feel your gills tighten, the slits seeming to close all at once. As you let out a choked gasp your gills shrink into nothingness, leaving only smooth skin behind. Seems you won't be able to stay in the water quite so long anymore.");
	outputText(" <b>You no longer have gills!</b>");
	player.gills.type = Gills.NONE;
	doNext(accessGillsMenuOld);
}
private function metamorphHumanEars():void {
	clearOutput();
	player.soulforce -= 500;
	outputText("\n\nOuch, your head aches! It feels like your ears are being yanked out of your head, and when you reach up to hold your aching noggin, you find they've vanished! Swooning and wobbling with little sense of balance, you nearly fall a half-dozen times before <b>a pair of normal, human ears sprout from the sides of your head.</b> You had almost forgotten what human ears felt like!");
	player.ears.type = Ears.HUMAN;
	doNext(accessPage1EarsMenu);
}

private function metamorphHumanArms():void {
	clearOutput();
	player.soulforce -= 500;
	restoreHumanArms();
	doNext(accessPage1ArmsMenu);
}
private function metamorphHumanNoSkinPatterns():void {
	clearOutput();
	player.soulforce -= 500;
	outputText("\n\nYour skin patterns itches incessantly, and as you scratch they shifts and changes, becoming less and less visible till they gone. <b>Your skin is without any skin patterns!</b>");
	player.skin.base.pattern = Skin.PATTERN_NONE;
	player.skin.base.adj = "";
	doNext(accessSkinPatternsMenuOld);
}
private function metamorphHumanSkin():void {
	clearOutput();
	player.soulforce -= 500;
	switch (player.coatType()) {
		case Skin.FUR:
			outputText("\n\nYour fur itches incessantly, so you start scratching it. It starts coming off in big clumps before the whole mess begins sloughing off your body. In seconds, your skin is nude. <b>You've lost your fur!</b>");
			break;
		case Skin.SCALES:
			outputText("\n\nYour scales itch incessantly, so you scratch at them. They start falling off wholesale, leaving you standing in a pile of scales after only a few moments. <b>You've lost your scales!</b>");
			break;
		case Skin.DRAGON_SCALES:
			outputText("\n\nYour dragon scales itch incessantly, so you scratch at them. They start falling off wholesale, leaving you standing in a pile of scales after only a few moments. <b>You've lost your dragon scales!</b>");
			break;
		default:
			outputText("\n\nYour [skin noadj] itches incessantly, and as you scratch it shifts and changes, becoming normal human-like skin. <b>Your skin is once again normal!</b>");
	}
	player.skin.setBaseOnly({type: Skin.PLAIN, adj:""});
	doNext(accessSkinMenuOld);
}
private function metamorphBoarArms():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.arms.type != Arms.HUMAN) restoreHumanArms();
	outputText("\n\nYour arms and hands start covering in fur at an alarming rate suddenly as you poke at your palms you jolt up as they become extremely sensitive. Furthermore your nails become increasingly pointed turning black just like a set of claws. <b>You now have boar arms.</b>");
	player.arms.type = Arms.BOAR;
	doNext(accessPage3ArmsMenu);
}
private function metamorphPigArms():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.arms.type != Arms.HUMAN) restoreHumanArms();
	outputText("\n\nYour finguers starts to feel like some bee stung them as they inflates to a more chubby size your nails tickening and darkening turning into clover-like claws. Aside of your now fat finguers and darker claws your arms remains about the same. <b>You now have pig arms.</b>");
	player.arms.type = Arms.PIG;
	doNext(accessPage3ArmsMenu);
}
private function metamorphPigTail():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.tailType == Tail.NONE) outputText("\n\nYou feel a tug at the base of your spine as it lengthens ever so slightly. Looking over your shoulder, <b>you find that you have sprouted a small, curly pig tail.</b>");
	else outputText("\n\nYou feel a pinching sensation in your [tail] as it begins to warp in change. When the sensation dissipates, <b>you are left with a small, curly pig tail.</b>");
	player.tailType = Tail.PIG;
	doNext(accessPage3TailMenu);
}
private function metamorphPigEars():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nYou feel a pressure on your ears as they begin to reshape. Once the changes finish, you flick them about experimentally, <b>and you’re left with pointed, floppy pig ears.</b>");
	player.ears.type = Ears.PIG;
	doNext(accessPage2EarsMenu);
}
private function metamorphVampireWings():void {
	clearOutput();
	player.soulforce -= 100;
	// if (player.wings.type == Wings.BAT_ARM) {
	// 	outputText("\n\nYou cry out as your arms creak and twist, your bones breaking down and reforming in a frenzy. Your parchment-like skin begins to fall off in clumps, leaving the mess of malformed bones that are your arms right now naked for all to see. However, even as you watch, dark blood creeps over the bone, properly aligning them before healing them over, although not in their old form. Within seconds, the pain is gone, as your bones are remade into ones alike those you were born with, in structure if nothing else, the eldritch power of your blood finally ebbing away, but not before the last of it settles and turns into a brand new patch of skin. It's still sensitive, but you'll get used to it. ");
	// 	outputText("You catch something moving on the edge of your peripheral vision, causing your hard-won instincts to kick in, muscle memory forcing you into a lunge away from whatever it was before you’re even fully aware of what’s happening. Instead of dodging with your usual grace, you stumble and roll, landing on your wings... Wait, <i>wings??</i> It seems that, while you were fascinated by your bloody shenanigans, you failed to notice that you were growing wings. Understandable, since your arms breaking themselves several times over tends to take priority over such things, attention-wise. You shakily stand up, your balance still thrown off by the new limb, inwardly grumbling at how long is it going to take you to get used to them. ");
	// 	outputText("Distracted as you are, both from the ordeal and your inner grumbling, your first attempt at walking inevitably ends with an intimate reunion of your face and the ground. This time, you don’t bother to keep your cursing to the confines of your own mind. <b>You will now be able to enjoy nightly flights with your brand new vampire wings.</b>");
	// }
	// else {
	// 	outputText("\n\nA terrible pain flares in the center of your back, a pain so intense that you black out briefly, coming back to your senses as you hit your head against the ground. You hear a horrifying ripping noise as your back stretches and tears to allow new bones to expand, black as tar and far lighter than most of the bones in your body. These new bones shift under your shoulder blade skin as you fall on all groaning in pain and clawing at the ground. In a flash of pain they violently break out of your skin sending blood everywhere as you make a chilling scream your wounds slowly closing on their own. Still panting from the pain, you take a look at your new appendage. It's a pair of large vampire wings of impressive size. ");
	// 	outputText("Feeling chilly you fold them back on your body and you ought to admit they indeed look like a large cape. <b>You will be able to enjoy nightly flight using your brand new vampire wings.</b>");
	// }
	outputText("\n\nA terrible pain flares in the center of your back, a pain so intense that you black out briefly, coming back to your senses as you hit your head against the ground. You hear a horrifying ripping noise as your back stretches and tears to allow new bones to expand, black as tar and far lighter than most of the bones in your body. These new bones shift under your shoulder blade skin as you fall on all groaning in pain and clawing at the ground. In a flash of pain they violently break out of your skin sending blood everywhere as you make a chilling scream your wounds slowly closing on their own. Still panting from the pain, you take a look at your new appendage. It's a pair of large vampire wings of impressive size. ");
	outputText("Feeling chilly you fold them back on your body and you ought to admit they indeed look like a large cape. <b>You will be able to enjoy nightly flight using your brand new vampire wings.</b>");

	player.wings.type = Wings.VAMPIRE;
	player.wings.desc = "large bat";
	doNext(accessPage2WingsMenu);
}
private function metamorphVampireEars():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\n");
	if (player.ears.type != Ears.HUMAN) outputText("Your ears revert back to their old human shape you had almost forgotten what humans ears felt like, before you can dwell on the implications of that, the changes continue. ");
	outputText("Your ears begin to prickle as they elongate to a point, being now reminiscent of those of elves, goblins, or in your case, vampires. Aside from looking cute, you find your new ears have drastically improved your hearing. <b>Sound has become an entirely new experience now that you have pointy vampire ears!</b>");
	player.ears.type = Ears.VAMPIRE;
	doNext(accessPage3EarsMenu);
}
private function metamorphBatCollar():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nAn intense itching sets in around your neck. Bringing your hands to your neck to scratch it, you find sparse, downy fuzz. As you scratch away, it continues lengthening and growing in density until you have a collar of fur around your neck.");
	outputText(" Well, this isn’t so bad, the scarf-like look is certainly nice, at the very least. <b>Your neck now sports a collar of fur.</b>");
	player.rearBody.type = RearBody.BAT_COLLAR;
	doNext(accessRearBodyMenuOld);
}
private function metamorphBatWings():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.arms.type != Arms.HUMAN) restoreHumanArms();
	outputText("\n\nLarge bones surge out of your wrists and elbows. You can feel your bones shifting and grinding all over your body as your skeletal structure begins changing into one more fit for a flyincreature, with light, hollow bones. You collapse to the ground as they begin shifting proportions, becoming thinner and longer to maximize area while reducing their density. Leathery flesh begins to cover your new bony protrusions, spreading between each of them like creeping moss. Eventually, the skin stops growing and you admire your new arms. They are very obviously winged bat arms. You close them around your waist, and like this they could easily be mistaken for a large cape when seen from afar. <b>You now have large winged bat arms.</b>");
	player.arms.type = Arms.BAT;
	doNext(accessPage2WingsMenu);
}
private function metamorphBatEars():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nYour ears begin to prickle and burn as the skin tears and stretches, changing into wide, deep ears, perfect for catching any stray sound. Which becomes apparent when your hearing becomes far more clear than it has ever been. <b>Sound has become an entirely new experience now that you have bat ears!</b>");
	player.ears.type = Ears.BAT;
	doNext(accessPage2EarsMenu);
}
private function metamorphRaijuThunderousAura():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nYou've become so charged in electricity that your movements are sometimes accompanied by the sound of static. <b>It's going to be difficult to hide your presence with that thunderous aura of yours.</b>");
	player.wings.type = Wings.THUNDEROUS_AURA;
	player.wings.desc = "thunderous aura";
	doNext((accessPage3WingsMenu));
}
private function metamorphRaijuArms2():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.arms.type != Arms.HUMAN) restoreHumanArms();
	outputText("\n\nYou shiver in delight as fur begins to form on your forearms, high voltage running along from your shoulders to your fingertips. Before you know it your hands turned to paws and your sharp nails to vicious looking claws coated with electricity. You can't wait to wrap those around a juicy cock or dip them into a waiting snatch.");
	player.arms.type = Arms.RAIJU_2;
	doNext(accessPage3ArmsMenu);
}
private function metamorphRaijuSkinPattern():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nYou suddenly feel a rush of electricity on your skin as glowing tattoos in the shape of lightning bolts form in various place across your body. Well, how shocking. <b>Your skin is now inscribed with some lightning shaped tattoos.</b>");
	player.skin.base.pattern = Skin.PATTERN_LIGHTNING_SHAPED_TATTOO;
	player.skin.base.adj = "lightning shaped tattooed";
	doNext(accessSkinPatternsMenuOld);
}
private function metamorphRaijuEars():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.ears.type != Ears.HUMAN) restoreHumanEars();
	outputText("\n\nYour ears twitch as jolt of lightning flows through them, replacing all sound with crackling pops. You moan as the lightning arcs up to the top of your head before fanning out to the side. Hearing suddenly returns as you run your hands across your <b>new weasel ears!</b>");
	player.ears.type = Ears.WEASEL;
	doNext(accessPage2EarsMenu);
}
private function metamorphRaijuMane():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nThe base of your neck tingles with delight as little sparks travel across your skin. Strands of hair quickly grow in, giving you a [haircolor] collar of fur around your neck. Several strands of your new fur collar are quite dark, arcing around it like lightning.");
	player.rearBody.type = RearBody.RAIJU_MANE;
	doNext(accessRearBodyMenuOld);
}
private function metamorphRaijuTail():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.tailType == Tail.NONE) outputText("\n\nYou yelp as a huge lightning bolt bursts out the area just above your ass. You watch in amazement as it twist and curls, slowly becoming thicker and thicker before it fizzles out, <b>leaving you with a silky Raiju tail!</b>");
	else outputText("\n\nYou nearly jump out of your skin as your tail burst into a huge lightning bolt. You watch as it curls and twist around before it fizzles out. <b>You now have a silky Raiju tail!</b>");
	player.tailType = Tail.RAIJU;
	doNext(accessPage4TailMenu);
}
private function metamorphRaijuArms():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.arms.type != Arms.HUMAN) restoreHumanArms();
	outputText("\n\nYour nails tingle as they elongate into white claws! They look quite dangerous, but you feel the strange need to use them to stimulate your ");
	if (player.gender == 1 || player.gender == 3) outputText("[cock]");
	if (player.gender == 3) outputText(" and ");
	if (player.gender > 1) outputText("[clit]");
	outputText(". ");
	if (player.cor >= 50) outputText("You give a lusty smile, thinking that it wouldn't be so bad...");
	else outputText("You scowl, shaking away the impure thoughts.");
	player.arms.type = Arms.RAIJU;
	doNext(accessPage2ArmsMenu);
}
private function metamorphOniSkinPattern():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nAs you thought your skin couldn't handle more tattoo a few localised skin burns reveal a new set of drawing along your skin, some decorating your chest. Well you might as well proudly display your <b>Oni tattooed skin.</b>");
	player.skin.base.pattern = Skin.PATTERN_BATTLE_TATTOO;
	player.skin.base.adj = "battle tattooed";
	doNext(accessSkinPatternsMenuOld);
}
private function metamorphOniEars():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nYour ears tingle slightly as their shape sharpen to a point not unlike those of some kind of demonic fiend. Still you know all too well those are <b>Oni ears.</b>");
	player.ears.type = Ears.ONI;
	doNext(accessPage2EarsMenu);
}
private function metamorphOniDualHorns():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.horns.type == Horns.NONE) outputText("You moan in pleasure as a pair of bony horns push forward out of your forehead,");
	else outputText("You begin to feel an odd itching sensation as you feel your horns repositioning,");
	outputText(" the things are actually surprisingly sensitive and you reach orgasm just from them reaching full size,");
	if (player.gender == 1 || player.gender == 3) outputText(" your [cock] splatering cum on the ground");
	if (player.gender == 3) outputText(" and");
	if (player.gender == 2 || player.gender == 3) outputText(" your pussy gushing with a copious amount of juice");
	outputText(". You would rather your opponent not know you have a G spot at the tip of your forehead and so you keep this information to yourself. <b>You now have a pair of horns just like an oni.</b>");
	player.horns.count = 1;
	player.horns.type = Horns.ONI_X2;
	doNext(accessPage1HornsMenu);
}
private function metamorphOniSingleHorn():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.horns.type == Horns.NONE) outputText("You moan in pleasure as a single bony horns push forward out of your forehead,");
	else outputText("You begin to feel an odd itching sensation as you feel your horns repositioning and merging into one,");
	outputText(" the thing is actually surprisingly sensitive and you reach orgasm just from it reaching full size,");
	if (player.gender == 1 || player.gender == 3) outputText(" your [cock] splatering cum on the ground");
	if (player.gender == 3) outputText(" and");
	if (player.gender == 2 || player.gender == 3) outputText(" your pussy gushing with a copious amount of juice");
	outputText(". You would rather your opponent not know you have a G spot at the tip of your forehead and so you keep this information to yourself. <b>You now have a horns just like an oni.</b>");
	player.horns.count = 1;
	player.horns.type = Horns.ONI;
	doNext(accessPage1HornsMenu);
}
private function metamorphOniArms():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\n");
	if (player.arms.type != Arms.HUMAN) outputText("You watch, spellbound, while your arms gradually changing it entire outer structure into plain human-like form. ");
	outputText("The skin on your arms feels like it’s burning as a whole set of intricate warlike tattoos covers them. Furthermore your nails become increasingly pointed turning black just like a set of claws. Well it seems you will have issues hiding your <b>war tattooed arms with sharp nails.</b>");
	player.arms.type = Arms.ONI;
	doNext(accessPage2ArmsMenu);
}

private function metamorphElfEars():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.ears.type != Ears.HUMAN) restoreHumanEars();
	outputText("\n\nSounds become increasingly audible as a weird tingling runs through your scalp and your [hair] shifts slightly. You reach up to touch and bump <b>your new pointed elven ears.</b> The points are quite sensitive and you will have to get used to your new enhanced hearing ability.");
	player.ears.type = Ears.ELVEN;
	doNext(accessPage2EarsMenu);
}
private function metamorphElfArms():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.arms.type != Arms.HUMAN) restoreHumanArms();
	outputText("\n\nSomething in your hands shift as they change taking on a more feminine fragile yet agile structure. You discover with surprise your dexterity has greatly increased allowing you to manipulate things in your delicate elven fingers with almost unreal precision. However your grip has become weaker as a result, weakening your ability to use raw force over finesse. <b>You now have delicate elven hands.</b>");
	player.arms.type = Arms.ELF;
	doNext(accessPage2ArmsMenu);
}
private function metamorphMantisWingsLarge():void {
	clearOutput();
	player.soulforce -= 200;
	outputText("\n\nYour wings tingle as they grow, filling out covering your back abdomen until they are large enough to lift you from the ground and allow you to fly! You give a few experimental flaps and begin hovering in place, a giddy smile plastered on your face by the thrill of flight. <b>You now have large Mantis wings!</b>");
	player.wings.type = Wings.MANTIS_LIKE_LARGE;
	player.wings.desc = "large mantis-like";
	doNext(accessPage2WingsMenu);
}
private function metamorphMantisWingsSmall():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.wings.type != Wings.NONE) removeOldWings();
	outputText("\n\nYou feel an itching between your shoulder-blades as something begins growing there. You twist and contort yourself, trying to scratch and bring yourself relief, and failing miserably. A sense of relief erupts from you as you feel something new grow out from your body.");
	outputText("\nYou hastily remove the top portion of your [armor] and marvel as a pair of small Insectile wings sprout from your back. Tenderly flexing your new muscles, you find you can flap them quite fast. Unfortunately you can’t seem to flap your little wings fast enough to fly, but they would certainly slow a fall. A few quick modifications to your [armor] later and you are ready to continue your journey with <b>your new mantis wings</b>.");
	player.wings.type = Wings.MANTIS_LIKE_SMALL;
	player.wings.desc = "small mantis-like";
	doNext(accessPage2WingsMenu);
}
private function metamorphMantisTail():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nPainful swelling just above your firm backside doubles you over.");
	outputText("\nIt gets worse and worse as the swollen lump begins to protrude from your backside, swelling and elongating with a series of pops until you have a bulbous abdomen hanging just above your butt.");
	outputText("\nThe whole thing is covered in a hard greenish chitinous material, and large enough to be impossible to hide. <b>You have a Mantis abdomen.</b>");
	player.tailType = Tail.MANTIS_ABDOMEN;
	doNext(accessPage4TailMenu);
}
private function metamorphMantisArms():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nYou watch, spellbound, while your forearms gradually become shiny. The entire outer structure of your arms tingles while it divides into segments, turning the [skin.type] into a shiny green carapace.");
	outputText("\nA moment later the pain fades and you are able to turn your gaze down to your beautiful new arms, covered in shining green chitin from the upper arm down.");
	outputText("\nThe transformation end as down the lenght of your forearms you grow a pair of massive scythe like appendage just like a mantis.");
	outputText("\nYou nonchalantly run them across a young tree slicing the plant trunk in half. This might prove a deadly weapon if used as part of your unarmed strikes. <b>You now have mantis arms.</b>");
	player.arms.type = Arms.MANTIS;
	doNext(accessPage1ArmsMenu);
}
private function metamorphMantisAntennae():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.antennae.type == Antennae.BEE) outputText("\n\nYour head itches momentarily as your two floppy antennae changes slowly into long prehensile ones similar to those seen at mantis.");
	else outputText("\n\nYour head itches momentarily as two long prehensile antennae sprout from your [hair].");
	player.antennae.type = Antennae.MANTIS;
	doNext(accessAntennaeMenuOld);
}
private function metamorphDevilArms():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nYour hands shapeshift as they cover in fur and morph into the clawed hands of some unknown beast. They retain their dexterity despite their weird shape and paw pads. At least this won't hinder spellcasting. <b>You now have bestial clawed hands!</b>");
	player.arms.type = Arms.DEVIL;
	doNext(accessPage2ArmsMenu);
}
private function metamorphGoatEars():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nYour ears elongate and flatten on your head. You flap them a little and discover they have turned into something similar to the ears of a goat. <b>You now have goat ears!</b>");
	player.ears.type = Ears.GOAT;
	doNext(accessPage2EarsMenu);
}
private function metamorphGoatHorns():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.horns.type == Horns.NONE) outputText("You begin to feel a prickling sensation at the top of your head. Reaching up to inspect it, you find a pair of hard stubs. <b>You now have a pair of goat horns.</b>");
	else outputText("You begin to feel an odd itching sensation as you feel your horns repositioning. Once it's over, you reach up and find a pair of hard stubs. <b>You now have a pair of goat horns.</b>");
	player.horns.count = 1;
	player.horns.type = Horns.GOAT;
	doNext(accessPage1HornsMenu);
}
private function metamorphGoatTail():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("You feel an odd itchy sensation just above your [ass]. Twisting around to inspect it you find a short stubby tail that wags when you're happy. <b>You now have a goat tail.</b>");
	player.tailType = Tail.GOAT;
	doNext(accessPage3TailMenu);
}
private function metamorphCowMinotaurHorns():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.horns.type == Horns.COW_MINOTAUR || player.horns.type == Horns.NONE) {
		if (player.horns.type == Horns.COW_MINOTAUR) {
			if (player.horns.count < 5) {
				outputText("\n\nYour small horns get a bit bigger, stopping as medium sized nubs.");
				player.horns.count += 1 + rand(2);
			}
		}
		if (player.horns.type == Horns.NONE || player.horns.count == 0) {
			outputText("\n\nWith painful pressure, the skin on your forehead splits around two tiny nub-like horns, similar to those you would see on the cattle back in your homeland.");
			player.horns.count = 1;
			player.horns.type = Horns.COW_MINOTAUR;
		}
		if (player.horns.type != Horns.NONE && player.horns.type != Horns.COW_MINOTAUR && player.horns.type != Horns.ORCHID && player.horns.count > 0) {
			outputText("\n\nYour horns twist, filling your skull with agonizing pain for a moment as they transform into cow-horns.");
			player.horns.type = Horns.COW_MINOTAUR;
		}
	}
	if ((player.horns.type == Horns.DEMON || player.horns.type > Horns.COW_MINOTAUR) && player.horns.type != Horns.ORCHID) {
		outputText("\n\nYour horns vibrate and shift as if made of clay, reforming into two small bovine nubs.");
		player.horns.count = 2;
		player.horns.type = Horns.COW_MINOTAUR;
	}
	doNext(accessPage1HornsMenu);
}
private function metamorphCowEars():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nYou feel your ears tug on your scalp as they twist shape, becoming oblong and cow-like. <b>You now have cow ears.</b>");
	player.ears.type = Ears.COW;
	doNext(accessPage1EarsMenu);
}
private function metamorphCowTail():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.tailType == Tail.NONE) outputText("\n\nYou feel the flesh above your [butt] knotting and growing. It twists and writhes around itself before flopping straight down, now shaped into a distinctly bovine form. You have a <b>cow tail</b>.");
	else {
		if (player.tailType < Tail.SPIDER_ADBOMEN || player.tailType > Tail.BEE_ABDOMEN) {
			outputText("\n\nYour tail bunches uncomfortably, twisting and writhing around itself before flopping straight down, now shaped into a distinctly bovine form. You have a <b>cow tail</b>.");
		}
		//insect
		if (player.tailType == Tail.SPIDER_ADBOMEN || player.tailType == Tail.BEE_ABDOMEN || player.tailType == Tail.SCORPION || player.tailType == Tail.MANTIS_ABDOMEN) {
			outputText("\n\nYour insect-like abdomen tingles pleasantly as it begins shrinking and softening, chitin morphing and reshaping until it looks exactly like a <b>cow tail</b>.");
		}
	}
	player.tailType = Tail.COW;
	doNext(accessPage1TailMenu);
}
private function metamorphDragonTail():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.tailType == Tail.NONE) outputText("\n\nA sudden dull, throbbing pain in your [butt] forces your hands to it; you can feel an ominous lump over your tail bone, swelling bigger and bigger with every heartbeat. All of a sudden, it seems to explode, jutting out and around until it hovers near your ankles, the skin under your flesh hard and scaly. <b>You now have a dragon tail flicking at your back, flexible as a whip.</b>");
	else outputText("\n\nAn icy sensation fills your behind as your tail suddenly goes curiously numb. Twisting your head around, you watch as it melts and transforms into a reptilian appendage, long and flexible, its tip adorned with wicked spikes. <b>You now have a dragon tail.</b>");
	player.tailType = Tail.DRACONIC;
	doNext(accessPage2TailMenu);
}
private function metamorphDragonArms():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nYou scratch at your biceps absentmindedly, but no matter how much you scratch, it isn't getting rid of the itch. After ignoring the sensation for a while, you finally glance down in irritation, only to discover that your arms had changed from it's former appearance to that of a dragon, one with leathery scales and short claws replacing your fingernails. <b>You now have a dragon arms.</b>");
	player.arms.type = Arms.DRAGON;
	doNext(accessPage2ArmsMenu);
}

private function metamorphDragonWingsHuge():void {
	clearOutput();
	player.soulforce -= 300;
	outputText("\n\nA not-unpleasant tingling sensation again fills your wings, almost but not quite drowning out the odd, tickly feeling as they swell larger and stronger than before. You spread them wide - they stretch now more than twice further than your arms do - and beat them experimentally, the powerful thrusts sending gusts of wind, and lifting you off your feet effortlesly. <b>You now have fully-grown majestic dragon wings, capable of winging you through the air elegantly!</b>");
	player.wings.type = Wings.DRACONIC_HUGE;
	player.wings.desc = "large, majestic draconic";
	doNext(accessPage1WingsMenu);
}
private function metamorphDragonWingsLarge():void {
	clearOutput();
	player.soulforce -= 200;
	outputText("\n\nA not-unpleasant tingling sensation fills your wings, almost but not quite drowning out the odd, tickly feeling as they swell larger and stronger. You spread them wide - they stretch further than your arms do - and beat them experimentally, the powerful thrusts sending gusts of wind, and almost lifting you off your feet. <b>You now have fully-grown dragon wings, capable of winging you through the air elegantly!</b>");
	player.wings.type = Wings.DRACONIC_LARGE;
	player.wings.desc = "large, draconic";
	doNext(accessPage1WingsMenu);
}
private function metamorphDragonWingsSmall():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.wings.type == Wings.NONE) outputText("\n\nYou double over as waves of pain suddenly fill your shoulderblades; your back feels like it's swelling, flesh and muscles ballooning. A sudden sound of tearing brings with it relief and you straighten up. Upon your back now sit small, leathery wings, not unlike a bat's. <b>You now have small dragon wings. They're not big enough to fly with, but they look adorable.</b>");
	else outputText("\n\nA sensation of numbness suddenly fills your wings. When it dies away, they feel... different. Looking back, you realize that they have been replaced by new, small wings, ones that you can only describe as draconic. <b>Your wings have changed into dragon wings.</b>");
	player.wings.type = Wings.DRACONIC_SMALL;
	player.wings.desc = "small, draconic";
	doNext(accessPage1WingsMenu);
}
private function metamorphDragonEars():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nA prickling sensation suddenly fills your ears; unpleasant, but hardly painful. It grows and grows until you can't stand it any more, and reach up to scratch at them. To your surprise, you find them melting away like overheated candles. You panic as they fade into nothingness, leaving you momentarily deaf and dazed, stumbling around in confusion. Then, all of a sudden, hearing returns to you. Gratefully investigating, you find you now have a pair of reptilian ear-holes, one on either side of your head. A sudden pain strikes your temples, and you feel bony spikes bursting through the sides of your head, three on either side, which are quickly sheathed in folds of skin to resemble fins. With a little patience, you begin to adjust these fins just like ears to aid your hearing. <b>You now have dragon ears!</b>");
	player.ears.type = Ears.DRAGON;
	doNext(accessPage1EarsMenu);
}
private function metamorphSnakeEars():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nA weird tingling runs through your scalp as your [hair] shifts slightly. You reach up to touch and bump <b>your new pointed ears covered in small scales</b>. You bet they look cute!");
	player.ears.type = Ears.SNAKE;
	doNext(accessPage2EarsMenu);
}

private function metamorphOrcaBlowhole():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\n");
	if (player.rearBody.type > RearBody.NONE) outputText("Your wings fold into themselves, merging together with your back. ");
	outputText("Pain rushes just behind your shoulder blades as a hole opens up, air rushing in. The hole is burning making you groan in pain as air flows in and out. Eventually you get accustomed to breathing from your back like whales do, but it sure was a weird experience.");
	if (silly()) outputText(" Well it doesn't matter because now you can break the world record of the longest breath holding by sitting on the ocean floor for more than 90 minutes.");
	player.rearBody.type = RearBody.ORCA_BLOWHOLE;
	doNext(accessRearBodyMenuOld);
}
private function metamorphOrcaEars():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nYour ears suddenly begin to lengthen, growing bigger and bigger until their length reaches your shoulders. When you examine them you discover they have grown into a pair of large fins, easily twice as big as your head. <b>Orienting yourself underwater will be easy with your large orca fin ears.</b>");
	player.ears.type = Ears.ORCA;
	doNext(accessPage2EarsMenu);
}
private function metamorphOrcaTail():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nA large bump starts to grow out of your " + assDescript() + ", making you groan as your spine lengthens for this whole new appendage to form. You finally grow a tail black as midnight with a white underside and a smaller fin closer to your body, likely for hydrodynamism sake. You swing your tail a few times, battering the ground with it and smile as you rush to the stream to take a dip. ");
	outputText("With the help of your mighty tail you easily reach such a high swim speed you even manage to jump several meters out of the water, laughing with delight at the trill of this aquatic experience. <b>You're going to have a lot of fun swimming with your new Orca tail.</b>");
	player.tailType = Tail.ORCA;
	doNext(accessPage4TailMenu);
}
private function metamorphOrcaArms():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nYour fingers suddenly are forced together. When you stretch them back you discover they are now webbed, ready for swimming. You are still examining your hands when something not unlike a pair of fins grow out of your forearms. <b>You can only guess those Orca arms will help you to swim at high speeds!</b>");
	player.arms.type = Arms.ORCA;
	doNext(accessPage2ArmsMenu);
}
private function metamorphPhoenixWings():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nPain lances through your back, the muscles knotting oddly and pressing up to bulge your [skin.type]. It hurts, oh gods does it hurt, but you can't get a good angle to feel at the source of your agony. A loud crack splits the air, and then your body is forcing a pair of narrow limbs through a gap in your [armor]. Blood pumps through the new appendages, easing the pain as they fill out and grow. Tentatively, you find yourself flexing muscles you didn't know you had, and <b>you're able to curve the new growths far enough around to behold your brand new, crimson wings.</b>");
	player.wings.type = Wings.FEATHERED_PHOENIX;
	player.wings.desc = "large crimson feathered";
	doNext(accessPage2WingsMenu);
}
private function metamorphPhoenixArms():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nA crimson colored avian plumage starts to sprouts from your [skin.type], covering your forearms until <b>your arms look vaguely like wings</b>. Your hands remain unchanged thankfully. It'd be impossible to be a champion without hands! The feathery limbs might help you maneuver if you were to fly, but there's no way they'd support you alone.");
	player.arms.type = Arms.PHOENIX;
	doNext(accessPage1ArmsMenu);
}
private function metamorphSalamanderArms():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nYou scratch at your biceps absentmindedly, but no matter how much you scratch, it isn't getting rid of the itch. After ignoring the sensation for a while, you finally glance down in irritation, only to discover that your arms had changed from it's former appearance to that of a salamander, one with leathery, red scales and short claws replacing your fingernails. <b>You now have a salamander arms.</b>");
	player.arms.type = Arms.SALAMANDER;
	doNext(accessPage1ArmsMenu);
}
private function metamorphSalamanderTail():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.tailType == Tail.NONE) outputText("\n\nYou drop onto the ground as your spine twists and grows, forcing the flesh above your " + assDescript() + " to bulge out. New bones form, one after another, building a tapered, prehensile tail onto the back of your body. For a brief moment it tip ignite with a red-colored flame that with as little as your merely thought vanish moment later. Still you somehow know you can set ablaze any part or whole your tail at any moment and even use it to burn enemies after lashing them with your tail. <b>You now have a salamander tail!</b>");
	else outputText("\n\nYou drop to the ground as your tail twists and grows, changing its shape in order to gradually taper to a point. It flicks back and forth, prehensile and totally under your control. For a brief moment it tip ignite with a red-colored flame that with as little as your merely thought vanish moment later. Still you somehow know you can set ablaze any part or whole your tail at any moment and even use it to burn enemies after lashing them with your tail. <b>You now have a salamander tail.</b>");
	player.tailType = Tail.SALAMANDER;
	doNext(accessPage3TailMenu);
}
private function metamorphSharkFin():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nYou groan and slump down in pain, almost instantly regretting eating the tooth. You start sweating profusely and panting loudly, feeling the space between your shoulder blades shifting about. You hastily remove your [armor] just in time before a strange fin-like structure bursts from in-between your shoulders. You examine it carefully and make a few modifications to your [armor] to accommodate your new fin.");
	player.rearBody.type = RearBody.SHARK_FIN;
	doNext(accessRearBodyMenuOld);
}
private function metamorphSharkArms():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nYou watch, spellbound, while your arms gradually changing it entire outer structure into plain human-like form with exception places between your finger which starting show signs to growing webbing. Soon after you start sweating profusely and panting loudly, feeling the space near your elbows shifting about. You hastily remove your [armor] just in time before a strange fin-like structure bursts from your forearms. You examine them carefully and make a few modifications to your [armor] to accommodate your new fins. <b>You now have shark arms.</b>");
	player.arms.type = Arms.SHARK;
	doNext(accessPage1ArmsMenu);
}
private function metamorphSharkTail():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.tailType == Tail.NONE) outputText("\n\nJets of pain shoot down your spine, causing you to gasp in surprise and fall to your hands and knees. Feeling a bulging at the end of your back, you lower your [armor] down just in time for a fully formed shark tail to burst through. You swish it around a few times, surprised by how flexible it is. After some modifications to your clothing, you're ready to go with your brand new shark tail.");
	else outputText("\n\nJets of pain shoot down your spine into your tail. You feel the tail bulging out until it explodes into a large and flexible shark-tail. You swish it about experimentally, and find it quite easy to control.");
	player.tailType = Tail.SHARK;
	doNext(accessPage1TailMenu);
}
private function metamorphSpiderTail():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\n");
	if (player.tailType > Tail.NONE) outputText("Your tail shudders as heat races through it, twitching violently until it feels almost as if it's on fire. You jump from the pain at your [butt] and grab at it with your hands. It's huge... and you can feel it hardening under your touches, firming up until the whole tail has become rock-hard and spherical in shape. The heat fades, leaving behind a gentle warmth, and you realize your tail has become a spider's abdomen! With one experimental clench, you even discover that it can shoot webs from some of its spinnerets, both sticky and non-adhesive ones. That may prove useful. <b>You now have a spider's abdomen hanging from above your [butt]!</b>\n\n");
	else outputText("A burst of pain hits you just above your [butt], coupled with a sensation of burning heat and pressure. You can feel your " + player.skinFurScales() + " tearing as something forces its way out of your body. Reaching back, you grab at it with your hands. It's huge... and you can feel it hardening under your touches, firming up until the whole tail has become rock-hard and spherical in shape. The heat fades, leaving behind a gentle warmth, and you realize your tail has become a spider's abdomen! With one experimental clench, you even discover that it can shoot webs from some of its spinnerets, both sticky and non-adhesive ones. That may prove useful. <b>You now have a spider's abdomen hanging from above your [butt]!</b>");
	player.tailType = Tail.SPIDER_ADBOMEN;
	player.tailVenom = 5;
	player.tailRecharge = 5;
	doNext(accessPage1TailMenu);
}
private function metamorphSpiderArms():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\n");
	if (player.arms.type == Arms.HARPY || player.arms.type == Arms.HUMAN) {
		if (player.arms.type == Arms.HARPY) outputText("The feathers covering your arms fall away, leaving them to return to a far more human appearance. ");
		outputText("You watch, spellbound, while your forearms gradually become shiny. The entire outer structure of your arms tingles while it divides into segments, <b>turning the " + player.skinFurScales() + " into a shiny black carapace</b>. You touch the onyx exoskeleton and discover to your delight that you can still feel through it as naturally as your own skin.");
	}
	else {
		if (player.arms.type == Arms.BEE) outputText("The fizz covering your upper arms starting to fall down leaving only shiny black chitin clad arms.");
		else if (player.arms.type == Arms.SALAMANDER || player.arms.type == Arms.LIZARD || player.arms.type == Arms.DRAGON) outputText("The sclaes covering your upper arms starting to fall down leaving only shiny black chitin clad arms.");
		else if (player.arms.type == Arms.MANTIS) outputText("The long scythe extending from your wrist crumbling, while chitin covering your mantis arms slowly starting to change colors, <b>turning the " + player.skinFurScales() + " into a shiny black carapace</b>.");
		else outputText("You watch, spellbound, while your forearms gradually become shiny. The entire outer structure of your arms tingles while it divides into segments, <b>turning the " + player.skinFurScales() + " into a shiny black carapace</b>. You touch the onyx exoskeleton and discover to your delight that you can still feel through it as naturally as your own skin.");
	}
	player.arms.type = Arms.SPIDER;
	doNext(accessPage1ArmsMenu);
}
private function metamorphElfinEars():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nYour ears twitch once, twice, before starting to shake and tremble madly. They migrate back towards where your ears USED to be, so long ago, finally settling down before twisting and stretching, changing to become <b>new, pointed elfin ears.</b>");
	player.ears.type = Ears.ELFIN;
	doNext(accessPage1EarsMenu);
}
private function metamorphHarpyWings():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.wings.type > Wings.NONE) outputText("\n\nSensation fades from your " + player.wings.desc + " wings slowly but surely, leaving them dried out husks that break off to fall on the ground. Your back closes up to conceal the loss, as smooth and unbroken as the day you entered the portal.");
	outputText("\n\nPain lances through your back, the muscles knotting oddly and pressing up to bulge your [skin.type]. It hurts, oh gods does it hurt, but you can't get a good angle to feel at the source of your agony. A loud crack splits the air, and then your body is forcing a pair of narrow limbs through a gap in your [armor]. Blood pumps through the new appendages, easing the pain as they fill out and grow. Tentatively, you find yourself flexing muscles you didn't know you had, and <b>you're able to curve the new growths far enough around to behold your brand new, [haircolor] wings.</b>");
	player.wings.type = Wings.FEATHERED_LARGE;
	player.wings.desc = "large, feathered";
	doNext(accessPage1WingsMenu);
}
private function metamorphHarpyArms():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nAn avian plumage sprouts from your [skin.type], covering your forearms until <b>your arms look vaguely like wings</b>. Your hands remain unchanged thankfully. It'd be impossible to be a champion without hands! The feathery limbs might help you maneuver if you were to fly, but there's no way they'd support you alone.");
	player.arms.type = Arms.HARPY;
	doNext(accessPage1ArmsMenu);
}
private function metamorphHarpyTail():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.tailType > Tail.NONE) outputText("\n\nYour tail shortens, folding into the crack of your [butt] before it disappears. A moment later, a fan of feathers erupts in its place, fluffing up and down instinctively every time the breeze shifts. <b>You have a feathery harpy tail!</b>");
	else outputText("\n\nA tingling tickles the base of your spine, making you squirm in place. A moment later, it fades, but a fan of feathers erupts from your [skin.type] in its place. The new tail fluffs up and down instinctively with every shift of the breeze. <b>You have a feathery harpy tail!</b>");
	player.tailType = Tail.HARPY;
	doNext(accessPage1TailMenu);
}
private function metamorphBeeWingsLarge():void {
	clearOutput();
	player.soulforce -= 200;
	outputText("\n\nYour wings tingle as they grow, filling out until they are large enough to lift you from the ground and allow you to fly! <b>You now have large bee wings!</b> You give a few experimental flaps and begin hovering in place, a giddy smile plastered on your face by the thrill of flight.");
	player.wings.type = Wings.BEE_LIKE_LARGE;
	player.wings.desc = "large bee-like";
	doNext(accessPage1WingsMenu);
}
private function metamorphBeeWingsSmall():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nYou feel an itching between your shoulder-blades as something begins growing there. You twist and contort yourself, trying to scratch and bring yourself relief, and failing miserably. A sense of relief erupts from you as you feel something new grow out from your body. You hastily remove the top portion of your [armor] and marvel as a pair of small bee-like wings sprout from your back. Tenderly flexing your new muscles, you find you can flap them quite fast. Unfortunately you can't seem to flap your little wings fast enough to fly, but they would certainly slow a fall. A few quick modifications to your [armor] later and you are ready to continue your journey with <b>your new bee wings</b>.");
	player.wings.type = Wings.BEE_LIKE_SMALL;
	player.wings.desc = "small bee-like";
	doNext(accessPage1WingsMenu);
}
private function metamorphBeeTail():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.tailType > Tail.NONE) outputText("\n\nPainful swelling just above your [butt] doubles you over, and you hear the sound of your tail dropping off onto the ground! Before you can consider the implications, the pain gets worse, and you feel your backside bulge outward sickeningly, cracking and popping as a rounded bee-like abdomen grows in place of your old tail. It grows large enough to be impossible to hide, and with a note of finality, your stinger slides free with an audible 'snick'.");
	else outputText("\n\nPainful swelling just above your [butt] doubles you over. It gets worse and worse as the swollen lump begins to protrude from your backside, swelling and rounding with a series of pops until you have a bulbous abdomen hanging just above your butt. The whole thing is covered in a hard chitinous material, and large enough to be impossible to hide. You sigh as your stinger slides into place with a 'snick', finishing the transformation. <b>You have a bee's abdomen.</b>");
	player.tailType = Tail.BEE_ABDOMEN;
	player.tailVenom = 10;
	player.tailRecharge = 5;
	doNext(accessPage1TailMenu);
}
private function metamorphBeeArms():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\n");
	if (player.arms.type == Arms.SPIDER) outputText("On your upper arms slowly starting to grown yellow fuzz making them looks more like those of bee.");
	else if (player.arms.type == Arms.MANTIS) outputText("The long scythe extending from your wrist crumbling, while chitin covering your mantis arms slowly starting to change colors, <b>turning the " + player.skinFurScales() + " into a shiny black carapace</b>. Additionaly on your upper arms appear yellow fuzz.");
	else {
		if (player.arms.type == Arms.HARPY) outputText("The feathers covering your arms fall away, leaving them to return to a far more human appearance. ");
		outputText("You watch, spellbound, while your forearms gradually become shiny. The entire outer structure of your arms tingles while it divides into segments, <b>turning the " + player.skinFurScales() + " into a shiny black carapace</b>. A moment later the pain fades and you are able to turn your gaze down to your beautiful new arms, covered in shining black chitin from the upper arm down, and downy yellow fuzz along your upper arm.");
	}
	player.arms.type = Arms.BEE;
	doNext(accessPage1ArmsMenu);
}
private function metamorphBeeAntennae():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.antennae.type == Antennae.MANTIS) outputText("\n\nYour head itches momentarily as your two long prehensile antennae changes slowly into floppy ones similar to those seen at bees.");
	else outputText("\n\nYour head itches momentarily as two floppy antennae sprout from your " + hairDescript() + ".");
	player.antennae.type = Antennae.BEE;
	doNext(accessAntennaeMenuOld);
}
private function metamorphLizardEars():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nTightness centers on your scalp, pulling your ears down from their normal, fleshy shape into small, scaley bumps with holes in their centers. <b>You have reptilian ears!</b>");
	player.ears.type = Ears.LIZARD;
	doNext(accessPage1EarsMenu);
}
private function metamorphLizardTail():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.tailType == Tail.NONE) outputText("\n\nYou drop onto the ground as your spine twists and grows, forcing the flesh above your " + assDescript() + " to bulge out. New bones form, one after another, building a tapered, prehensile tail onto the back of your body. <b>You now have a reptilian tail!</b>");
	else outputText("\n\nYou drop to the ground as your tail twists and grows, changing its shape in order to gradually taper to a point. It flicks back and forth, prehensile and totally under your control. <b>You now have a reptilian tail.</b>");
	player.tailType = Tail.LIZARD;
	doNext(accessPage1TailMenu);
}
private function metamorphLizardArms():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nYou scratch at your biceps absentmindedly, but no matter how much you scratch, it isn't getting rid of the itch. After ignoring the sensation for a while, you finally glance down in irritation, only to discover that your arms had changed from it's former appearance to that of a lizard, one with leathery scales and short claws replacing your fingernails. <b>You now have a lizard arms.</b>");
	player.arms.type = Arms.LIZARD;
	doNext(accessPage2ArmsMenu);
}
private function metamorphHornsDraconicX4():void {
	clearOutput();
	player.soulforce -= 200;
	outputText("\n\nA second row of horns erupts under the first, and though they are narrower, they grow nearly as long as your first row before they stop. A sense of finality settles over you. <b>You have as many horns as a lizan can grow.</b>");
	player.horns.count = 12;
	player.horns.type = Horns.DRACONIC_X4_12_INCH_LONG;
	doNext(accessPage1HornsMenu);
}
private function metamorphHornsDraconicX2():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nYou feel your horns changing and warping, and reach back to touch them. They have a slight curve and a gradual taper. They must look something like the horns the dragons in your village's legends always had.");
	player.horns.count = 4;
	player.horns.type = Horns.DRACONIC_X2;
	doNext(accessPage1HornsMenu);
}
private function metamorphWingsDemonicLarge2():void {
	clearOutput();
	player.soulforce -= 300;
	outputText("\n\nYour large demonic wings starts to tremble and then starts to split from the tip. You stretch over your shoulder to stroke them as they divide, turning into two pairs of full-sized demon-wings. <b>Your demonic wings have splited into two pairs!</b>");
	player.wings.type = Wings.BAT_LIKE_LARGE_2;
	player.wings.desc = "two large pairs of bat-like";
	doNext(accessPage1WingsMenu);
}
private function metamorphWingsDemoncLarge():void {
	clearOutput();
	player.soulforce -= 200;
	outputText("\n\nYour small demonic wings stretch and grow, tingling with the pleasure of being attached to such a tainted body. You stretch over your shoulder to stroke them as they unfurl, turning into full-sized demon-wings. <b>Your demonic wings have grown!</b>");
	player.wings.type = Wings.BAT_LIKE_LARGE;
	player.wings.desc = "large, bat-like";
	doNext(accessPage1WingsMenu);
}
private function metamorphWingsDemonicTiny():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.wings.type != Wings.NONE) removeOldWings();
	outputText("\n\nA knot of pain forms in your shoulders as they tense up. With a surprising force, a pair of small demonic wings sprout from your back, ripping a pair of holes in the back of your [armor]. <b>You now have tiny demonic wings</b>.");
	player.wings.type = Wings.BAT_LIKE_TINY;
	player.wings.desc = "tiny, bat-like";
	doNext(accessPage1WingsMenu);
}

private function metamorphHornsDemonic():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.horns.count < 12 && (player.horns.type == Horns.NONE || player.horns.type == Horns.DEMON)) {
		outputText("\n\n");
		if (player.horns.count == 0) {
			outputText("A small pair of demon horns erupts from your forehead. They actually look kind of cute. <b>You have horns!</b>");
		}
		else outputText("Another pair of demon horns, larger than the last, forms behind the first row.");
		if (player.horns.type == Horns.NONE) player.horns.type = Horns.DEMON;
		player.horns.count++;
		player.horns.count++;
	}
	else if (player.horns.type > Horns.DEMON && player.horns.type != Horns.ORCHID) {
		outputText("\n\n");
		outputText("Your horns shift, shrinking into two small demonic-looking horns.");
		player.horns.count = 2;
		player.horns.type = Horns.DEMON;
	}
	doNext(accessPage1HornsMenu);
}
private function metamorphTailDemonic():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.tailType != Tail.NONE) {
		outputText("\n\n");
		if (player.tailType == Tail.SPIDER_ADBOMEN || player.tailType == Tail.BEE_ABDOMEN) outputText("You feel a tingling in your insectile abdomen as it stretches, narrowing, the exoskeleton flaking off as it transforms into a flexible demon-tail, complete with a round spaded tip. ");
		else outputText("You feel a tingling in your tail. You are amazed to discover it has shifted into a flexible demon-tail, complete with a round spaded tip. ");
		outputText("<b>Your tail is now demonic in appearance.</b>");
	}
	else outputText("\n\nA pain builds in your backside... growing more and more pronounced. The pressure suddenly disappears with a loud ripping and tearing noise. <b>You realize you now have a demon tail</b>... complete with a cute little spade.");
	player.tailType = Tail.DEMONIC;
	doNext(accessPage1TailMenu);
}
private function metamorphKitsuneSkinPattern():void {
	clearOutput();
	player.soulforce -= 100;
	outputText("\n\nYou feel a crawling sensation on the surface of your skin, starting at the small of your back and spreading to your extremities, ultimately reaching your face. You are caught by surprise when you are suddenly assaulted by a blinding flash issuing from areas of your skin, and when the spots finally clear from your vision, an assortment of glowing magical tattoos adorns your [skin]. The glow gradually fades, but the distinctive ");
	if (rand(2) == 0) outputText("angular");
	else outputText("curved");
	outputText(" markings remain, as if etched into your skin. <b>You now have Kitsune tattooed skin.</b>");
	player.skin.base.pattern = Skin.PATTERN_MAGICAL_TATTOO;
	player.skin.base.adj = "sexy tattooed";
	doNext(accessSkinPatternsMenuOld);
}
private function metamorphKitsuneArms():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.arms.type != Arms.HUMAN) restoreHumanArms();
	outputText("\n\nYour finger tingle as your nails sharpen to point. You run them on a tree bark and they feel way harder than your old human nails. <b>You will be able to claw at your opponent with your sharp kitsune nails.</b>");
	player.arms.type = Arms.KITSUNE;
	doNext(accessPage1ArmsMenu);
}
private function metamorphTailFox9th():void {
	clearOutput();
	player.soulforce -= 900;
	outputText("A tingling pressure builds on your backside, and your bushy tails begin to glow with an eerie, ghostly light. With a crackle of electrical energy, one of your tails splits in two, giving you " + num2Text(player.tailCount + 1) + "! <b>You now have a cluster of " + num2Text(player.tailCount + 1) + " fox-tails.</b>");
	player.tailCount++;
	doNext(accessPage2TailMenu);
}
private function metamorphTailFox8th():void {
	clearOutput();
	player.soulforce -= 800;
	outputText("A tingling pressure builds on your backside, and your bushy tails begin to glow with an eerie, ghostly light. With a crackle of electrical energy, one of your tails splits in two, giving you " + num2Text(player.tailCount + 1) + "! <b>You now have a cluster of " + num2Text(player.tailCount + 1) + " fox-tails.</b>");
	player.tailCount++;
	doNext(accessPage2TailMenu);
}
private function metamorphTailFox7th():void {
	clearOutput();
	player.soulforce -= 700;
	outputText("A tingling pressure builds on your backside, and your bushy tails begin to glow with an eerie, ghostly light. With a crackle of electrical energy, one of your tails splits in two, giving you " + num2Text(player.tailCount + 1) + "! <b>You now have a cluster of " + num2Text(player.tailCount + 1) + " fox-tails.</b>");
	player.tailCount++;
	doNext(accessPage2TailMenu);
}
private function metamorphTailFox6th():void {
	clearOutput();
	player.soulforce -= 600;
	outputText("A tingling pressure builds on your backside, and your bushy tails begin to glow with an eerie, ghostly light. With a crackle of electrical energy, one of your tails splits in two, giving you " + num2Text(player.tailCount + 1) + "! <b>You now have a cluster of " + num2Text(player.tailCount + 1) + " fox-tails.</b>");
	player.tailCount++;
	doNext(accessPage2TailMenu);
}
private function metamorphTailFox5th():void {
	clearOutput();
	player.soulforce -= 500;
	outputText("A tingling pressure builds on your backside, and your bushy tails begin to glow with an eerie, ghostly light. With a crackle of electrical energy, one of your tails splits in two, giving you " + num2Text(player.tailCount + 1) + "! <b>You now have a cluster of " + num2Text(player.tailCount + 1) + " fox-tails.</b>");
	player.tailCount++;
	doNext(accessPage2TailMenu);
}
private function metamorphTailFox4th():void {
	clearOutput();
	player.soulforce -= 400;
	outputText("A tingling pressure builds on your backside, and your bushy tails begin to glow with an eerie, ghostly light. With a crackle of electrical energy, one of your tails splits in two, giving you " + num2Text(player.tailCount + 1) + "! <b>You now have a cluster of " + num2Text(player.tailCount + 1) + " fox-tails.</b>");
	player.tailCount++;
	doNext(accessPage2TailMenu);
}
private function metamorphTailFox3rd():void {
	clearOutput();
	player.soulforce -= 300;
	outputText("A tingling pressure builds on your backside, and your bushy tails begin to glow with an eerie, ghostly light. With a crackle of electrical energy, one of your tails splits in two, giving you " + num2Text(player.tailCount + 1) + "! <b>You now have a cluster of " + num2Text(player.tailCount + 1) + " fox-tails.</b>");
	player.tailCount++;
	doNext(accessPage2TailMenu);
}
private function metamorphTailFox2nd():void {
	clearOutput();
	player.soulforce -= 200;
	outputText("A tingling pressure builds on your backside, and your bushy tail begins to glow with an eerie, ghostly light. With a crackle of electrical energy, your tail splits into two! <b>You now have a pair of fox-tails.</b>");
	player.tailCount++;
	doNext(accessPage2TailMenu);
}
private function metamorphTailFox():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.tailType == Tail.NONE) outputText("A pressure builds on your backside. You feel under your [armor] and discover a strange nodule growing there that seems to be getting larger by the second. With a sudden flourish of movement, it bursts out into a long and bushy tail that sways hypnotically, as if it had a mind of its own. <b>You now have a fox's tail!</b>");
	else outputText("Pain lances through your lower back as your tail shifts violently. With one final aberrant twitch, it fluffs out into a long, bushy fox tail that whips around in an almost hypnotic fashion. <b>You now have a fox's tail!</b>");
	player.tailType = Tail.FOX;
	player.tailCount = 1;
	doNext(accessPage2TailMenu);
}
private function metamorphEarsFox():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.ears.type == Ears.HUMAN || player.ears.type == Ears.ELFIN || player.ears.type == Ears.LIZARD) {
		outputText("The sides of your face painfully stretch as your ears elongate and begin to push past your hairline, toward the top of your head. They elongate, becoming large vulpine triangles covered in bushy fur. <b>You now have fox ears.</b>");
	}
	else {
		outputText("Your ears change, shifting from their current shape to become vulpine in nature. <b>You now have fox ears.</b>");
	}
	player.ears.type = Ears.FOX;
	doNext(accessPage1EarsMenu);
}
private function metamorphArmsFox():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.arms.type != Arms.HUMAN) restoreHumanArms();
	outputText("Your arms and hands start covering in fur at an alarming rate suddenly as you poke at your palms you jolt up as they become extremely sensitive turning into paw pads heck your nails transformed into wolf like claws so no wonder you felt it that much. <b>You now have pawed hands.</b>");
	player.arms.type = Arms.FOX;
	doNext(accessPage1ArmsMenu);
}
private function metamorphFishGills():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.gills.type == Gills.ANEMONE) {
		outputText("\n\nYou feel your gills tingle, a vague numbness registering across thier feathery exterior. You watch in awe as your gill's feathery folds dry out and fall off like crisp autumn leaves. The slits of your gills then"
		 +" rearrange themselves, becoming thinner and shorter, as they shift to the sides of your neck. They now close in a way that makes them almost invisible. As you run a finger over your neck you feel little more than several"
		 +" small raised lines where they meet your skin.");
	}
	else {
		outputText("\n\nYou feel a sudden tingle on your neck. You reach up to it to feel, whats the source of it. When you touch your neck, you feel that it begins to grow serveral narrow slits which slowly grow longer. After the changes"
		 +" have stopped you quickly head to a nearby puddle to take a closer look at your neck. You realize, that your neck has grown gills allowing you to breathe under water as if you were standing on land.");
	}
	outputText("\n\n<b>You now have fish like gills!</b>");
	player.gills.type = Gills.FISH;
	doNext(accessGillsMenuOld);
}
//all skin types TF effects goes here
/*private function metamorphTattoed():void {
	clearOutput();
	player.soulforce -= 100;

	doNext(accessMetamorphMenu);
}*/
private function metamorphDragonScales():void {
	clearOutput();
	player.soulforce -= 150;
	outputText("\n\nPrickling discomfort suddenly erupts all over your body, like every last inch of your skin has suddenly developed pins and needles. You scratch yourself, hoping for relief; and when you look at your hands you notice small fragments of your " + player.skinFurScales() + " hanging from your fingers. Nevertheless you continue to scratch yourself, and when you're finally done, you look yourself over. New shield-like scales have grown to replace your peeled off " + player.skinFurScales() + ". They are smooth and look nearly as tough as iron. ");
	var color:String;
	if (rand(10) == 0) {
		color = randomChoice("purple","silver");
	} else {
		color = randomChoice("red","green","white","blue","black");
	}
	outputText("<b>Your body is now fully covered in " + color + " shield-shaped dragon scales.</b>");
	player.skin.growCoat(Skin.DRAGON_SCALES,{color:color});
	doNext(accessSkinMenuOld);
}
private function metamorphChitin():void {
	clearOutput();
	player.soulforce -= 100;
	var chitinColor:String;
	if (rand(2) == 0) chitinColor = "pale white";
	else chitinColor = "green";
	if (player.hasCoat()) {
		outputText("\n\nA slowly-building itch spreads over your whole body, and as you idly scratch yourself, you find that your [skin coat] [skin coat.isare] falling to the ground, revealing flawless, " + chitinColor + " chitin underneath.");
	} else {
		outputText("\n\nA slowly-building itch spreads over your whole body, and as you idly scratch yourself, you find that your skin stating to harden turning slowly into chitin.");
	}
	outputText(" <b>You now have " + chitinColor + " chitin exoskeleton covering your body.</b>");
	player.skin.growCoat(Skin.CHITIN,{adj:"",color:chitinColor});
	doNext(accessSkinMenuOld);
}
private function metamorphScales():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.skinType == Skin.FUR) {
		if (rand(10) == 0) {
			if (rand(2) == 0) player.coatColor = "purple";
			else player.coatColor = "silver";
		}
		else {
			switch (rand(5)) {
				case 0:
					player.coatColor = "red";
					break;
				case 1:
					player.coatColor = "green";
					break;
				case 2:
					player.coatColor = "white";
					break;
				case 3:
					player.coatColor = "blue";
					break;
				default:
					player.coatColor = "black";
					break;
			}
		}
		outputText("\n\nYou scratch yourself, and come away with a large clump of [skin coat.color] fur. Panicked, you look down and realize that your fur is falling out in huge clumps. It itches like mad, and you scratch your body relentlessly, shedding the remaining fur with alarming speed. Underneath the fur your skin feels incredibly smooth, and as more and more of the stuff comes off, you discover a seamless layer of " + player.coatColor + " scales covering most of your body. The rest of the fur is easy to remove. <b>You're now covered in scales from head to toe.</b>");
	}
	else {
		outputText("\n\nYou idly reach back to scratch yourself and nearly jump out of your [armor] when you hit something hard. A quick glance down reveals that scales are growing out of your " + player.skinTone + " skin with alarming speed. As you watch, the surface of your skin is covered in smooth scales. They interlink together so well that they may as well be seamless. You peel back your [armor] and the transformation has already finished on the rest of your body. ");
		if (rand(10) == 0) {
			if (rand(2) == 0) player.coatColor = "purple";
			else player.coatColor = "silver";
		}
		else {
			switch (rand(5)) {
				case 0:
					player.coatColor = "red";
					break;
				case 1:
					player.coatColor = "green";
					break;
				case 2:
					player.coatColor = "white";
					break;
				case 3:
					player.coatColor = "blue";
					break;
				default:
					player.coatColor = "black";
					break;
			}
		}
		outputText("<b>You're covered from head to toe in shiny " + player.coatColor + " scales.</b>");
	}
	player.skin.growCoat(Skin.SCALES,{color:player.coatColor});
	doNext(accessSkinMenuOld);
}
private function metamorphFur():void {
	clearOutput();
	player.soulforce -= 100;
	if (player.skinType == Skin.SCALES) outputText("Your skin shifts and every scale stands on end, sending you into a mild panic. No matter how you tense, you can't seem to flatten them again. The uncomfortable sensation continues for some minutes until, as one, every scale falls from your body and a fine coat of fur pushes out. You briefly consider collecting them, but when you pick one up, it's already as dry and brittle as if it were hundreds of years old. <b>Oh well; at least you won't need to sun yourself as much with your new fur.</b>");
	else outputText("Your skin itches all over, the sudden intensity and uniformity making you too paranoid to scratch. As you hold still through an agony of tiny tingles and pinches, fine, luxuriant fur sprouts from every bare inch of your skin! <b>You'll have to get used to being furry...</b>");
	player.skin.growFur();
	doNext(accessSkinMenuOld);
}

private function removeOddEyes():void {
	if (player.eyes.type == Eyes.BLACK_EYES_SAND_TRAP) {
		outputText("\n\nYou feel a twinge in your eyes and you blink. It feels like black cataracts have just fallen away from you, and you know without needing to see your reflection that your eyes have gone back to looking human.");
	}
	else {
		outputText("\n\nYou blink and stumble, a wave of vertigo threatening to pull your [feet] from under you. As you steady and open your eyes, you realize something seems different. Your vision is changed somehow.");
		if (player.eyes.type == Eyes.SPIDER) outputText(" Your multiple, arachnid eyes are gone!</b>");
		outputText(" <b>You have normal, humanoid eyes again.</b>");
	}
	player.eyes.type = Eyes.HUMAN;
}
private function removeOldWings():void {
	outputText("\n\nSensation fades from your " + player.wings.desc + " wings slowly but surely, leaving them dried out husks that break off to fall on the ground. Your back closes up to conceal the loss, as smooth and unbroken as the day you entered the portal.");
	player.wings.type = Wings.NONE;
	player.wings.desc = "non-existant";
}
private function restoreHumanEars():void {
	outputText("\n\nOuch, your head aches! It feels like your ears are being yanked out of your head, and when you reach up to hold your aching noggin, you find they've vanished! Swooning and wobbling with little sense of balance, you nearly fall a half-dozen times before <b>a pair of normal, human ears sprout from the sides of your head.</b> You had almost forgotten what human ears felt like!");
	player.ears.type = Ears.HUMAN;
}
private function restoreHumanLegs():void {
	if (player.isTaur()) {
		outputText("\n\nYour quadrupedal hind-quarters seizes, overbalancing your surprised front-end and causing you to stagger and fall to your side. Pain lances throughout, contorting your body into a tightly clenched ball of pain while tendons melt and bones break, melt, and regrow. When it finally stops, <b>you look down to behold your new pair of human legs</b>!");
	}
	else {
		if (player.isGoo()) {
			outputText("\n\nYour lower body rushes inward, molding into two leg-like shapes that gradually stiffen up. In moments they solidify into normal-looking legs, complete with regular, human feet.");
		}
		if (player.isNaga()) {
			outputText("\n\nYou collapse as your sinuous snake-tail tears in half, shifting into legs. The pain is immense, particularly where your new feet are forming.");
		}
		if (player.isScylla()) {
			outputText("\n\nYou collapse as your tentacle legs starts to merge. The pain is immense, particularly where your new feet are forming.");
		}
		//(Non-human -> Normal Human Legs)
		if (player.isBiped() && player.lowerBody != LowerBody.HUMAN) {
			outputText("\n\nYou collapse as your legs shift and twist. By the time the pain subsides, you notice that you have normal legs and normal feet.");
		}
		outputText(" <b>You now have normal feet!</b>");
	}
	player.lowerBody = LowerBody.HUMAN;
	player.legCount = 2;
}
private function restoreHumanArms():void {
	outputText("You scratch at your biceps absentmindedly, but no matter how much you scratch, it isn't getting rid of the itch. Glancing down in irritation, you discover that your ");
	if (player.arms.type == Arms.HARPY || player.arms.type == Arms.PHOENIX || player.arms.type == Arms.AVIAN) {
		outputText("feathery arms are shedding their feathery coating. The wing-like shape your arms once had is gone in a matter of moments, leaving [skin.type] behind.");
	}
	if (player.arms.type == Arms.SPIDER) {
		outputText("arms' chitinous covering is flaking away. The glossy black coating is soon gone, leaving [skin.type] behind.");
	}
	if (player.arms.type == Arms.MANTIS) {
		outputText("arms' chitinous covering is flaking away and scythe shrinking until it vanish completly. The glossy green coating is soon gone, leaving [skin.type] behind.");
	}
	if (player.arms.type == Arms.BEE) {
		outputText("arms' chitinous covering and fuzz is flaking away. The glossy black and yellow coating is soon gone, leaving [skin.type] behind.");
	}
	if (player.arms.type == Arms.SALAMANDER || player.arms.type == Arms.LIZARD || player.arms.type == Arms.DRAGON) {
		outputText("arms' scales are flaking away. The leathery ");
		if (player.arms.type == Arms.SALAMANDER) outputText("red ");
		outputText("scales are soon gone, leaving [skin.type] behind.");
	}
	if (player.arms.type == Arms.PLANT || player.arms.type == Arms.PLANT2) {
		outputText("arms' vines are withering. Leaves also falling donw, leaving [skin.type] behind.");
	}
	if (player.arms.type == Arms.SHARK || player.arms.type == Arms.ORCA) {
		outputText("arms' fin suddenly fell down, leaving [skin.type] behind. Also webbing between your fingers slowly disappearing.");
	}
	if (player.arms.type == Arms.WOLF || player.arms.type == Arms.FOX || player.arms.type == Arms.LION || player.arms.type == Arms.YETI || player.arms.type == Arms.DEVIL || player.arms.type == Arms.CAT || player.arms.type == Arms.BOAR || player.arms.type == Arms.DISPLACER) {
		outputText("arms' [skin coat.color] fur is flaking away, leaving [skin.type] behind. Also the claws on your fingers reverts back into ordinary nails");
		if (player.arms.type == Arms.DISPLACER) outputText(" and both pairs fuse back into one");
		outputText(".");
	}
	if (player.arms.type == Arms.ELF || player.arms.type == Arms.KITSUNE || player.arms.type == Arms.ONI || player.arms.type == Arms.RAIJU || player.arms.type == Arms.PIG) {
		outputText("arms' claws retracting back into ordinary nails. You hand looks human again.");
	}
	if (player.arms.type == Arms.BAT) {
		outputText("bones are breaking down and reforming in a frenzy. Your parchment-like skin begins to fall off in clumps, leaving the mess of malformed bones that are your arms right now naked for all to see. However, even as you watch, dark blood creeps over the bone, properly aligning them before healing them over, although not in their old form. Within seconds, your bones are remade into ones alike those you were born with, in structure if nothing else, the eldritch power of your blood finally ebbing away, but not before the last of it settles and turns into a brand new patch of skin.");
	}
	outputText("\n\n");
	player.arms.type = Arms.HUMAN;
}
	}
}
