package classes.Items.Consumables
{
import classes.BodyParts.BodyMaterial;
import classes.BodyParts.Skin;
import classes.CoC;
import classes.EngineCore;
import classes.ItemType;
import classes.Items.Consumable;
import classes.Scenes.SceneLib;

public class HairDye extends Consumable
	{
		private var _color:String;

		public function HairDye(id:String, color:String, value:int = 6)
		{
			_color = color.toLowerCase();
			var shortName:String = color + " Dye";
			var longName:String = "a vial of " + _color + " hair dye";
			var description:String = "This bottle of dye will allow you to change the color of your hair, fur, scales or chitin.";
			super(id, shortName, longName, value, description);
		}
		
		override public function canUse():Boolean {
			return true;
		}
		
		override public function useItem():Boolean {
			clearOutput();
			EngineCore.menu();
			if (player.blockingBodyTransformations()){
				EngineCore.addButtonDisabled(0, "Immune", "Your body is immune to any and all transformations.");
			} else {
				outputText("What do you want to dye "+_color+"?\n");
				var i:int = 0;
				for each (var type:int in [
						BodyMaterial.HAIR,
						BodyMaterial.FUR,
						BodyMaterial.SCALES,
						BodyMaterial.CHITIN,
				]) {
					var name:String = BodyMaterial.Types[type].name;
					var itemReq:ItemType = game.useables.REAGENT;
					var itemCnt:int = 0;
					if (type == BodyMaterial.SCALES) {
						itemCnt = 1;
						if (player.coatType() == Skin.DRAGON_SCALES) itemCnt = 2;
					} else if (type == BodyMaterial.CHITIN) {
						itemCnt = 2;
					}
					
					var present:Boolean = player.hasBodyMaterial(type);
					if (present) {
						outputText("\nYou have " + player.bodyMaterialColor(type) + " " + name + ". ");
					} else {
						outputText("\nYou have no " + name + ". ");
					}
					var hint:String = "";
					if (itemReq != ItemType.NOTHING && itemCnt > 0) {
						hint = "You'll need "+itemReq.shortName+" x "+itemCnt+" to dye your "+name;
						if (present) {
							outputText("You'll need " + itemReq.shortName + " x " + itemCnt + " to dye your " + name + ".");
						}
					}
					
					EngineCore.button(i++)
							.show(
									capitalizeFirstLetter(name),
									curry(dye, type, itemReq, itemCnt),
									hint)
							.disableIf(itemReq != ItemType.NOTHING && itemCnt > 0 && !player.hasItem(itemReq, itemCnt),
									"You don't have enough "+itemReq.shortName+" ("+itemCnt+" needed)")
							.disableIf(player.bodyMaterialColor(type) == _color,
									"You already have "+_color+" "+name+"!")
							.disableIf(!present,
									"You don't have any "+name+" on your body!");
				}
			}
			EngineCore.addButton(14, "Nevermind", dyeCancel);
			return true;
		}
		private function dye(material:int, itemReq:ItemType, itemCnt:int):void {
			clearOutput();
			if (material == BodyMaterial.HAIR) {
				// TODO should check hairAdj
				if (player.hairColor.indexOf("rubbery") != -1 || player.hairColor.indexOf("latex-textured") != -1) {
					outputText("You massage the dye into your [hair] but the dye cannot penetrate the impermeable material your hair is composed of.");
					return;
				}
				outputText("You rub the dye into your [hair], then use a bucket of cool lakewater to rinse it off a few minutes later.  ");
				player.hairColor = _color;
				outputText("You now have [hair]!");
			} else {
				outputText("You rub the dye into your " + BodyMaterial.Types[material].name + ", then use a bucket of cool lakewater to rinse it off a few minutes later.  ");
				player.setBodyMaterialColor(material, _color);
			}
			if (game.player.lust > 50) {
				outputText("\n\nThe cool water calms your urges somewhat, letting you think more clearly.");
				game.player.dynStats("lus", -15);
			}
			if (itemReq != ItemType.NOTHING && itemCnt > 0) player.consumeItem(itemReq, itemCnt);
			CoC.instance.mainViewManager.updateCharviewIfNeeded();
			SceneLib.inventory.itemGoNext();
		}
		
		private function dyeCancel():void {
			clearOutput();
			outputText("You put the dye away.\n\n");
			SceneLib.inventory.returnItemToInventory(this);
		}
	}
}
